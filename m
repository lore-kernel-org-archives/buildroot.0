From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 23:32:06 +0200
Subject: [Buildroot] [git commit] package/sdl_mixer: drop unrecognized option
Message-ID: <20210422185156.DAA1281593@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=310008e02da38ead596a9fd0f33921831bc63a20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--without-x is not recognized since at least version 1.2.12:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --without-x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
