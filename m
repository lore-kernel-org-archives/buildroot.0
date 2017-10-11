From: Alexandre Gambier <agambier.dev@gmail.com>
Date: Wed, 11 Oct 2017 14:19:33 +0200
Subject: [Buildroot] [PATCH 4/9] iMX6S-PICO: add firmware files (nvram*)
In-Reply-To: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
References: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
Message-ID: <1507724378-23461-4-git-send-email-agambier.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Gambier <agambier.dev@gmail.com>
---
 .../lib/firmware/brcm/nvram_ap6212.txt             | 54 ++++++++++++
 .../lib/firmware/brcm/nvram_ap6335.txt             | 99 ++++++++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100755 board/technexion/imx6spico/rootfs_overlay/lib/firmware/brcm/nvram_ap6212.txt
 create mode 100755 board/technexion/imx6spico/rootfs_overlay/lib/firmware/brcm/nvram_ap6335.txt

diff --git a/board/technexion/imx6spico/rootfs_overlay/lib/firmware/brcm/nvram_ap6212.txt b/board/technexion/imx6spico/rootfs_overlay/lib/firmware/brcm/nvram_ap6212.txt
new file mode 100755
index 0000000..578376c
--- /dev/null
+++ b/board/technexion/imx6spico/rootfs_overlay/lib/firmware/brcm/nvram_ap6212.txt
@@ -0,0 +1,54 @@
+#AP6212_NVRAM_V1.0_20140603
+# 2.4 GHz, 20 MHz BW mode
+
+# The following parameter values are just placeholders, need to be updated.
+manfid=0x2d0
+prodid=0x0726
+vendid=0x14e4
+devid=0x43e2
+boardtype=0x0726
+boardrev=0x1101
+boardnum=22
+macaddr=00:90:4c:c5:12:38
+sromrev=11
+boardflags=0x00404201
+xtalfreq=26000
+nocrc=1
+ag0=255
+aa2g=1
+ccode=ALL
+
+pa0itssit=0x20
+extpagain2g=0
+
+#PA parameters for 2.4GHz, measured at CHIP OUTPUT
+pa2ga0=-168,7161,-820
+AvVmid_c0=0x0,0xc8
+cckpwroffset0=5
+
+# PPR params
+maxp2ga0=90
+txpwrbckof=6
+cckbw202gpo=0x5555
+legofdmbw202gpo=0x77777777
+mcsbw202gpo=0xaaaaaaaa
+
+# OFDM IIR :
+ofdmdigfilttype=7
+# PAPD mode:
+papdmode=2
+
+il0macaddr=00:90:4c:c5:12:38
+wl0id=0x431b
+
+#OOB parameters
+hostwake=0x40
+hostrdy=0x41
+usbrdy=0x03
+usbrdydelay=100
+deadman_to=0xffffffff
+# muxenab: 0x1 for UART enable, 0x10 for Host awake
+muxenab=0x10
+# CLDO PWM voltage settings - 0x4 - 1.1 volt
+#cldo_pwm=0x4
+
diff --git a/board/technexion/imx6spico/rootfs_overlay/lib/firmware/brcm/nvram_ap6335.txt b/board/technexion/imx6spico/rootfs_overlay/lib/firmware/brcm/nvram_ap6335.txt
new file mode 100755
index 0000000..06b2762
--- /dev/null
+++ b/board/technexion/imx6spico/rootfs_overlay/lib/firmware/brcm/nvram_ap6335.txt
@@ -0,0 +1,99 @@
+#AP6335_NVRAM_V1.5_03112014
+NVRAMRev=$Rev: 410316 $
+sromrev=11
+boardrev=0x1203
+boardtype=0x06c5
+boardflags=0x00000c01
+boardflags2=0x00002000
+boardflags3=0x8101188
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
-- 
2.7.4
