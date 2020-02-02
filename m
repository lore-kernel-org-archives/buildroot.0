From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2020 21:09:45 +0100
Subject: [Buildroot] [git commit] package/libpjsip: add sdl2 support
Message-ID: <20200202200006.6404C88476@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8330cfe5c5f8cd820577b2abd24c90bc10116dae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 655ab4498c..7736a005af 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -33,7 +33,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
-	--disable-sdl \
 	--disable-ffmpeg \
 	--disable-ipp \
 	--disable-silk \
@@ -122,6 +121,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-opus
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2),y)
+LIBPJSIP_DEPENDENCIES += sdl2
+LIBPJSIP_CONF_OPTS += --with-sdl=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-sdl
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 LIBPJSIP_CONF_OPTS += \
 	--enable-speex-aec \
