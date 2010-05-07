From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 8 May 2010 00:11:46 +0200
Subject: [Buildroot] [git commit master] hostapd: Fix build with external
	toolchain
Message-ID: <20100507223516.CC77D8F341@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6f4939d4c5624681bd7c0cbb92462f3d3fb941c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1717

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    7 ++++---
 package/hostapd/hostapd.mk |    1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 10ca888..f2c324b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,9 +2,9 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: customize, hal, mplayer, pciutils,
-	xdriver_xf86-video-openchrome, usb_modeswitch, usbutils,
-	wpa_supplicant
+	Updated/fixed packages: customize, hal, hostapd, mplayer,
+	pciutils, xdriver_xf86-video-openchrome, usb_modeswitch,
+	usbutils, wpa_supplicant
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -14,6 +14,7 @@
 	#1525: Package hal deletes a whole <target>/etc/rc.d directory
 	#1699: Fix usbutils dependencies and bump
 	#1705: Fix pciutils broken cross compiling
+	#1717: External toolchain fixes for hostapd & wpa_supplicant
 
 2010.05-rc1, Released May 3rd, 2010:
 
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 5c5c1e3..2359fd3 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -20,6 +20,7 @@ $(HOSTAPD_TARGET_CONFIGURE):
 	cp $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/defconfig $(HOSTAPD_CONFIG)
 	$(SED) "s/\/local//" $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/Makefile
 	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(HOSTAPD_CONFIG)
+	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(HOSTAPD_CONFIG)
 	echo "CC = $(TARGET_CC)" >>$(HOSTAPD_CONFIG)
 # IPv6
 ifneq ($(BR2_INET_IPV6),y)
-- 
1.6.3.3
