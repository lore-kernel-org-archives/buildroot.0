From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 13 Sep 2013 11:46:01 -0400
Subject: [Buildroot] [PATCH 1/1] erlang: pass erl_xcomp_sysroot to configure
Message-ID: <1379087161-23062-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is required for building the 'crypto', 'odbc', 'ssh'
and 'ssl' Erlang applications. These apps are skipped
regardless of whether they're enabled and their dependencies
can be met if this environment variable isn't set.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/erlang.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 89104c9..b219740 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -17,6 +17,10 @@ ERLANG_INSTALL_STAGING = YES
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
 
+# Set erl_xcomp variables. See xcomp/erl-xcomp.conf.template
+# for documentation.
+ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
+
 ERLANG_CONF_OPT = --without-javac
 HOST_ERLANG_CONF_OPT = --without-javac
 
-- 
1.8.1.2
