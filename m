From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:55 -0000
Subject: [Buildroot] [git commit branch/next] sdl_sound: refactor *_CONF_OPT
	assignment with cpu-feature options
Message-ID: <20120802195250.AD5D290D1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cae0947b053bec39508c3c2e922ddcbd1f512225
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_sound/sdl_sound.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index a5d9a26..620b3b4 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -32,8 +32,7 @@ SDL_SOUND_CONF_OPT = \
 	--disable-sdltest \
 	--enable-static
 
-# enable mmx for newer x86's
-ifeq ($(BR2_i386)$(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 SDL_SOUND_CONF_OPT += --enable-mmx
 else
 SDL_SOUND_CONF_OPT += --disable-mmx
