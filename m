From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 14 Nov 2017 11:07:06 -0500
Subject: [Buildroot] [NEXT v2 1/7] libpjsip: remove disable-ext-sound option
Message-ID: <20171114160712.20086-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure option --disable-ext-sound currently isn't a valid option
in libpjsip. Originally it was used to prevent portaudio from building
in the third_party directory, however, portaudio no longer exists in that
directory.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Added this patch to the start of the series.

 package/libpjsip/libpjsip.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index c772d41..2eaefaf 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -37,7 +37,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-libwebrtc \
 	--disable-opus \
 	--disable-oss \
-	--disable-ext-sound \
 	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
-- 
2.13.6
