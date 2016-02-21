From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 15:56:50 +0100
Subject: [Buildroot] [PATCH v2 4/4] package/sdl_sound: add
	--enable/disable-speex
In-Reply-To: <1456066610-32050-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456066610-32050-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456066610-32050-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: first revision

 package/sdl_sound/sdl_sound.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 861c932..4fa7d9b 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -39,7 +39,10 @@ SDL_SOUND_CONF_OPTS += --disable-ogg
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX),y)
+SDL_SOUND_CONF_OPTS += --enable-speex
 SDL_SOUND_DEPENDENCIES += speex
+else
+SDL_SOUND_CONF_OPTS += --disable-speex
 endif
 
 SDL_SOUND_CONF_OPTS = \
-- 
2.7.0
