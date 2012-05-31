From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 May 2012 11:32:58 -0000
Subject: [Buildroot] [git commit] package: add fbterm,
	a framebuffer-based terminal emulator
Message-ID: <20120531113257.8FBAA96E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=beeacca5f804841ffd1ed03532a9e5b0ca5937ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix dependencies / white space]
Signed-off-by: Dmitry <golubovsky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/fbterm/Config.in |   13 +++++++++++++
 package/fbterm/fbterm.mk |   12 ++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8cb3b22..5d6250c 100644
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
index 0000000..1e4ab4c
--- /dev/null
+++ b/package/fbterm/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FBTERM
+	bool "fbterm"
+	depends on (BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_LIBERATION
+	help
+	  fbterm is a fast terminal emulator for Linux with frame buffer
+	  device or VESA video card.
+
+	  http://code.google.com/p/fbterm/
+
+comment "fbterm requires a toolchain with C++, WCHAR and locale support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
new file mode 100644
index 0000000..ddb5b2b
--- /dev/null
+++ b/package/fbterm/fbterm.mk
@@ -0,0 +1,12 @@
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
