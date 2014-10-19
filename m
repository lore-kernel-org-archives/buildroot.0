From: Pedro Aguilar <paguilar@paguilar.org>
Date: Mon, 20 Oct 2014 00:36:53 +0200
Subject: [Buildroot] [PATCH 1/1] Add library libunistring that is used for
	advanced text processing.
Message-ID: <1413758213-30044-1-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/Config.in                    |  1 +
 package/libunistring/Config.in       | 12 ++++++++++++
 package/libunistring/libunistring.mk | 14 ++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/libunistring/Config.in
 create mode 100644 package/libunistring/libunistring.mk

diff --git a/package/Config.in b/package/Config.in
index 89b46dc..5a9c598 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -902,6 +902,7 @@ menu "Other"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/libunistring/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/libunistring/Config.in b/package/libunistring/Config.in
new file mode 100644
index 0000000..e0f524b
--- /dev/null
+++ b/package/libunistring/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBUNISTRING
+	bool "libunistring"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  The libunistring library provides functions for manipulating 
+	  Unicode strings and for manipulating C strings according to 
+	  the Unicode standard.
+
+	  http://www.gnu.org/software/libunistring/
+
+comment "libunistring needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
new file mode 100644
index 0000000..5bf75fe
--- /dev/null
+++ b/package/libunistring/libunistring.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libunistring
+#
+################################################################################
+
+LIBUNISTRING_VERSION = 0.9.4
+LIBUNISTRING_SOURCE  = libunistring-$(LIBUNISTRING_VERSION).tar.gz
+LIBUNISTRING_SITE    = http://ftp.gnu.org/gnu/libunistring
+LIBUNISTRING_INSTALL_STAGING = YES
+LIBUNISTRING_LICENSE = LGPLv2
+LIBUNISTRING_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
-- 
1.9.1
