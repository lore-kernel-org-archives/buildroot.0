From: JoM <johann.mercadier@imerir.com>
Date: Mon, 26 Mar 2012 23:21:26 +0100
Subject: [Buildroot] [PATCH 2/2] do some needed text formatting
	Signed-off-by: JoM <johann.mercadier@imerir.com>
In-Reply-To: <1332800486-11104-1-git-send-email-johann.mercadier@imerir.com>
References: <1332800486-11104-1-git-send-email-johann.mercadier@imerir.com>
Message-ID: <1332800486-11104-2-git-send-email-johann.mercadier@imerir.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/fbterm/Config.in |   15 ++++++++-------
 package/fbterm/fbterm.mk |   12 +-----------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
index 0a36a9f..6a84a25 100644
--- a/package/fbterm/Config.in
+++ b/package/fbterm/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_FBTERM
 	bool "fbterm"
-	  select BR2_PACKAGE_FREETYPE
-	  select BR2_PACKAGE_FONTCONFIG
-	  select BR2_PACKAGE_ZLIB
-	  select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_EXPAT
 	help
-	  FbTerm (Frame buffer terminal emulator) is a fast terminal emulator and a 
-	  standalone replacement of GNU/Linux terminal that can function outside of
-	  Xorg with the frame buffer device or VESA video card.
+	  FbTerm (Frame buffer terminal emulator) is a fast terminal emulator 
+	  and a standalone replacement of GNU/Linux terminal that can 
+	  function outside of Xorg with the frame buffer device or VESA video
+	  card.
 	  
 	  http://code.google.com/p/fbterm/
diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index 44f63f1..d7e90ea 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -3,21 +3,11 @@
 # fbterm
 #
 #############################################################
-FBTERM_BINARY = fbterm
-FBTERM_TARGET_BINARY = usr/bin/$(FBTERM_BINARY)
 FBTERM_VERSION = 1.7.0
 FBTERM_SITE = http://fbterm.googlecode.com/files
 FBTERM_DEPENDENCIES += freetype fontconfig
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-	FBTERM_DEPENDENCIES += zlib
-endif
-
+FBTERM_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 FBTERM_DEPENDENCIES += $(if $(BR2_PACKAGE_EXPAT),expat)
 
-define FBTERM_UNINSTALL_CMDS
-	rm -f $(TARGET_DIR)/$(FBTERM_TARGET_BINARY)
-endef
-
-
 $(eval $(call AUTOTARGETS))
-- 
1.7.2.5
