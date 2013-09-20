From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Sep 2013 15:18:24 +0200
Subject: [Buildroot] [git commit] erlang: pass erl_xcomp_sysroot to configure
Message-ID: <20130920132138.D20039B80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=205d72c6861c9fe9fc62f398502e4ba3fd48a8b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is required for building the 'crypto', 'odbc', 'ssh'
and 'ssl' Erlang applications. These apps are skipped
regardless of whether they're enabled and their dependencies
can be met if this environment variable isn't set.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/erlang/erlang.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
 
