From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 12:33:40 +0100
Subject: [Buildroot] [git commit] package/libpjsip: add ffmpeg support
Message-ID: <20200203112242.323A588722@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c5e9f8253ab16f40f4715d4e516e3541a18d40e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpjsip/libpjsip.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 7736a005af..e1c3b511e8 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -33,7 +33,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
-	--disable-ffmpeg \
 	--disable-ipp \
 	--disable-silk \
 	--with-external-srtp
@@ -57,6 +56,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-bcg729
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+LIBPJSIP_DEPENDENCIES += ffmpeg
+LIBPJSIP_CONF_OPTS += --with-ffmpeg=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-ffmpeg
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGSM),y)
 LIBPJSIP_CONF_OPTS += \
 	--enable-gsm-codec \
