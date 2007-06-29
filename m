From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 29 Jun 2007 18:51:41 +0300
Subject: [Buildroot] PATCH: sdl.mk.patch
Message-ID: <20070629185141.739b908a@newbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,
SDL-1.2.11-patch_PAGE_SIZE.patch is starting from upper case.
The patch below fixes sdl.mk so SDL-1.2.11-patch_PAGE_SIZE.patch is applied correctly.

Best regards, 
Ivan

---

Index: package/sdl/sdl.mk
===================================================================
--- package/sdl/sdl.mk	(revision 18970)
+++ package/sdl/sdl.mk	(working copy)
@@ -16,7 +16,7 @@
 
 $(SDL_DIR)/.unpacked: $(DL_DIR)/$(SDL_SOURCE)
 	$(SDL_CAT) $(DL_DIR)/$(SDL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SDL_DIR) package/sdl sdl\*.patch
+	toolchain/patch-kernel.sh $(SDL_DIR) package/sdl SDL\*.patch
 	touch $@
 
 $(SDL_DIR)/.configured: $(SDL_DIR)/.unpacked
 
