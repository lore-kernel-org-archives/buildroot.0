From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 May 2015 10:40:28 -0300
Subject: [Buildroot] [PATCH] wine: fix alsa-related build error
Message-ID: <1430487628-9667-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The fix from 81230a5b3a27e315f0ba1334d7ab257812b7ab69 is incomplete.
BR2_PACKAGE_ALSA_LIB_RAWMIDI is required as well. Fixes:
http://autobuild.buildroot.org/results/018/018391c5e70d33bc0b5745ad7a2a273efa9be0d7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wine/wine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index a96060f..1ae038e 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -41,7 +41,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 WINE_CONF_OPTS += TARGETFLAGS="-b $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))"
 endif
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_SEQ),yy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_RAWMIDI),yyy)
 WINE_CONF_OPTS += --with-alsa
 WINE_DEPENDENCIES += alsa-lib
 else
-- 
2.0.5
