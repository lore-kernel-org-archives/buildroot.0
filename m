Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6F4C197A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 15:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3302F408FC;
	Mon, 20 Nov 2023 15:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3302F408FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yhtKue1SWvxD; Mon, 20 Nov 2023 15:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F6E140908;
	Mon, 20 Nov 2023 15:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F6E140908
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FE8E1BF2F1
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 15:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47C0C40550
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 15:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47C0C40550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ISwPlQ6g2SDb for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 15:21:24 +0000 (UTC)
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com
 [203.205.221.153])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C80A7400D0
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 15:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C80A7400D0
Received: from localhost.localdomain ([59.66.138.28])
 by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
 id 539820A2; Mon, 20 Nov 2023 23:20:57 +0800
X-QQ-mid: xmsmtpt1700493657tfgbw9yvd
Message-ID: <tencent_3E8054E385AF0DCBE94DC17FAD12060E6707@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIehslZViNYjADwVNDAQpJxBBsnQpTZYFRMvQ6hEE4Qr8GzwfSc7K
 bULhd2lJkSXhisFlXBeX7SefZ1Xvh4RbVU91jmrpB25FnN5xNuRgcuFY0sbphQl4Wdo6rpM8SUOZ
 xphItargpE1jM0X3FHMv9xAGCNQ+50rNEN0nC6VMoqjbiGkMqonYiT9VcjzaUvLSa3pY94v3SE4L
 Fl5fZRFW7f+pg4DqFVp7/3Yupav0AW9/w9JWAm4wh1Ye4kMXmo1DD7iJdIpEJb7VadgyUWBd8LL0
 iVWsf4xB5ls6NwCkdkEKlOnUncgqWTRltFzlYbAfv64UlNdIk2dWTt3wd6YJCPwDsZq9sux0HyEr
 UJ/HVBkyDa+KYElPHmEjQxg/GiY9caT8833R4VcAYmsh63BMpTGW+sK2BYsfXV4XZpHboTk5fJXl
 m3olKU5K6LEL3Yhl26dykBYfIUVefHFnj5wavWiXn4V+dArYx17E9b2RmpdnV3j5lFSRySC8kJAt
 bsB/k2KhnarKpAY9y2YUN0ChY7O0PikvQb6QcixIJqSXdJ0oVCAS7pb2nG0oK4vJQKgHQlxXdBzQ
 9+O4BUtekZBb8QG0mjie4ChEhwWxWvZm6hmE+RU9+PUtEznVooYFMnjJXfn3NXGYYe+ub1X0oqXV
 gyvOHMFtUtFTwudr1i2N9DF9L3zkmufHVM0hGvm+2EIk2GLtR9KXhC4xccNqvg5pnws2JyTqXkK3
 jw6Khqk0XlmytPHIHjgSyUxL52iDdDbIN5O2ojYgifL6duvZdGF7uOsMize0zEvNkHHh9RQ8QppK
 AblqjprQSOdrcWU+a7t2HdCQopbJ5RrDocURbhitmBYV8sH0X7RPHzuKoSajLNi/lZ1hlv7sGiiu
 ibQdylNZew6DYtzvO7q+dwEM12qb3mYcyEi1SZnYcFh81LpKhEJOgitpQsXcuWX8S22zhUuoV9FJ
 ucmh+EP2ypdailTUlz5PvBgpPJiFVnrcZTnB2Ipv/n+K8ha3IITGI8wbA//S720uBdzYWzYu4=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
To: buildroot@buildroot.org
Date: Mon, 20 Nov 2023 23:20:08 +0800
X-OQ-MSGID: <20231120152009.17774-1-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1700493660; bh=fpFnqTXG5GUbHuh4loK5dNDuMBjL7cceILK/3gtbsG8=;
 h=From:To:Cc:Subject:Date;
 b=csehbkLyzmFFOvfRTDF4aTNQFxxY+HLuSFKc7JH/9BV4eGllNq54hQQK7aQqSFV0K
 DlG+nnBPqADGKHorBE64NylJUuhvdMYz6gab/xw7UZIICAu66t+/lkQYoZnm5b8nhf
 H2AXrZ7HORPWB8xCS0xBk7jOsgltGLLakDRG4/6E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=csehbkLy
Subject: [Buildroot] [PATCH 1/2] configs/milkv_duo: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Hanyuan Zhao via buildroot <buildroot@buildroot.org>
Reply-To: Hanyuan Zhao <hanyuan-z@qq.com>
Cc: Emil S <emil.soltys@outlook.com>, Hanyuan Zhao <hanyuan-z@qq.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 GP Orcullo <kinsamanka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Milk-V Duo is an ultra-compact embedded development platform based on the CV1800B chip.
It can run Linux and RTOS, providing a reliable, low-cost, and high-performance platform
for professionals, industrial ODMs, AIoT enthusiasts, DIY hobbyists, and creators.

Co-authored-by: Emil S <emil.soltys@outlook.com>
Co-authored-by: GP Orcullo <kinsamanka@gmail.com>
Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
---
 board/milkv/duo/README.md                     |  64 +++++
 board/milkv/duo/genimage.cfg                  |  30 ++
 board/milkv/duo/overlay/etc/dnsmasq.conf      |   4 +
 board/milkv/duo/overlay/etc/init.d/S05runonce |  32 +++
 board/milkv/duo/overlay/etc/init.d/S10hwinit  |  44 +++
 board/milkv/duo/overlay/etc/init.d/S15swap    |  25 ++
 board/milkv/duo/overlay/etc/init.d/S99user    |  27 ++
 board/milkv/duo/overlay/etc/milkv-duo.conf    |  56 ++++
 board/milkv/duo/overlay/etc/profile           |  36 +++
 .../duo/overlay/etc/runonce.d/01make-swap     |   6 +
 .../overlay/etc/runonce.d/05store-eth0-mac    |  12 +
 .../duo/overlay/etc/runonce.d/ran/.gitkeep    |   0
 .../milkv/duo/overlay/opt/milkv-duo/blink.sh  |  25 ++
 .../duo/overlay/opt/milkv-duo/duo-init.sh     |   8 +
 .../duo/overlay/opt/milkv-duo/run_usb.sh      | 265 ++++++++++++++++++
 .../milkv/duo/overlay/opt/milkv-duo/uhubon.sh |  63 +++++
 .../duo/overlay/opt/milkv-duo/usb-host.sh     |   3 +
 .../overlay/opt/milkv-duo/usb-mass-storage.sh |  10 +
 .../duo/overlay/opt/milkv-duo/usb-rndis.sh    |  14 +
 ...ensbi-porting-adapt-to-CV180X-CV181X.patch |  44 +++
 ...csr-zifencei-and-kill-compile-errors.patch |  59 ++++
 ...ize-the-value-of-a-variable-in-stack.patch |  26 ++
 board/milkv/duo/post-image.sh                 |  52 ++++
 configs/milkv_duo_musl_riscv64_64mb_defconfig |  94 +++++++
 configs/milkv_duo_musl_riscv64_defconfig      |  93 ++++++
 25 files changed, 1092 insertions(+)
 create mode 100644 board/milkv/duo/README.md
 create mode 100644 board/milkv/duo/genimage.cfg
 create mode 100644 board/milkv/duo/overlay/etc/dnsmasq.conf
 create mode 100755 board/milkv/duo/overlay/etc/init.d/S05runonce
 create mode 100755 board/milkv/duo/overlay/etc/init.d/S10hwinit
 create mode 100755 board/milkv/duo/overlay/etc/init.d/S15swap
 create mode 100755 board/milkv/duo/overlay/etc/init.d/S99user
 create mode 100644 board/milkv/duo/overlay/etc/milkv-duo.conf
 create mode 100644 board/milkv/duo/overlay/etc/profile
 create mode 100755 board/milkv/duo/overlay/etc/runonce.d/01make-swap
 create mode 100755 board/milkv/duo/overlay/etc/runonce.d/05store-eth0-mac
 create mode 100644 board/milkv/duo/overlay/etc/runonce.d/ran/.gitkeep
 create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/blink.sh
 create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/duo-init.sh
 create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/run_usb.sh
 create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/uhubon.sh
 create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/usb-host.sh
 create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/usb-mass-storage.sh
 create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/usb-rndis.sh
 create mode 100644 board/milkv/duo/patches/opensbi/0001-opensbi-porting-adapt-to-CV180X-CV181X.patch
 create mode 100644 board/milkv/duo/patches/opensbi/0002-fix-set-zicsr-zifencei-and-kill-compile-errors.patch
 create mode 100644 board/milkv/duo/patches/opensbi/0003-fix-initialize-the-value-of-a-variable-in-stack.patch
 create mode 100755 board/milkv/duo/post-image.sh
 create mode 100644 configs/milkv_duo_musl_riscv64_64mb_defconfig
 create mode 100644 configs/milkv_duo_musl_riscv64_defconfig

diff --git a/board/milkv/duo/README.md b/board/milkv/duo/README.md
new file mode 100644
index 0000000000..f302d24de9
--- /dev/null
+++ b/board/milkv/duo/README.md
@@ -0,0 +1,64 @@
+
+## Milk-V Duo Introduction
+
+Milk-V Duo is an ultra-compact embedded development platform based on the rv64 CV1800B chip.
+
+It can run Linux and RTOS, providing a reliable, cost-effective, and high-performance platform for professionals, industrial ODMs, AIoT enthusiasts, DIY enthusiasts, and creators.
+
+Features:
+
+- [x] The RISC-V C906 processor with clock speeds of 1GHz and 700MHz.
+- [x] CSI-2 (MIPI Serial Camera Interface)
+- [x] Ethernet PHY
+- [x] USB RNDIS & USB HOST & USB Mass Storage
+- [x] Multiple peripherals
+	- [x] -   Up to 3x I2C
+	- [x] -   Up to 5x UART
+	- [x] -   Up to 1x SDIO1
+	- [x] -   Up to 1x SPI
+	- [x] -   Up to 2x ADC
+	- [x] -   Up to 7x PWM
+	- [x] -   Up to 1x RUN
+	- [x] -   Up to 1x JTAG
+
+## How to build
+
+```shell
+$  make milkv_duo_musl_riscv64_defconfig
+$  make
+```
+
+By default, a portion of the RAM is allocated to ION, which is the memory used when running algorithms with the camera. If you are not using the camera, please try:
+
+```shell
+$  make milkv_duo_musl_riscv64_64mb_defconfig
+$  make
+```
+
+To have all the 64mb free memory.
+
+
+To configure the kernel or u-boot or others, please try:
+
+```shell
+$  make linux-menuconfig # act like kernel's make menuconfig
+$  make linux-rebuild
+```
+
+## Usage of the sdcard.img
+
+The `sdcard.img` is in `output/images`, you can directly write the image into your TF card, which could automatically boot and load the USB as rndis function by default.
+
+## Usage of the rootfs
+
+Find the `rootfs.tar.xz` in `output/images`, mount the `mmcblk0p2` part to a directory. Then:
+
+```shell
+$ cd path/to/mmcblk0p2
+$ rm -rf *
+$ sync
+
+$ tar -xf rootfs.tar.xz --directory=path/to/mmcblk0p2
+$ cd path/to/mmcblk0p2
+$ sync
+```
diff --git a/board/milkv/duo/genimage.cfg b/board/milkv/duo/genimage.cfg
new file mode 100644
index 0000000000..ed19e4fd3d
--- /dev/null
+++ b/board/milkv/duo/genimage.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"fip.bin",
+			"boot.sd",
+		}
+	}
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+
+	partition empty {
+		partition-type = 0x82
+		size = 256M
+	}
+}
\ No newline at end of file
diff --git a/board/milkv/duo/overlay/etc/dnsmasq.conf b/board/milkv/duo/overlay/etc/dnsmasq.conf
new file mode 100644
index 0000000000..fcdb620ffa
--- /dev/null
+++ b/board/milkv/duo/overlay/etc/dnsmasq.conf
@@ -0,0 +1,4 @@
+interface=usb0
+dhcp-range=192.168.42.2,192.168.42.242,1h
+dhcp-option=3
+dhcp-option=6
diff --git a/board/milkv/duo/overlay/etc/init.d/S05runonce b/board/milkv/duo/overlay/etc/init.d/S05runonce
new file mode 100755
index 0000000000..fe91bab998
--- /dev/null
+++ b/board/milkv/duo/overlay/etc/init.d/S05runonce
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+#
+# Execute scripts, that are intended to run only once
+#
+case "$1" in
+  start)
+
+        for file in /etc/runonce.d/*
+        do
+                if [ ! -f "$file" ]
+                then
+                        continue
+                fi
+                
+                if "$file" >> /tmp/runonce.log 2>&1
+                then
+                        mv "$file" "/etc/runonce.d/ran/"
+                        sync
+                fi
+        done
+        ;;
+  stop)
+        ;;
+  restart|reload)
+        ;;
+  *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
diff --git a/board/milkv/duo/overlay/etc/init.d/S10hwinit b/board/milkv/duo/overlay/etc/init.d/S10hwinit
new file mode 100755
index 0000000000..ef7dc0f8c4
--- /dev/null
+++ b/board/milkv/duo/overlay/etc/init.d/S10hwinit
@@ -0,0 +1,44 @@
+#!/bin/sh
+
+#
+# Initialize hardware
+#
+export SYSTEMPATH=/opt/milkv-duo/
+CONFIG=/etc/milkv-duo.conf
+source ${CONFIG}
+
+case "$1" in
+  start)
+        
+        if [ -f $SYSTEMPATH/duo-init.sh ]; then
+                . $SYSTEMPATH/duo-init.sh &
+        fi
+
+        if [ ! -z $ETH0_MAC_ADDR ]; then
+                ifconfig eth0 hw ether ${ETH0_MAC_ADDR}
+        fi
+
+        if [ "$DUO_USB_FUNC" == "RNDIS" ]; then
+                if [ -f $SYSTEMPATH/usb-rndis.sh ]; then
+                        . $SYSTEMPATH/usb-rndis.sh &
+                fi
+        elif [ "$DUO_USB_FUNC" == "HOST" ]; then
+                if [ -f $SYSTEMPATH/usb-host.sh ]; then
+                        . $SYSTEMPATH/usb-host.sh &
+                fi
+        elif [ "$DUO_USB_FUNC" == "MASS-STORAGE" ]; then
+                if [ -f $SYSTEMPATH/usb-mass-storage.sh ]; then
+                        . $SYSTEMPATH/usb-mass-storage.sh &
+                fi
+        fi
+        ;;
+  stop)
+        ;;
+  restart|reload)
+        ;;
+  *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
diff --git a/board/milkv/duo/overlay/etc/init.d/S15swap b/board/milkv/duo/overlay/etc/init.d/S15swap
new file mode 100755
index 0000000000..6b5ef76326
--- /dev/null
+++ b/board/milkv/duo/overlay/etc/init.d/S15swap
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+#
+# Activate swap, depending on option
+#
+CONFIG=/etc/milkv-duo.conf
+source ${CONFIG}
+
+case "$1" in
+  start)
+
+        if [ "$ENABLE_SWAP" == "1" ]; then
+        swapon /dev/mmcblk0p3
+        fi
+        ;;
+  stop)
+        ;;
+  restart|reload)
+        ;;
+  *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
diff --git a/board/milkv/duo/overlay/etc/init.d/S99user b/board/milkv/duo/overlay/etc/init.d/S99user
new file mode 100755
index 0000000000..3abd073738
--- /dev/null
+++ b/board/milkv/duo/overlay/etc/init.d/S99user
@@ -0,0 +1,27 @@
+#!/bin/sh
+${CVI_SHOPTS}
+
+#
+# Start firmware
+#
+export SYSTEMPATH=/opt/milkv-duo/
+
+case "$1" in
+  start)
+
+        echo "Starting app..."
+
+        if [ -f $SYSTEMPATH/blink.sh ]; then
+                . $SYSTEMPATH/blink.sh &
+        fi
+        ;;
+  stop)
+        ;;
+  restart|reload)
+        ;;
+  *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
diff --git a/board/milkv/duo/overlay/etc/milkv-duo.conf b/board/milkv/duo/overlay/etc/milkv-duo.conf
new file mode 100644
index 0000000000..c074254b55
--- /dev/null
+++ b/board/milkv/duo/overlay/etc/milkv-duo.conf
@@ -0,0 +1,56 @@
+# set 0 to disable blinking
+ENABLE_BLINK=1
+
+# set 1 to enable swap
+ENABLE_SWAP=0
+
+# command to write data into gpio or other devices
+DUO_WRITE="echo -n"
+
+# LED gpio information
+LED_GPIO=440
+LED_PATH=/sys/class/gpio/gpio${LED_GPIO}
+
+# USB Function: RNDIS, HOST, MASS-STORAGE
+DUO_USB_FUNC=RNDIS
+# Please ensure that the filesystem of the specified
+# path is compatible with the operating system intended
+# to be inserted, as failure to do so may result in
+# damage to the filesystem
+DUO_USB_MASS_STORAGE_ROOT=/dev/mmcblk0p1
+
+# USB Configurations
+GPIO_HUBPORT_EN=449
+GPIO_ROLESEL=450
+GPIO_HUBRST=451
+SYS_GPIO=/sys/class/gpio
+
+CLASS=acm
+VID=0x3346
+PID=0x1003
+MSC_PID=0x1008
+RNDIS_PID=0x1009
+UVC_PID=0x100A
+UAC_PID=0x100B
+ADB_VID=0x18D1
+ADB_PID=0x4EE0
+ADB_PID_M1=0x4EE2
+ADB_PID_M2=0x4EE4
+MANUFACTURER="Cvitek"
+PRODUCT="USB Com Port"
+PRODUCT_RNDIS="RNDIS"
+PRODUCT_UVC="UVC"
+PRODUCT_UAC="UAC"
+PRODUCT_ADB="ADB"
+ADBD_PATH=/usr/bin/
+SERIAL="0123456789"
+MSC_FILE=$3
+CVI_DIR=/tmp/usb
+CVI_GADGET=$CVI_DIR/usb_gadget/cvitek
+CVI_FUNC=$CVI_GADGET/functions
+FUNC_NUM=0
+MAX_EP_NUM=4
+TMP_NUM=0
+INTF_NUM=0
+EP_IN=0
+EP_OUT=0
diff --git a/board/milkv/duo/overlay/etc/profile b/board/milkv/duo/overlay/etc/profile
new file mode 100644
index 0000000000..f6f3784024
--- /dev/null
+++ b/board/milkv/duo/overlay/etc/profile
@@ -0,0 +1,36 @@
+export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
+
+if [ "$PS1" ]; then
+	if [ "`id -u`" -eq 0 ]; then
+		export PS1='# '
+	else
+		export PS1='$ '
+	fi
+fi
+
+export PAGER='/bin/more '
+export EDITOR='/bin/vi'
+
+# Source configuration files from /etc/profile.d
+for i in /etc/profile.d/*.sh ; do
+	if [ -r "$i" ]; then
+		. $i
+	fi
+	unset i
+done
+
+export HOSTNAME="$(hostname)"
+export OLDPWD=/root
+
+if [ '$USER' == 'root' ]; then
+    export PS1='[\u@\h]\w\# '
+else
+    export PS1='[\u@\h]\w\$ '
+fi
+
+alias ll='ls -alF'
+alias la='ls -A'
+alias l='ls -CF'
+
+export TERM=xterm-256color
+export TERMINFO=/usr/share/terminfo
diff --git a/board/milkv/duo/overlay/etc/runonce.d/01make-swap b/board/milkv/duo/overlay/etc/runonce.d/01make-swap
new file mode 100755
index 0000000000..64c361109f
--- /dev/null
+++ b/board/milkv/duo/overlay/etc/runonce.d/01make-swap
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+#
+# Set up swap area
+#
+mkswap /dev/mmcblk0p3
diff --git a/board/milkv/duo/overlay/etc/runonce.d/05store-eth0-mac b/board/milkv/duo/overlay/etc/runonce.d/05store-eth0-mac
new file mode 100755
index 0000000000..1c56640cd2
--- /dev/null
+++ b/board/milkv/duo/overlay/etc/runonce.d/05store-eth0-mac
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+#
+# Store first boot eth0 MAC address to make it persistent
+#
+CONFIG=/etc/milkv-duo.conf
+source ${CONFIG}
+
+if [ -z $ETH0_MAC_ADDR ]; then
+        echo -e "\n# stored at first boot" >> ${CONFIG}
+        echo "ETH0_MAC_ADDR=$(cat /sys/class/net/eth0/address)" >> ${CONFIG}
+fi
diff --git a/board/milkv/duo/overlay/etc/runonce.d/ran/.gitkeep b/board/milkv/duo/overlay/etc/runonce.d/ran/.gitkeep
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/board/milkv/duo/overlay/opt/milkv-duo/blink.sh b/board/milkv/duo/overlay/opt/milkv-duo/blink.sh
new file mode 100755
index 0000000000..3d14977cc9
--- /dev/null
+++ b/board/milkv/duo/overlay/opt/milkv-duo/blink.sh
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+CONFIG=/etc/milkv-duo.conf
+source ${CONFIG}
+
+if test -d ${LED_PATH}; then
+    echo "GPIO${LED_GPIO} already exported"
+else
+    ${DUO_WRITE} ${LED_GPIO} >/sys/class/gpio/export
+fi
+
+${DUO_WRITE} out >${LED_PATH}/direction
+
+while true; do
+    source ${CONFIG}
+    if [ "$ENABLE_BLINK" == "1" ]; then
+        ${DUO_WRITE} 0 >${LED_PATH}/value
+        sleep 0.5
+        ${DUO_WRITE} 1 >${LED_PATH}/value
+        sleep 0.5
+    else
+        ${DUO_WRITE} 0 >${LED_PATH}/value
+        sleep 2
+    fi
+done
diff --git a/board/milkv/duo/overlay/opt/milkv-duo/duo-init.sh b/board/milkv/duo/overlay/opt/milkv-duo/duo-init.sh
new file mode 100755
index 0000000000..298e43bc8d
--- /dev/null
+++ b/board/milkv/duo/overlay/opt/milkv-duo/duo-init.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# Set Pin-29(PWR_SEQ2) to GPIO
+devmem 0x0502707c 32 0x111
+devmem 0x03001068 32 0x3
+
+# Set Pin-19(SD0_PWR_EN) to GPIO
+devmem 0x0300101c 32 0x3
diff --git a/board/milkv/duo/overlay/opt/milkv-duo/run_usb.sh b/board/milkv/duo/overlay/opt/milkv-duo/run_usb.sh
new file mode 100755
index 0000000000..911dd2883a
--- /dev/null
+++ b/board/milkv/duo/overlay/opt/milkv-duo/run_usb.sh
@@ -0,0 +1,265 @@
+CONFIG=/etc/milkv-duo.conf
+source ${CONFIG}
+
+case "$2" in
+  acm)
+	CLASS=acm
+	;;
+  msc)
+	CLASS=mass_storage
+	PID=$MSC_PID
+	;;
+  cvg)
+	CLASS=cvg
+	;;
+  rndis)
+	CLASS=rndis
+	PID=$RNDIS_PID
+	PRODUCT=$PRODUCT_RNDIS
+	;;
+  uvc)
+	CLASS=uvc
+	PID=$UVC_PID
+	PRODUCT=$PRODUCT_UVC
+	;;
+  uac1)
+	CLASS=uac1
+	PID=$UAC_PID
+	PRODUCT=$PRODUCT_UAC
+	;;
+  adb)
+	CLASS=ffs.adb
+	VID=$ADB_VID
+	PID=$ADB_PID
+	PRODUCT=$PRODUCT_ADB
+	;;
+  *)
+	if [ "$1" = "probe" ] ; then
+	  echo "Usage: $0 probe {acm|msc|cvg|rndis|uvc|uac1|adb}"
+	  exit 1
+	fi
+esac
+
+calc_func() {
+  FUNC_NUM=$(ls $CVI_GADGET/functions -l | grep ^d | wc -l)
+  echo "$FUNC_NUM file(s)"
+}
+
+res_check() {
+  TMP_NUM=$(find $CVI_GADGET/functions/ -name "acm*" | wc -l)
+  EP_OUT=$(($EP_OUT+$TMP_NUM))
+  TMP_NUM=$(($TMP_NUM * 2))
+  EP_IN=$(($EP_IN+$TMP_NUM))
+  INTF_NUM=$(($INTF_NUM+$TMP_NUM))
+  TMP_NUM=$(find $CVI_GADGET/functions/ -name "mass_storage*" | wc -l)
+  EP_IN=$(($EP_IN+$TMP_NUM))
+  EP_OUT=$(($EP_OUT+$TMP_NUM))
+  INTF_NUM=$(($INTF_NUM+$TMP_NUM))
+  TMP_NUM=$(find $CVI_GADGET/functions/ -name "cvg*" | wc -l)
+  EP_IN=$(($EP_IN+$TMP_NUM))
+  EP_OUT=$(($EP_OUT+$TMP_NUM))
+  INTF_NUM=$(($INTF_NUM+$TMP_NUM))
+  TMP_NUM=$(find $CVI_GADGET/functions/ -name "rndis*" | wc -l)
+  EP_OUT=$(($EP_OUT+$TMP_NUM))
+  TMP_NUM=$(($TMP_NUM * 2))
+  EP_IN=$(($EP_IN+$TMP_NUM))
+  INTF_NUM=$(($INTF_NUM+$TMP_NUM))
+  TMP_NUM=$(find $CVI_GADGET/functions/ -name "uvc*" | wc -l)
+  TMP_NUM=$(($TMP_NUM * 2))
+  EP_IN=$(($EP_IN+$TMP_NUM))
+  INTF_NUM=$(($INTF_NUM+$TMP_NUM))
+  TMP_NUM=$(find $CVI_GADGET/functions/ -name "uac1*" | wc -l)
+  TMP_NUM=$(($TMP_NUM * 2))
+  EP_IN=$(($EP_IN+$TMP_NUM))
+  EP_OUT=$(($EP_OUT+$TMP_NUM))
+  INTF_NUM=$(($INTF_NUM+$TMP_NUM))
+  TMP_NUM=$(find $CVI_GADGET/functions/ -name ffs.adb | wc -l)
+  EP_IN=$(($EP_IN+$TMP_NUM))
+  EP_OUT=$(($EP_OUT+$TMP_NUM))
+  INTF_NUM=$(($INTF_NUM+$TMP_NUM))
+
+  if [ "$CLASS" = "acm" ] ; then
+    EP_IN=$(($EP_IN+2))
+    EP_OUT=$(($EP_OUT+1))
+  fi
+  if [ "$CLASS" = "mass_storage" ] ; then
+    EP_IN=$(($EP_IN+1))
+    EP_OUT=$(($EP_OUT+1))
+  fi
+  if [ "$CLASS" = "cvg" ] ; then
+    EP_IN=$(($EP_IN+1))
+    EP_OUT=$(($EP_OUT+1))
+  fi
+  if [ "$CLASS" = "rndis" ] ; then
+    EP_IN=$(($EP_IN+2))
+    EP_OUT=$(($EP_OUT+1))
+  fi
+  if [ "$CLASS" = "uvc" ] ; then
+    EP_IN=$(($EP_IN+2))
+  fi
+  if [ "$CLASS" = "uac1" ] ; then
+    EP_IN=$(($EP_IN+1))
+    EP_OUT=$(($EP_OUT+1))
+  fi
+  if [ "$CLASS" = "ffs.adb" ] ; then
+    EP_IN=$(($EP_IN+1))
+    EP_OUT=$(($EP_OUT+1))
+  fi
+  echo "$EP_IN in ep"
+  echo "$EP_OUT out ep"
+  if [ $EP_IN -gt $MAX_EP_NUM ]; then
+    echo "reach maximum resource"
+    exit 1
+  fi
+  if [ $EP_OUT -gt $MAX_EP_NUM ]; then
+    echo "reach maximum resource"
+    exit 1
+  fi
+}
+
+probe() {
+  if [ ! -d $CVI_DIR ]; then
+    mkdir $CVI_DIR
+  fi
+  if [ ! -d $CVI_DIR/usb_gadget ]; then
+    # Enale USB ConfigFS
+    mount none $CVI_DIR -t configfs
+    # Create gadget dev
+    mkdir $CVI_GADGET
+    # Set the VID and PID
+    ${DUO_WRITE} $VID >$CVI_GADGET/idVendor
+    ${DUO_WRITE} $PID >$CVI_GADGET/idProduct
+    # Set the product information string
+    mkdir $CVI_GADGET/strings/0x409
+    ${DUO_WRITE} $MANUFACTURER>$CVI_GADGET/strings/0x409/manufacturer
+    ${DUO_WRITE} $PRODUCT>$CVI_GADGET/strings/0x409/product
+    ${DUO_WRITE} $SERIAL>$CVI_GADGET/strings/0x409/serialnumber
+    # Set the USB configuration
+    mkdir $CVI_GADGET/configs/c.1
+    mkdir $CVI_GADGET/configs/c.1/strings/0x409
+    ${DUO_WRITE} "config1">$CVI_GADGET/configs/c.1/strings/0x409/configuration
+    # Set the MaxPower of USB descriptor
+    ${DUO_WRITE} 120 >$CVI_GADGET/configs/c.1/MaxPower
+  fi
+  # get current functions number
+  calc_func
+  # assign the class code for composite device
+  if [ ! $FUNC_NUM -eq 0 ]; then
+    ${DUO_WRITE} 0xEF >$CVI_GADGET/bDeviceClass
+    ${DUO_WRITE} 0x02 >$CVI_GADGET/bDeviceSubClass
+    ${DUO_WRITE} 0x01 >$CVI_GADGET/bDeviceProtocol
+  fi
+  # resource check
+  res_check
+  # create the desired function
+  if [ "$CLASS" = "ffs.adb" ] ; then
+    # adb shall be the last function to probe. Override the pid/vid
+    ${DUO_WRITE} $VID >$CVI_GADGET/idVendor
+    ${DUO_WRITE} $PID >$CVI_GADGET/idProduct
+    # choose pid for different function number
+    if [ $INTF_NUM -eq 1 ]; then
+      ${DUO_WRITE} $ADB_PID_M1 >$CVI_GADGET/idProduct
+    fi
+    if [ $INTF_NUM -eq 2 ]; then
+      ${DUO_WRITE} $ADB_PID_M2 >$CVI_GADGET/idProduct
+    fi
+    mkdir $CVI_GADGET/functions/$CLASS
+  else
+    mkdir $CVI_GADGET/functions/$CLASS.usb$FUNC_NUM
+  fi
+  if [ "$CLASS" = "mass_storage" ] ; then
+    ${DUO_WRITE} $MSC_FILE >$CVI_GADGET/functions/$CLASS.usb$FUNC_NUM/lun.0/file
+  fi
+  if [ "$CLASS" = "rndis" ] ; then
+    #OS STRING
+    ${DUO_WRITE} 1 >$CVI_GADGET/os_desc/use
+    ${DUO_WRITE} 0xcd >$CVI_GADGET/os_desc/b_vendor_code
+    ${DUO_WRITE} MSFT100 >$CVI_GADGET/os_desc/qw_sign
+    #COMPATIBLE ID
+    ${DUO_WRITE} RNDIS >$CVI_FUNC/rndis.usb$FUNC_NUM/os_desc/interface.rndis/compatible_id
+    #MAKE c.1 THE ONE ASSOCIATED WITH OS DESCRIPTORS
+    ln -s $CVI_GADGET/configs/c.1 $CVI_GADGET/os_desc
+    #MAKE "Icons" EXTENDED PROPERTY
+    mkdir $CVI_FUNC/rndis.usb$FUNC_NUM/os_desc/interface.rndis/Icons
+    ${DUO_WRITE} 2 >$CVI_FUNC/rndis.usb$FUNC_NUM/os_desc/interface.rndis/Icons/type
+    ${DUO_WRITE} "%SystemRoot%\\system32\\shell32.dll,-233" >$CVI_FUNC/rndis.usb$FUNC_NUM/os_desc/interface.rndis/Icons/data
+    #MAKE "Label" EXTENDED PROPERTY
+    mkdir $CVI_FUNC/rndis.usb$FUNC_NUM/os_desc/interface.rndis/Label
+    ${DUO_WRITE} 1 >$CVI_FUNC/rndis.usb$FUNC_NUM/os_desc/interface.rndis/Label/type
+    ${DUO_WRITE} "XYZ Device" >$CVI_FUNC/rndis.usb$FUNC_NUM/os_desc/interface.rndis/Label/data
+  fi
+
+}
+
+start() {
+  # link this function to the configuration
+  calc_func
+  if [ $FUNC_NUM -eq 0 ]; then
+    echo "Functions Empty!"
+    exit 1
+  fi
+  if [ -d $CVI_GADGET/functions/ffs.adb ]; then
+    FUNC_NUM=$(($FUNC_NUM-1))
+  fi
+  for i in `seq 0 $(($FUNC_NUM-1))`;
+  do
+    find $CVI_GADGET/functions/ -name "*.usb$i" | xargs -I % ln -s % $CVI_GADGET/configs/c.1
+  done
+  if [ -d $CVI_GADGET/functions/ffs.adb ]; then
+    ln -s $CVI_GADGET/functions/ffs.adb $CVI_GADGET/configs/c.1
+    mkdir /dev/usb-ffs/adb -p
+    mount -t functionfs adb /dev/usb-ffs/adb
+    if [ -f $ADBD_PATH/adbd ]; then
+	$ADBD_PATH/adbd &
+    fi
+  else
+    # Start the gadget driver
+    UDC=`ls /sys/class/udc/ | awk '{print $1}'`
+    ${DUO_WRITE} ${UDC} >$CVI_GADGET/UDC
+  fi
+}
+
+stop() {
+  if [ -d $CVI_GADGET/configs/c.1/ffs.adb ]; then
+    pkill adbd
+    rm $CVI_GADGET/configs/c.1/ffs.adb
+  else
+    ${DUO_WRITE} "" >$CVI_GADGET/UDC
+  fi
+  find $CVI_GADGET/configs/ -name "*.usb*" | xargs rm -f
+  rmdir $CVI_GADGET/configs/c.*/strings/0x409/
+  tmp_dirs=$(find $CVI_GADGET/os_desc/c.* -type d)
+  if [ -n tmp_dirs ]; then
+    echo "remove os_desc!"
+    rm -rf $CVI_GADGET/os_desc/c.*/
+    find $CVI_GADGET/functions/ -name Icons | xargs rmdir
+    find $CVI_GADGET/functions/ -name Label | xargs rmdir
+  fi
+  rmdir $CVI_GADGET/configs/c.*/
+  rmdir $CVI_GADGET/functions/*
+  rmdir $CVI_GADGET/strings/0x409/
+  rmdir $CVI_GADGET
+  umount $CVI_DIR
+  rmdir $CVI_DIR
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  probe)
+	probe
+	;;
+  UDC)
+	ls /sys/class/udc/ >$CVI_GADGET/UDC
+	;;
+  *)
+	echo "Usage: $0 probe {acm|msc|cvg|uvc|uac1} {file (msc)}"
+	echo "Usage: $0 start"
+	echo "Usage: $0 stop"
+	exit 1
+esac
+exit $?
diff --git a/board/milkv/duo/overlay/opt/milkv-duo/uhubon.sh b/board/milkv/duo/overlay/opt/milkv-duo/uhubon.sh
new file mode 100755
index 0000000000..8a06949e3f
--- /dev/null
+++ b/board/milkv/duo/overlay/opt/milkv-duo/uhubon.sh
@@ -0,0 +1,63 @@
+CONFIG=/etc/milkv-duo.conf
+source ${CONFIG}
+
+hub_on() {
+  echo "turn on usb hub"
+  if [ ! -d $SYS_GPIO/gpio$GPIO_HUBPORT_EN ]; then
+      ${DUO_WRITE} $GPIO_HUBPORT_EN >/sys/class/gpio/export
+  fi
+
+  if [ ! -d $SYS_GPIO/gpio$GPIO_ROLESEL ]; then
+      ${DUO_WRITE} $GPIO_ROLESEL >/sys/class/gpio/export
+  fi
+
+  if [ ! -d $SYS_GPIO/gpio$GPIO_HUBRST ]; then
+      ${DUO_WRITE} $GPIO_HUBRST >/sys/class/gpio/export
+  fi
+
+  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_HUBPORT_EN/direction
+  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_ROLESEL/direction
+  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_HUBRST/direction
+
+  ${DUO_WRITE} 1 >/sys/class/gpio/gpio$GPIO_HUBPORT_EN/value
+  ${DUO_WRITE} 0 >/sys/class/gpio/gpio$GPIO_ROLESEL/value
+  ${DUO_WRITE} 0 >/sys/class/gpio/gpio$GPIO_HUBRST/value
+}
+
+hub_off() {
+  echo "turn off usb hub"
+  if [ ! -d $SYS_GPIO/gpio$GPIO_HUBPORT_EN ]; then
+      ${DUO_WRITE} $GPIO_HUBPORT_EN >/sys/class/gpio/export
+  fi
+
+  if [ ! -d $SYS_GPIO/gpio$GPIO_ROLESEL ]; then
+      ${DUO_WRITE} $GPIO_ROLESEL >/sys/class/gpio/export
+  fi
+
+  if [ ! -d $SYS_GPIO/gpio$GPIO_HUBRST ]; then
+      ${DUO_WRITE} $GPIO_HUBRST >/sys/class/gpio/export
+  fi
+
+  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_HUBPORT_EN/direction
+  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_ROLESEL/direction
+  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_HUBRST/direction
+
+  ${DUO_WRITE} 0 >/sys/class/gpio/gpio$GPIO_HUBPORT_EN/value
+  ${DUO_WRITE} 1 >/sys/class/gpio/gpio$GPIO_ROLESEL/value
+  ${DUO_WRITE} 1 >/sys/class/gpio/gpio$GPIO_HUBRST/value
+}
+
+case "$1" in
+  host)
+	insmod /mnt/system/ko/dwc2.ko
+  ${DUO_WRITE} host > /proc/cviusb/otg_role
+	;;
+  device)
+	${DUO_WRITE} device > /proc/cviusb/otg_role
+	;;
+  *)
+	echo "Usage: $0 host"
+	echo "Usage: $0 device"
+	exit 1
+esac
+exit $?
diff --git a/board/milkv/duo/overlay/opt/milkv-duo/usb-host.sh b/board/milkv/duo/overlay/opt/milkv-duo/usb-host.sh
new file mode 100755
index 0000000000..4072ecda46
--- /dev/null
+++ b/board/milkv/duo/overlay/opt/milkv-duo/usb-host.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+echo host > /proc/cviusb/otg_role >> /tmp/usb.log 2>&1
diff --git a/board/milkv/duo/overlay/opt/milkv-duo/usb-mass-storage.sh b/board/milkv/duo/overlay/opt/milkv-duo/usb-mass-storage.sh
new file mode 100755
index 0000000000..571e59acdb
--- /dev/null
+++ b/board/milkv/duo/overlay/opt/milkv-duo/usb-mass-storage.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+CONFIG=/etc/milkv-duo.conf
+source ${CONFIG}
+
+/opt/milkv-duo/uhubon.sh device >> /tmp/usb.log 2>&1
+/opt/milkv-duo/run_usb.sh probe msc ${DUO_USB_MASS_STORAGE_ROOT} >> /tmp/usb.log 2>&1
+/opt/milkv-duo/run_usb.sh start >> /tmp/usb.log 2>&1
+
+[ $? = 0 ] && echo "Mass Storage started successfully" || echo "Fail to start Mass Storage"
diff --git a/board/milkv/duo/overlay/opt/milkv-duo/usb-rndis.sh b/board/milkv/duo/overlay/opt/milkv-duo/usb-rndis.sh
new file mode 100755
index 0000000000..787e044b90
--- /dev/null
+++ b/board/milkv/duo/overlay/opt/milkv-duo/usb-rndis.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+/opt/milkv-duo/uhubon.sh device >> /tmp/rndis.log 2>&1
+/opt/milkv-duo/run_usb.sh probe rndis >> /tmp/rndis.log 2>&1
+/opt/milkv-duo/run_usb.sh start rndis >> /tmp/rndis.log 2>&1
+
+sleep 0.5
+ifconfig usb0 192.168.42.1
+
+count=`ps | grep dnsmasq | grep -v grep | wc -l`
+if [ ${count} -lt 1 ] ;then
+  echo "/etc/init.d/S80dnsmasq start" >> /tmp/rndis.log 2>&1
+  /etc/init.d/S80dnsmasq start >> /tmp/rndis.log 2>&1
+fi
diff --git a/board/milkv/duo/patches/opensbi/0001-opensbi-porting-adapt-to-CV180X-CV181X.patch b/board/milkv/duo/patches/opensbi/0001-opensbi-porting-adapt-to-CV180X-CV181X.patch
new file mode 100644
index 0000000000..cd784948be
--- /dev/null
+++ b/board/milkv/duo/patches/opensbi/0001-opensbi-porting-adapt-to-CV180X-CV181X.patch
@@ -0,0 +1,44 @@
+From 2e8190643f1abdfcf6c8b5981b6d6863dea78a08 Mon Sep 17 00:00:00 2001
+From: "sam.xiang" <sam.xiang@sophgo.com>
+Date: Tue, 21 Feb 2023 20:43:18 +0800
+Subject: [PATCH 1/3] [opensbi] porting: adapt to CV180X / CV181X
+
+Change-Id: Id7b3c64d203eb2c9af6c66f195bf0d8a05f0164c
+Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
+---
+ lib/utils/serial/fdt_serial_uart8250.c | 1 +
+ platform/generic/config.mk             | 3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+ mode change 100644 => 100755 lib/utils/serial/fdt_serial_uart8250.c
+
+diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
+old mode 100644
+new mode 100755
+index 918193ae9..c72eeeb89
+--- a/lib/utils/serial/fdt_serial_uart8250.c
++++ b/lib/utils/serial/fdt_serial_uart8250.c
+@@ -26,6 +26,7 @@ static int serial_uart8250_init(void *fdt, int nodeoff,
+ }
+ 
+ static const struct fdt_match serial_uart8250_match[] = {
++	{ .compatible = "snps,dw-apb-uart" },
+ 	{ .compatible = "ns16550" },
+ 	{ .compatible = "ns16550a" },
+ 	{ },
+diff --git a/platform/generic/config.mk b/platform/generic/config.mk
+index 8151974f2..6e09f3332 100644
+--- a/platform/generic/config.mk
++++ b/platform/generic/config.mk
+@@ -28,7 +28,8 @@ else
+   # This needs to be 2MB aligned for 64-bit system
+   FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x200000)))
+ endif
+-FW_JUMP_FDT_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x2200000)))
++#set FDT_ADDR 0xB0000000
++FW_JUMP_FDT_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x30000000)))
+ FW_PAYLOAD=y
+ ifeq ($(PLATFORM_RISCV_XLEN), 32)
+   # This needs to be 4MB aligned for 32-bit system
+-- 
+2.34.1
+
diff --git a/board/milkv/duo/patches/opensbi/0002-fix-set-zicsr-zifencei-and-kill-compile-errors.patch b/board/milkv/duo/patches/opensbi/0002-fix-set-zicsr-zifencei-and-kill-compile-errors.patch
new file mode 100644
index 0000000000..37b009dc48
--- /dev/null
+++ b/board/milkv/duo/patches/opensbi/0002-fix-set-zicsr-zifencei-and-kill-compile-errors.patch
@@ -0,0 +1,59 @@
+From 6b0054b83422b0b964b2ecc5496e136987c1ac16 Mon Sep 17 00:00:00 2001
+From: Hanyuan Zhao <hanyuan-z@qq.com>
+Date: Mon, 16 Oct 2023 21:44:19 +0800
+Subject: [PATCH 2/3] fix: set zicsr zifencei and kill compile errors
+
+Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
+---
+ Makefile | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index eeffe6bad..fa3b18ddc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -157,7 +157,7 @@ ifndef PLATFORM_RISCV_ABI
+ endif
+ ifndef PLATFORM_RISCV_ISA
+   ifneq ($(PLATFORM_RISCV_TOOLCHAIN_DEFAULT), 1)
+-    PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc
++    PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc_zicsr_zifencei
+   else
+     PLATFORM_RISCV_ISA = $(OPENSBI_CC_ISA)
+   endif
+@@ -203,10 +203,9 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
+ GENFLAGS	+=	$(platform-genflags-y)
+ GENFLAGS	+=	$(firmware-genflags-y)
+ 
+-CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
++CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
+ CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ CFLAGS		+=	-mno-save-restore -mstrict-align
+-CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
+ CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ CFLAGS		+=	$(GENFLAGS)
+ CFLAGS		+=	$(platform-cflags-y)
+@@ -217,10 +216,9 @@ CPPFLAGS	+=	$(GENFLAGS)
+ CPPFLAGS	+=	$(platform-cppflags-y)
+ CPPFLAGS	+=	$(firmware-cppflags-y)
+ 
+-ASFLAGS		=	-g -Wall -nostdlib
++ASFLAGS		=	-g -Wall -nostdlib -fno-stack-protector -D__ASSEMBLY__
+ ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ ASFLAGS		+=	-mno-save-restore -mstrict-align
+-ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
+ ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ ASFLAGS		+=	$(GENFLAGS)
+ ASFLAGS		+=	$(platform-asflags-y)
+@@ -236,7 +234,7 @@ MERGEFLAGS	+=	-r
+ MERGEFLAGS	+=	-b elf$(PLATFORM_RISCV_XLEN)-littleriscv
+ MERGEFLAGS	+=	-m elf$(PLATFORM_RISCV_XLEN)lriscv
+ 
+-DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
++DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-stack-protector -fno-builtin -D__DTS__ -x assembler-with-cpp
+ 
+ # Setup functions for compilation
+ define dynamic_flags
+-- 
+2.34.1
+
diff --git a/board/milkv/duo/patches/opensbi/0003-fix-initialize-the-value-of-a-variable-in-stack.patch b/board/milkv/duo/patches/opensbi/0003-fix-initialize-the-value-of-a-variable-in-stack.patch
new file mode 100644
index 0000000000..0b1f5e7302
--- /dev/null
+++ b/board/milkv/duo/patches/opensbi/0003-fix-initialize-the-value-of-a-variable-in-stack.patch
@@ -0,0 +1,26 @@
+From 1d96d3e9f82e81991152aafb44fa5f0ec493a9d2 Mon Sep 17 00:00:00 2001
+From: Hanyuan Zhao <zhaohy22@mails.tsinghua.edu.cn>
+Date: Mon, 16 Oct 2023 21:48:21 +0800
+Subject: [PATCH 3/3] fix: initialize the value of a variable in stack
+
+Signed-off-by: Hanyuan Zhao <zhaohy22@mails.tsinghua.edu.cn>
+---
+ lib/utils/reset/fdt_reset_thead.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/utils/reset/fdt_reset_thead.c b/lib/utils/reset/fdt_reset_thead.c
+index 95f8c369c..805067859 100644
+--- a/lib/utils/reset/fdt_reset_thead.c
++++ b/lib/utils/reset/fdt_reset_thead.c
+@@ -62,7 +62,7 @@ static int thead_reset_init(void *fdt, int nodeoff,
+ 	void *p;
+ 	const fdt64_t *val;
+ 	const fdt32_t *val_w;
+-	int len, i, cnt;
++	int len, i, cnt=0;
+ 	u32 t, tmp = 0;
+ 
+ 	/* Prepare clone csrs */
+-- 
+2.34.1
+
diff --git a/board/milkv/duo/post-image.sh b/board/milkv/duo/post-image.sh
new file mode 100755
index 0000000000..bebd76a4ad
--- /dev/null
+++ b/board/milkv/duo/post-image.sh
@@ -0,0 +1,52 @@
+#!/bin/sh
+
+###########################################################
+# File: post-image.sh
+# Author: GP Orcullo <kinsamanka@gmail.com>
+# Description: this sh will make the fip.bin and boot.sd,
+#              then pack everything to an image file.
+###########################################################
+if grep -Eq "^BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL=y$" ${BR2_CONFIG}; then
+    if grep -Eq "^BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y$" ${BR2_CONFIG}; then
+        ${BINARIES_DIR}/fiptool.py genfip ${BINARIES_DIR}/fip.bin \
+        --MONITOR_RUNADDR=0x80000000 \
+        --CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
+        --NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
+        --NAND_INFO=00000000 \
+        --BL2=${BINARIES_DIR}/bl2.bin \
+        --BLCP_IMG_RUNADDR=0x05200200 \
+        --BLCP_PARAM_LOADADDR=0 \
+        --DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
+        --MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
+        --LOADER_2ND=${BINARIES_DIR}/u-boot.bin \
+        --BLCP=${BINARIES_DIR}/empty.bin \
+        --BLCP_2ND=${BINARIES_DIR}/cvirtos.bin \
+        --BLCP_2ND_RUNADDR=0x83f40000 \
+        > ${BINARIES_DIR}/fip.log 2>&1
+        echo "[Duo Post-Image fiptool.py] FreeRTOS integrated"
+    else
+        ${BINARIES_DIR}/fiptool.py genfip ${BINARIES_DIR}/fip.bin \
+        --MONITOR_RUNADDR=0x80000000 \
+        --CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
+        --NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
+        --NAND_INFO=00000000 \
+        --BL2=${BINARIES_DIR}/bl2.bin \
+        --BLCP_IMG_RUNADDR=0x05200200 \
+        --BLCP_PARAM_LOADADDR=0 \
+        --DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
+        --MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
+        --LOADER_2ND=${BINARIES_DIR}/u-boot.bin \
+        > ${BINARIES_DIR}/fip.log 2>&1
+        echo "[Duo Post-Image fiptool.py] No FreeRTOS integrated"
+    fi
+
+    cp ${BINARIES_DIR}/u-boot.dtb ${BINARIES_DIR}/cv1800b_milkv_duo_sd.dtb
+    lzma -fk ${BINARIES_DIR}/Image
+    mkimage -f ${BINARIES_DIR}/multi.its ${BINARIES_DIR}/boot.sd
+    echo "[Duo Post-Image] > boot.sd generated!"
+    support/scripts/genimage.sh -c $(pwd)/board/milkv/duo/genimage.cfg
+    gzip -fk ${BINARIES_DIR}/sdcard.img
+    echo "[Duo Post-Image] > sdcard.img generated!"
+else
+    echo "[Duo Post-Image] Not requested to generate the boot files and sdcard.img"
+fi
\ No newline at end of file
diff --git a/configs/milkv_duo_musl_riscv64_64mb_defconfig b/configs/milkv_duo_musl_riscv64_64mb_defconfig
new file mode 100644
index 0000000000..e97677d891
--- /dev/null
+++ b/configs/milkv_duo_musl_riscv64_64mb_defconfig
@@ -0,0 +1,94 @@
+BR2_riscv=y
+BR2_riscv_g=y
+BR2_RISCV_ISA_RVC=y
+BR2_TOOLCHAIN_BUILDROOT_MUSL=y
+BR2_KERNEL_HEADERS_5_10=y
+BR2_GCC_VERSION_13_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_LDFLAGS="-march=rv64imafdc_xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov_xtheadfmemidx_xtheadfmv_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheadsync"
+BR2_GLOBAL_PATCH_DIR="board/milkv/duo/patches"
+BR2_TARGET_GENERIC_HOSTNAME="milkv-duo"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Milk-V"
+BR2_TARGET_GENERIC_ROOT_PASSWD="milkv"
+BR2_ROOTFS_OVERLAY="board/milkv/duo/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/milkv/duo/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="duo-linux-5.10.4"
+BR2_LINUX_KERNEL_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
+BR2_LINUX_KERNEL_LZMA=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_GZIP=y
+BR2_PACKAGE_LZIP=y
+BR2_PACKAGE_UNZIP=y
+BR2_PACKAGE_ZIP=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_GDB_DEBUGGER=y
+BR2_PACKAGE_SPIDEV_TEST=y
+BR2_PACKAGE_STRACE=y
+BR2_PACKAGE_BINUTILS=y
+BR2_PACKAGE_GREP=y
+BR2_PACKAGE_MAKE=y
+BR2_PACKAGE_PATCH=y
+BR2_PACKAGE_TREE=y
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_E2FSPROGS=y
+BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
+BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL=y
+BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB=y
+BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y
+BR2_PACKAGE_MILKV_DUO_PINMUX=y
+BR2_PACKAGE_EVTEST=y
+BR2_PACKAGE_PYTHON3=y
+BR2_PACKAGE_PYTHON_EVDEV=y
+BR2_PACKAGE_PYTHON_LXML=y
+BR2_PACKAGE_PYTHON_MODBUS_TK=y
+BR2_PACKAGE_PYTHON_PILLOW=y
+BR2_PACKAGE_PYTHON_PIP=y
+BR2_PACKAGE_PYTHON_SMBUS_CFFI=y
+BR2_PACKAGE_PYTHON_SPIDEV=y
+BR2_PACKAGE_FREETYPE=y
+BR2_PACKAGE_JSON_C=y
+BR2_PACKAGE_DHCPCD=y
+BR2_PACKAGE_DNSMASQ=y
+BR2_PACKAGE_DROPBEAR=y
+BR2_PACKAGE_LRZSZ=y
+BR2_PACKAGE_NTP=y
+BR2_PACKAGE_NTP_NTPDATE=y
+BR2_PACKAGE_NTP_NTPTIME=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
+BR2_PACKAGE_NEOFETCH=y
+BR2_PACKAGE_TMUX=y
+BR2_PACKAGE_WHICH=y
+BR2_PACKAGE_HTOP=y
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_NANO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+BR2_TARGET_ROOTFS_TAR_XZ=y
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_GIT=y
+BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/T-head-Semi/opensbi.git"
+BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="4e77060e0512ad981eee55d5a2501f6d88a41fd9"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
+BR2_TARGET_OPENSBI_FW_FDT_PATH=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2021.10_64mb"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_PACKAGE_HOST_CMAKE=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_LZMA_ALONE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
diff --git a/configs/milkv_duo_musl_riscv64_defconfig b/configs/milkv_duo_musl_riscv64_defconfig
new file mode 100644
index 0000000000..bd79f138f6
--- /dev/null
+++ b/configs/milkv_duo_musl_riscv64_defconfig
@@ -0,0 +1,93 @@
+BR2_riscv=y
+BR2_riscv_g=y
+BR2_RISCV_ISA_RVC=y
+BR2_TOOLCHAIN_BUILDROOT_MUSL=y
+BR2_KERNEL_HEADERS_5_10=y
+BR2_GCC_VERSION_13_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_LDFLAGS="-march=rv64imafdc_xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov_xtheadfmemidx_xtheadfmv_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheadsync"
+BR2_GLOBAL_PATCH_DIR="board/milkv/duo/patches"
+BR2_TARGET_GENERIC_HOSTNAME="milkv-duo"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Milk-V"
+BR2_TARGET_GENERIC_ROOT_PASSWD="milkv"
+BR2_ROOTFS_OVERLAY="board/milkv/duo/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/milkv/duo/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="duo-linux-5.10.4"
+BR2_LINUX_KERNEL_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
+BR2_LINUX_KERNEL_LZMA=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_GZIP=y
+BR2_PACKAGE_LZIP=y
+BR2_PACKAGE_UNZIP=y
+BR2_PACKAGE_ZIP=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_GDB_DEBUGGER=y
+BR2_PACKAGE_SPIDEV_TEST=y
+BR2_PACKAGE_STRACE=y
+BR2_PACKAGE_BINUTILS=y
+BR2_PACKAGE_GREP=y
+BR2_PACKAGE_MAKE=y
+BR2_PACKAGE_PATCH=y
+BR2_PACKAGE_TREE=y
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_E2FSPROGS=y
+BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
+BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL=y
+BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y
+BR2_PACKAGE_MILKV_DUO_PINMUX=y
+BR2_PACKAGE_EVTEST=y
+BR2_PACKAGE_PYTHON3=y
+BR2_PACKAGE_PYTHON_EVDEV=y
+BR2_PACKAGE_PYTHON_LXML=y
+BR2_PACKAGE_PYTHON_MODBUS_TK=y
+BR2_PACKAGE_PYTHON_PILLOW=y
+BR2_PACKAGE_PYTHON_PIP=y
+BR2_PACKAGE_PYTHON_SMBUS_CFFI=y
+BR2_PACKAGE_PYTHON_SPIDEV=y
+BR2_PACKAGE_FREETYPE=y
+BR2_PACKAGE_JSON_C=y
+BR2_PACKAGE_DHCPCD=y
+BR2_PACKAGE_DNSMASQ=y
+BR2_PACKAGE_DROPBEAR=y
+BR2_PACKAGE_LRZSZ=y
+BR2_PACKAGE_NTP=y
+BR2_PACKAGE_NTP_NTPDATE=y
+BR2_PACKAGE_NTP_NTPTIME=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
+BR2_PACKAGE_NEOFETCH=y
+BR2_PACKAGE_TMUX=y
+BR2_PACKAGE_WHICH=y
+BR2_PACKAGE_HTOP=y
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_NANO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+BR2_TARGET_ROOTFS_TAR_XZ=y
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_GIT=y
+BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/T-head-Semi/opensbi.git"
+BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="4e77060e0512ad981eee55d5a2501f6d88a41fd9"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
+BR2_TARGET_OPENSBI_FW_FDT_PATH=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2021.10_ion"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_PACKAGE_HOST_CMAKE=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_LZMA_ALONE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.34.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

