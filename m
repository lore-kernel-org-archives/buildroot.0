From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:49:27 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
	Realtek rtl88xx firmware
Message-ID: <20140921175639.AB47B9D6E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=972fface166a2d3d3a2a6c74133ab768f5ac9374
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         |    5 +++++
 package/linux-firmware/linux-firmware.mk |    7 +++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index b909d2b..f1670e8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -126,6 +126,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
 	help
 	  Realtek 8712/8723/8723be
 
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
+	bool "Realtek 88xx"
+	help
+	  Realtek rtl8821ae
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127X"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9334177..c0641b9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -46,6 +46,13 @@ LINUX_FIRMWARE_FILES += rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin	\
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
+# rtl88xx
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX),y)
+LINUX_FIRMWARE_FILES += rtlwifi/rtl8821aefw.bin \
+			rtlwifi/rtl8821aefw_wowlan.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+endif
+
 # ar7010
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010),y)
 LINUX_FIRMWARE_FILES += ar7010.fw ar7010_1_1.fw htc_7010.fw
