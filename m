From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 6 May 2010 23:27:58 +0200
Subject: [Buildroot] [git commit master] wpa_supplicant: Fix build with
	external toolchain
Message-ID: <20100506212940.357808B86C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=34d7dc874ad8536ba9e0f6f07e5bdfce5a82c51c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    3 ++-
 package/wpa_supplicant/wpa_supplicant.mk |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0476fb0..46939f0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,8 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: hal, mplayer, pciutils,
-	xdriver_xf86-video-openchrome, usb_modeswitch, usbutils
+	xdriver_xf86-video-openchrome, usb_modeswitch, usbutils,
+	wpa_supplicant
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 01436b1..c6bb058 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -33,6 +33,7 @@ $(eval $(call AUTOTARGETS,package,wpa_supplicant))
 $(WPA_SUPPLICANT_TARGET_CONFIGURE):
 	cp $(WPA_SUPPLICANT_DIR)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
 	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
+	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "CC = $(TARGET_CC)" >>$(WPA_SUPPLICANT_CONFIG)
 	$(SED) "s/\/local//" $(WPA_SUPPLICANT_DIR)/wpa_supplicant/Makefile
 ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
-- 
1.6.3.3
