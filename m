From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:01:20 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: embed all RS9113
 firmware files to target image
Message-ID: <20191026125456.373D68838A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=245beea242e6bf770f0e3b8092b63b4b0502832c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only rs9113_wlan_qspi.rps firmware was present on generated image.

Signed-off-by: Adrien Ricciardi <adrien.ricciardi@hotmail.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 479a4d5635..5596651532 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -519,7 +519,10 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qla2xxx
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113),y)
-LINUX_FIRMWARE_FILES += rsi/rs9113_wlan_qspi.rps
+LINUX_FIRMWARE_FILES += \
+	rsi/rs9113_ap_bt_dual_mode.rps \
+	rsi/rs9113_wlan_bt_dual_mode.rps \
+	rsi/rs9113_wlan_qspi.rps
 # No license file; the license is in the file WHENCE
 # which is installed unconditionally
 endif
