From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  6 Jan 2015 15:03:04 +0100
Subject: [Buildroot] [PATCH v5 06/16] erlang-p1-zlib: new package.
In-Reply-To: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
References: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1420552994-657-7-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                        |  1 +
 package/erlang-p1-zlib/Config.in         |  6 ++++++
 package/erlang-p1-zlib/erlang-p1-zlib.mk | 12 ++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/erlang-p1-zlib/Config.in
 create mode 100644 package/erlang-p1-zlib/erlang-p1-zlib.mk

diff --git a/package/Config.in b/package/Config.in
index 6db6c5c..038147f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -399,6 +399,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
 	source "package/guile/Config.in"
diff --git a/package/erlang-p1-zlib/Config.in b/package/erlang-p1-zlib/Config.in
new file mode 100644
index 0000000..583d856
--- /dev/null
+++ b/package/erlang-p1-zlib/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_ZLIB
+	bool "erlang-p1-zlib"
+	help
+	  Erlang interface to zlib
+
+	  https://github.com/processone/zlib
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
new file mode 100644
index 0000000..ae95cb4
--- /dev/null
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# erlang-p1-zlib
+#
+################################################################################
+
+ERLANG_P1_ZLIB_VERSION = 52e82bb
+ERLANG_P1_ZLIB_SITE = $(call github,processone,zlib,$(ERLANG_P1_ZLIB_VERSION))
+ERLANG_P1_ZLIB_LICENSE = GPLv2+
+ERLANG_P1_ZLIB_LICENSE_FILES = COPYING
+
+$(eval $(rebar-package))
-- 
2.1.0
