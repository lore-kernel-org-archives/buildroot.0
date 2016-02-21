From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 11:51:27 +0100
Subject: [Buildroot] [PATCH 6/7] package/sdl_sound: add optional support for
	libmodplug
In-Reply-To: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456051888-2047-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libmodplug was compiled before, sdl_sound will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libSDL_sound-1.0.so.1.0.2 | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libmodplug.so.1]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sdl_sound/sdl_sound.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 416f381..0e7f44d 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -21,6 +21,10 @@ ifeq ($(BR2_PACKAGE_FLAC),y)
 SDL_SOUND_DEPENDENCIES += flac # is only used if ogg is also enabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
+SDL_SOUND_DEPENDENCIES += libmodplug
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 SDL_SOUND_DEPENDENCIES += libvorbis
 endif
-- 
2.7.0
