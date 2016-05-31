From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 09:45:52 +0200
Subject: [Buildroot] [git commit] ltris: correct audio configure options
Message-ID: <20160531074724.8C3E881EE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=306878fa0291bc52ac5a835fb29670f50cbe868c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/555/555bfc97b39eb9b0f1e516ffb7ae375ca2c43d5f/

The configure options to enable/disable sound through sdl_mixer are called
--enable/--disable-sound, not --enable/--disable-audio.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltris/ltris.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index 530e11e..bbd270e 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -17,12 +17,12 @@ LTRIS_CONF_ENV = \
 
 ifeq ($(BR2_PACKAGE_LTRIS_AUDIO),y)
 LTRIS_DEPENDENCIES += sdl_mixer host-pkgconf
-LTRIS_CONF_OPTS += --enable-audio=yes
+LTRIS_CONF_OPTS += --enable-sound
 # configure script does NOT use pkg-config to figure out how to link
 # with sdl_mixer, breaking static linking as sdl_mixer can use libmad
 LTRIS_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs SDL_mixer`
 else
-LTRIS_CONF_OPTS += --disable-audio
+LTRIS_CONF_OPTS += --disable-sound
 endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
