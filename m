From: Joris Offouga <offougajoris@gmail.com>
Date: Mon, 10 Jun 2019 21:41:44 +0200
Subject: [Buildroot] [PATCH v2 3/3] configs/imx7dpico: Add Wifi support
In-Reply-To: <20190610194144.25958-1-offougajoris@gmail.com>
References: <20190610194144.25958-1-offougajoris@gmail.com>
Message-ID: <20190610194144.25958-3-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

imx7dpico has a BCM4339 Wifi chip. Add Wifi support by default
to allow a better customer experience.

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
changes v1 -> v2
 - fix empty line
 - add reviewed-by and tested-by
  
 board/technexion/imx7dpico/readme.txt         | 11 +++
 .../lib/firmware/brcm/brcmfmac4339-sdio.txt   | 99 +++++++++++++++++++
 configs/imx7dpico_defconfig                   | 12 +++
 3 files changed, 122 insertions(+)
 create mode 100644 board/technexion/imx7dpico/rootfs_overlay/lib/firmware/brcm/brcmfmac4339-sdio.txt

diff --git a/board/technexion/imx7dpico/readme.txt b/board/technexion/imx7dpico/readme.txt
index 07e089c38e..1b9e80a0fd 100644
--- a/board/technexion/imx7dpico/readme.txt
+++ b/board/technexion/imx7dpico/readme.txt
@@ -57,4 +57,15 @@ To boot your newly created system:
   emulator at 115200 bps, 8n1;
 - power on the board.
 
+Using Wifi
+==========
+
+# modprobe brcmfmac
+# iwconfig wlan0 essid ACCESSPOINTNAME
+# wpa_passphrase ACCESSPOINTNAME > /etc/wpa.conf
+(enter the wifi password and press enter)
+# wpa_supplicant -Dwext -iwlan0 -c /etc/wpa.conf &
+# udhcpc -i wlan0
+# ping buildroot.org
+
 Enjoy!
diff --git a/board/technexion/imx7dpico/rootfs_overlay/lib/firmware/brcm/brcmfmac4339-sdio.txt b/board/technexion/imx7dpico/rootfs_overlay/lib/firmware/brcm/brcmfmac4339-sdio.txt
new file mode 100644
index 0000000000..1ddd929504
--- /dev/null
+++ b/board/technexion/imx7dpico/rootfs_overlay/lib/firmware/brcm/brcmfmac4339-sdio.txt
@@ -0,0 +1,99 @@
+#AP6335_NVRAM_V1.5_03112014
+NVRAMRev=$Rev: 410316 $
+sromrev=11
+boardrev=0x1203
+boardtype=0x06c5
+boardflags=0x00000c01
+boardflags2=0x00002000
+boardflags3=0x101188
+macaddr=00:90:4c:c5:12:38
+ccode=0
+regrev=0
+antswitch=0
+pdgain2g=7
+pdgain5g=7
+tworangetssi2g=0
+tworangetssi5g=0
+femctrl=7
+pcieingress_war=15
+vendid=0x14e4
+devid=0x43ae
+manfid=0x2d0
+nocrc=1
+otpimagesize=502
+xtalfreq=37400
+extpagain2g=2
+pdetrange2g=2
+extpagain5g=2
+pdetrange5g=2
+rxgains2gelnagaina0=0
+rxgains2gtrisoa0=7
+rxgains2gtrelnabypa0=0
+rxgains5gelnagaina0=0
+rxgains5gtrisoa0=11
+rxgains5gtrelnabypa0=0
+rxchain=1
+txchain=1
+aa2g=1
+aa5g=1
+tssipos5g=0
+tssipos2g=0
+pa2ga0=-161,6269,-723
+pa2gccka0=-116,7568,-852
+pa5ga0=0xFF61,0x163C,0xFD55,0xFF5D,0x1671,0xFD4F,0xFF5F,0x16CA,0xFD45,0xFF60,0x1676,0xFD4D
+pa5gbw40a0=0xFF61,0x163C,0xFD55,0xFF5D,0x1671,0xFD4F,0xFF5F,0x16CA,0xFD45,0xFF60,0x1676,0xFD4D
+pa5gbw80a0=0xFF61,0x163C,0xFD55,0xFF5D,0x1671,0xFD4F,0xFF5F,0x16CA,0xFD45,0xFF60,0x1676,0xFD4D
+pdoffset40ma0=0
+pdoffset80ma0=0
+pdoffsetcckma0=0
+maxp2ga0=75
+maxp5ga0=64,64,72,72
+cckbw202gpo=0x0000
+cckbw20ul2gpo=0x0
+mcsbw202gpo=0x99445533
+mcsbw402gpo=0x99775533
+dot11agofdmhrbw202gpo=0x2233
+ofdmlrbw202gpo=0x0000
+tssifloor2g=500
+mcsbw205glpo=0x66333330
+mcsbw405glpo=0x66665530
+mcsbw805glpo=0xAA555530
+mcsbw1605glpo=0x99555530
+mcsbw205gmpo=0x99BB5530
+mcsbw405gmpo=0x99BB5530
+mcsbw805gmpo=0xEE555530
+mcsbw1605gmpo=0x99555530
+mcsbw205ghpo=0x99995530
+mcsbw405ghpo=0x99BB5530
+mcsbw805ghpo=0xEE555530
+mcsbw1605ghpo=0x99555530
+mcslr5glpo=0x0000
+mcslr5gmpo=0x0000
+mcslr5ghpo=0x0000
+sb20in40hrrpo=0x0
+sb20in80and160hr5glpo=0x0
+sb40and80hr5glpo=0x0
+sb20in80and160hr5gmpo=0x0
+sb40and80hr5gmpo=0x0
+sb20in80and160hr5ghpo=0x0
+sb40and80hr5ghpo=0x0
+sb20in40lrpo=0x0
+sb20in80and160lr5glpo=0x0
+sb40and80lr5glpo=0x0
+sb20in80and160lr5gmpo=0x0
+sb40and80lr5gmpo=0x0
+sb20in80and160lr5ghpo=0x0
+sb40and80lr5ghpo=0x0
+dot11agduphrpo=0x0
+dot11agduplrpo=0x0
+phycal_tempdelta=25
+cckdigfilttype=2
+pacalidx2g=65
+dacrate2g=160
+swctrlmap_5g=0x00000008,0x00000010,0x00000008,0x000000,0x038
+swctrlmap_2g=0x00000001,0x00000002,0x00000001,0x040002,0x0ff
+swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x000
+swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x000
+rssicorrnorm_c0=3,3
+rssicorrnorm5g_c0=2,3,4,2,3,3,0,1,2,0,1,2
+muxenab=0x10
diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
index cd12e282ef..056f549d0b 100644
--- a/configs/imx7dpico_defconfig
+++ b/configs/imx7dpico_defconfig
@@ -28,6 +28,18 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 
+# wifi firmware for brcm43439
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
+
+# For automatic firmware loading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
+# wireless packages
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+
 # required tools to create the eMMC image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.17.1
