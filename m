From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 21 Jul 2008 10:07:59 +0200
Subject: [Buildroot] [PATCH 1/1] sdl_mixer: run CONFIG_UPDATE on correct
	directory
Message-ID: <1216627679-31619-1-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile tried to update config.guess and config.sub in the wrong
directories, this patch updates the correct scripts making it possible to
compile on new systems.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 package/sdl_mixer/sdl_mixer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 3c88eae..522e05d 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -16,7 +16,7 @@ sdl_mixer-source: $(DL_DIR)/$(SDL_MIXER_SOURCE)
 
 $(SDL_MIXER_DIR)/.unpacked: $(DL_DIR)/$(SDL_MIXER_SOURCE)
 	$(SDL_MIXER_CAT) $(DL_DIR)/$(SDL_MIXER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(SDL_MIXER_DIR)
+	$(CONFIG_UPDATE) $(SDL_MIXER_DIR)/build-scripts
 	touch $@
 
 $(SDL_MIXER_DIR)/.configured: $(SDL_MIXER_DIR)/.unpacked $(STAGING_DIR)/usr/lib/libSDL.so
-- 
1.5.4.3
