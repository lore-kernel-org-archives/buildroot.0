From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 15:15:26 +0100
Subject: [Buildroot] [git commit] package/libpjsip: add portaudio optional
 dependency
Message-ID: <20200205140443.236408C5ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7eb130cce3b6858711242884a1138e09d4996cee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpjsip/libpjsip.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index e1c3b511e8..447f76be7f 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -127,6 +127,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-opus
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+LIBPJSIP_DEPENDENCIES += portaudio
+LIBPJSIP_CONF_OPTS += --with-external-pa
+else
+LIBPJSIP_CONF_OPTS += --without-external-pa
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2),y)
 LIBPJSIP_DEPENDENCIES += sdl2
 LIBPJSIP_CONF_OPTS += --with-sdl=$(STAGING_DIR)/usr
