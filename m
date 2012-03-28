From: Johann MERCADIER <johann.mercadier@imerir.com>
Date: Thu, 29 Mar 2012 00:56:10 +0100
Subject: [Buildroot] [PATCH 1/1] Change of the signing value using the real
	name Signed-off-by: Johann MERCADIER <johann.mercadier@imerir.com>
Message-ID: <1332978970-4319-1-git-send-email-johann.mercadier@imerir.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/fbterm/Config.in |   13 +++++++++++++
 package/fbterm/fbterm.mk |   13 +++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/fbterm/Config.in
 create mode 100644 package/fbterm/fbterm.mk

diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
new file mode 100644
index 0000000..6a84a25
--- /dev/null
+++ b/package/fbterm/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FBTERM
+	bool "fbterm"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_EXPAT
+	help
+	  FbTerm (Frame buffer terminal emulator) is a fast terminal emulator 
+	  and a standalone replacement of GNU/Linux terminal that can 
+	  function outside of Xorg with the frame buffer device or VESA video
+	  card.
+	  
+	  http://code.google.com/p/fbterm/
diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
new file mode 100644
index 0000000..d7e90ea
--- /dev/null
+++ b/package/fbterm/fbterm.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# fbterm
+#
+#############################################################
+FBTERM_VERSION = 1.7.0
+FBTERM_SITE = http://fbterm.googlecode.com/files
+FBTERM_DEPENDENCIES += freetype fontconfig
+
+FBTERM_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
+FBTERM_DEPENDENCIES += $(if $(BR2_PACKAGE_EXPAT),expat)
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.2.5
