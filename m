From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 Feb 2020 23:07:17 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/libpjsip: add portaudio optional dependency
Message-ID: <20200203220717.2819748-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - portaudio is optional, not mandatory

 package/libpjsip/libpjsip.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index e1c3b511e8..6e413e35dd 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -127,6 +127,11 @@ else
 LIBPJSIP_CONF_OPTS += --disable-opus
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+LIBPJSIP_DEPENDENCIES += portaudio
+LIBPJSIP_CONF_OPTS += --with-external-pa
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2),y)
 LIBPJSIP_DEPENDENCIES += sdl2
 LIBPJSIP_CONF_OPTS += --with-sdl=$(STAGING_DIR)/usr
-- 
2.24.1
