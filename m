From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  6 Jan 2015 15:02:59 +0100
Subject: [Buildroot] [PATCH v5 01/16] package/erlang: export EI_VSN so other
	packages can use it
In-Reply-To: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
References: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1420552994-657-2-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Packages that depend on Erlang may need the Erlang Interface Version
(aka EI_VSN), so just export it.

We do export a static value instead of looking in the file, to avoid
spawning a shell every time the variable is dereferenced.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang/erlang.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 81ac436..0c76531 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# See note below when updating Erlang
 ERLANG_VERSION = 17.4
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
@@ -16,6 +17,10 @@ ERLANG_INSTALL_STAGING = YES
 # Touching erts/configure.in
 ERLANG_AUTORECONF = YES
 
+# Whenever updating Erlang, this value should be updated as well, to the
+# value of EI_VSN in the file lib/erl_interface/vsn.mk
+ERLANG_EI_VSN = 3.7.20
+
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
 
-- 
2.1.0
