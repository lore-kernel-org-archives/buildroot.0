From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 22:29:21 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: rename Realtek
 rtw88 option
Message-ID: <20200322211613.EDC8185F10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3817f0e87b96add0d0c63932dce0f0dd395849cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The newly introduced option does not follow the naming scheme of other
Realtek firmwares, in part because the model is not named rtl-something,
but rtw-something.

Rename the option to match the VENDOR_DEVICE scheme. We do not add a
legacy entry for this: we've had no release and it was pushed minutes
ago...

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 2 +-
 package/linux-firmware/linux-firmware.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index fa741f5407..fb884842d6 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -318,7 +318,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
 	help
 	  Realtek rtl8821ae
 
-config BR2_PACKAGE_LINUX_FIRMWARE_RTW88
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88
 	bool "Realtek rtw88"
 	help
 	  Firmware images supported by Realtek's wireless
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b90585daee..21300ddc72 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -113,7 +113,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
 # rtw88
-ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTW88),y)
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88),y)
 LINUX_FIRMWARE_FILES += \
 	rtw88/rtw8723d_fw.bin \
 	rtw88/rtw8822b_fw.bin \
