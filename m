From: Mikael <mikael@robomagi.com>
Date: Sat, 11 Aug 2018 22:29:25 +0200
Subject: [Buildroot] [PATCH 1/1] libjwt: new package.
Message-ID: <20180811202925.3547-1-mikael@robomagi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mikael <mikael@robomagi.com>
---
 package/libjwt/Config.in   | 13 +++++++++++++
 package/libjwt/libjwt.hash |  2 ++
 package/libjwt/libjwt.mk   | 14 ++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/libjwt/Config.in
 create mode 100644 package/libjwt/libjwt.hash
 create mode 100644 package/libjwt/libjwt.mk

diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
new file mode 100644
index 0000000000..81e33e6d93
--- /dev/null
+++ b/package/libjwt/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBJWT
+	bool "libjwt"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_OPENSSL
+	help
+	  JSON Web Tokens are an open, industry standard RFC 7519
+	  method for representing claims securely between two parties.
+
+	  https://github.com/benmcollins/libjwt
+
+comment "libjwt needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
new file mode 100644
index 0000000000..c8b7ed168a
--- /dev/null
+++ b/package/libjwt/libjwt.hash
@@ -0,0 +1,2 @@
+#Locally computed
+sha256 cc694dfc3abe17d1f5cde4bf6714e39dc17f7cbad352a85ffb0fe6418c584076 libjwt-v1.9.0.tar.gz
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
new file mode 100644
index 0000000000..2007d6c541
--- /dev/null
+++ b/package/libjwt/libjwt.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libjwt
+#
+################################################################################
+
+LIBJWT_VERSION = v1.9.0
+LIBJWT_SITE = $(call github,benmcollins,libjwt,$(LIBJWT_VERSION))
+LIBJWT_INSTALL_STAGING = YES
+LIBJWT_DEPENDENCIES = jansson openssl
+LIBJWT_LICENSE = LGPL-3.0-only
+LIBJWT_LICENSE_FILES = COPYING.LIB
+
+$(eval $(cmake-package))
-- 
2.17.1
