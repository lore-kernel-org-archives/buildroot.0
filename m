From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 19:23:31 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: add new option for
 Samsung MFC firmwares
Message-ID: <20201225180628.982618865B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1efcca35b26c31781b0be93a743cdf9bfa41f23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Multi format codec (MFC) is the IP present in Samsung Exynos series SoCs
for video encoding/decoding operations.

Signed-off-by: Stefan Agner <stefan@agner.ch>
[yann.morin.1998 at free.fr: add all FW versions]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         |  5 +++++
 package/linux-firmware/linux-firmware.mk | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 105daf42b8..dbdfdb52b3 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -44,6 +44,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO
 	help
 	  Firmware files for Qualcomm Adreno GPU firmware
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MFC_V8
+	bool "Samsung MFC video encoder/decoder v8 firmware"
+	help
+	  Firmware files for Samsung MFC video encoder/decoder driver v8
+
 endmenu # Video
 
 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c0ca98c45c..bc7650d758 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -39,6 +39,17 @@ LINUX_FIRMWARE_FILES += qcom/a*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom qcom/NOTICE.txt
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MFC_V8),y)
+LINUX_FIRMWARE_FILES += \
+	s5p-mfc.fw \
+	s5p-mfc-v6.fw \
+	s5p-mfc-v6-v2.fw \
+	s5p-mfc-v7.fw \
+	s5p-mfc-v8.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 # Intel Wireless Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
 LINUX_FIRMWARE_FILES += intel/ibt-*
