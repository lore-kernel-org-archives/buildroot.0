From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Apr 2021 12:05:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/sdl_mixer: drop unrecognized option
Message-ID: <20210410100554.3947392-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--without-x is not recognized since at least version 1.2.12:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --without-x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl_mixer/sdl_mixer.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 8402879e04..049ce15d1f 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -23,7 +23,6 @@ SDL_MIXER_DEPENDENCIES = sdl
 SDL_MIXER_AUTORECONF = YES
 
 SDL_MIXER_CONF_OPTS = \
-	--without-x \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--disable-music-mod \
 	--disable-music-mp3 \
-- 
2.30.2
