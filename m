From: Dmitry <golubovsky@gmail.com>
Date: Tue, 15 May 2012 22:36:06 -0400
Subject: [Buildroot] [PATCH] Added package fbterm: a framebuffer-based
	terminal emulator.
Message-ID: <1337135766-26862-1-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dmitry <golubovsky@gmail.com>
---
 package/Config.in        |    1 +
 package/fbterm/Config.in |   15 +++++++++++++++
 package/fbterm/fbterm.mk |   13 +++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/fbterm/Config.in
 create mode 100644 package/fbterm/fbterm.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..d2d5096 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -112,6 +112,7 @@ source "package/fbgrab/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/fbset/Config.in"
 endif
+source "package/fbterm/Config.in"
 source "package/fbv/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
new file mode 100644
index 0000000..ea5e5fa
--- /dev/null
+++ b/package/fbterm/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_FBTERM
+	bool "fbterm"
+	depends on (BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && \
+			BR2_TOOLCHAIN_BUILDROOT_CXX && BR2_USE_WCHAR)
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_LIBERATION
+	help
+	  fbterm is a fast terminal emulator for Linux with frame buffer
+	  device or VESA video card.
+
+	  http://code.google.com/p/fbterm/
+
+comment "fbterm requires a C++, WCHAR in toolchain and locale support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && \
+			BR2_TOOLCHAIN_BUILDROOT_CXX && BR2_USE_WCHAR)
diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
new file mode 100644
index 0000000..6b1d506
--- /dev/null
+++ b/package/fbterm/fbterm.mk
@@ -0,0 +1,13 @@
+############################################
+#
+# fbterm
+# 
+############################################
+
+FBTERM_VERSION = 1.7.0
+FBTERM_SITE = http://fbterm.googlecode.com/files/
+
+FBTERM_DEPENDENCIES = fontconfig liberation
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.2.5
