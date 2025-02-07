Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB88C02196
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 18:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ADAC42C97;
	Fri,  7 Feb 2025 18:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHX7aTlXr7F6; Fri,  7 Feb 2025 18:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB4842C90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB4842C90;
	Fri,  7 Feb 2025 18:35:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37141CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 275E9814A1
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atRDK1TQSJoY for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 18:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 925508175B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925508175B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 925508175B
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:35:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDp4-1tVWzW1iTg-00rYr3; Fri, 07
 Feb 2025 19:35:18 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Michael Walle <mwalle@kernel.org>
Date: Fri,  7 Feb 2025 19:34:55 +0100
Message-ID: <20250207183455.1468220-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207183455.1468220-1-fiona.klute@gmx.de>
References: <20250207183455.1468220-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1OBFpDk3VfImDKY5yoFRtuBvhEG5N2oUYbHPtU55pzYbRgSFgl1
 PsU9Hu+x7HjdoMoosNkhq1OhwRvTnpeO3j/fLsrDqP6q9CwQqHVSlQV0QbPIBR9/LL1QgC7
 P+qyqMdY8QTsq7j3/JmI9imdQSvzkTjLilAt6mb425A757g5zdHQWi7c/8OPO2NDCTZv2re
 LyVKESFutdbLRxUu9Fuhg==
UI-OutboundReport: notjunk:1;M01:P0:efRkeIIAi0o=;cx38LIB+5Ahuws+nhLA8dN6T+PF
 1r4FoyzbPg4sUv9Z1fhPeh5B7XIXtimaiI/2hrAXyh3kcQR/KvWWu9vagPwX34k2qVfGggGeh
 vOKHvPyv466udSvelOTU/TFPNmLsEzTDhRmc/HsN+z8VSOuX7GjiU64EIAHPsqi00SED3mpAC
 5pvfcecezjiKZeckjnrXljg5Lfc65X5fRmHotYWhkYu5heQ0a1ChJHXKFjRJ7wiLbXxpAfZZa
 p64l8EWUsUBeGIBSaQ0VX++Zfdi7pagmgZtqeefqQdNH6kFIA35Ypm7MtOO3EL1Eu7jTkUErv
 IvqL7RPehBwDq+qrP/DGIv87IJsSK4jFxlZb5rHsWQpF7IpkC7cXHEeOGB4dEaRwxSDjhZ4Na
 8cLW5UFxkky6Fsllx5cRKZdSxiIWFLOwqDBfmOL0MPw8XfIcjgMSfpQfa5cCKJ65JIk5ukyoq
 q4Ho7/Fc89aZcyzxgmIkdwNPokVZZMQCQmDQoPfeXy7R//JwGueTe5p62O8mS3f3xPTPNIPI5
 po7MvKwcP6h7RXB+gDUYjBLSGldpDo7XrVj5u2PhqnnT9beAmCqza5G+2eTfZQJjOGLhVn4I+
 YvKfxYO7xwdO1hqiu3WFmEgF5eDr9ANTUN15qDzU+ElsxwF9WD4FYkk+LFIqarRTlnTpVr5Cc
 9syToWzw9gMBNjAaedWKSXllTY6GZwt2KOt+v58sbgbnhJRBpJ3Q6ex4yTnzwpP8vQ27D919U
 J/gdowuTa7w7egKmvUtpxrc0pn17wj6cQkNSTndZ6KsYbrO4jQSeLm/f8P8mBe7iJP3MBfIjn
 DoorYLJk8R0TRibKDi0ONPvynV59IRls0FDaVWRfKD0cgGHvcDu6WDGn96WEfv1bI3hrUvxKo
 qL1fMoiiTkuo2xRFVT87HMD1r/prq1AcBr+zVnw/ibKSc6gGSWF7gQUpmFlpI9AxciSSn1xOz
 DNHJ77xuQ4AkThHx/pMvspu5+CAe3/3nTaqihLgA0ftmq5v3fhmVOedLn9JeetD3iLGN/e5+l
 NhaUCjSMBLnCXoEK0JZ+7odZbRPsn7oahepxsl4+LMm5T+C/ai2hlbca6KRtzO3XzR31EPFQv
 Y+8WFg3GELDrBgQBsd6jTBfD3AhtMZDqLpzvyxp95jWevEW9ufe5mVexXzv87nG+zmjAP3Vkk
 2oqI145ibUUcyvPjBoPD/WNls3LXgHNpDI4tgnmNZmBVWTKvFdimpnJvYBv4RVHWbnuWGzMX+
 nXtu971FIChA6wbAdyaGY7D/ebgQjlpop0eDBsFnyMgf6vi2mh4ZAM/jGXzP/nYohnxyeDAKq
 0YEwDv7v9Jpt5PpnrE0Iitlo4yWQlZl3BLzgxdCJZoch6GfWUf/wFfQe1aRGq7hVCRNwu3RaM
 pdMhSyLFgY+AL5boT4fiSXPi5KVcHv0K8AWxTUEtJhHyO0k2NrMVslLdERFfqyvgGXcqvKJRD
 SkmXTyg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738953318; x=1739558118; i=fiona.klute@gmx.de;
 bh=r9+gnQJcJklpvhksStEDJlt2Bgy8d1O8P9IBFlwQXhs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uTMXc6XrO0W34di0d8+rs9V9p4eRcC73ut8yEP4/qsuA6fhg5maZMc0/XvdaiGwh
 JReUWyvyGHY51GhK220fU7yduOBdqOIwzoOzShfEMOQIhK9TNRP1+j4s63qvCVpg3
 LjC13j6KuyPoXK2FBY8UWlD3kCdPA6JP8tzTmXCaXn3Bi8QCn1+X5joBYRl8FaHah
 yGbJ8Jc5fDJfy0U7uqXfxii/Tz2vXEc8LmYh4I6Z8Yc6+hVPlLzHtVbooSH1FJB2c
 DtYnjjZ4wMshrWxdEy1KiUl/MRJEhDiP/DDI26mAJ8E6HQMupSyADsnAA9EkEziit
 0a8xxzjHn7puvWo3rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=uTMXc6Xr
Subject: [Buildroot] [PATCH v2 3/3] package/custom-dtbs: example defconfig
 based on raspberrypizero2w_64_defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The purpose of this defconfig is to demonstrate hos
package/custom-dtbs can be used. The "full" DT adds a
/chosen/buildroot node, with the setting itself contained in a custom
.dtsi file, the overlay disables Bluetooth.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Patch added in v2, to add the example defconfig requested in review.

 .../config_zero2w_64bit_custom_dt.txt         | 20 +++++++
 .../raspberrypizero2w_64_custom_dt_defconfig  | 34 +++++++++++
 .../custom-dtbs/examples/buildroot-test.dts   |  6 ++
 .../custom-dtbs/examples/buildroot-test.dtsi  |  3 +
 .../examples/disable-bt-example.dtso          | 59 +++++++++++++++++++
 5 files changed, 122 insertions(+)
 create mode 100644 board/raspberrypi/config_zero2w_64bit_custom_dt.txt
 create mode 100644 configs/raspberrypizero2w_64_custom_dt_defconfig
 create mode 100644 package/custom-dtbs/examples/buildroot-test.dts
 create mode 100644 package/custom-dtbs/examples/buildroot-test.dtsi
 create mode 100644 package/custom-dtbs/examples/disable-bt-example.dtso

diff --git a/board/raspberrypi/config_zero2w_64bit_custom_dt.txt b/board/raspberrypi/config_zero2w_64bit_custom_dt.txt
new file mode 100644
index 0000000000..d0ed3dfbe3
--- /dev/null
+++ b/board/raspberrypi/config_zero2w_64bit_custom_dt.txt
@@ -0,0 +1,20 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+device_tree=buildroot-test.dtb
+dtoverlay=disable-bt-example
+enable_uart=1
+
+# enable 64bits support
+arm_64bit=1
diff --git a/configs/raspberrypizero2w_64_custom_dt_defconfig b/configs/raspberrypizero2w_64_custom_dt_defconfig
new file mode 100644
index 0000000000..b0fe6e8bb4
--- /dev/null
+++ b/configs/raspberrypizero2w_64_custom_dt_defconfig
@@ -0,0 +1,34 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w-64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w-64/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypizero2w-64/config_zero2w_64bit_custom_dt.txt"
+BR2_PACKAGE_CUSTOM_DTBS=y
+BR2_PACKAGE_CUSTOM_DTBS_SOURCE="package/custom-dtbs/examples/buildroot-test.dts package/custom-dtbs/examples/buildroot-test.dtsi package/custom-dtbs/examples/disable-bt-example.dtso"
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_KMOD_XZ=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/package/custom-dtbs/examples/buildroot-test.dts b/package/custom-dtbs/examples/buildroot-test.dts
new file mode 100644
index 0000000000..591265e4d7
--- /dev/null
+++ b/package/custom-dtbs/examples/buildroot-test.dts
@@ -0,0 +1,6 @@
+/dts-v1/;
+
+/* include from kernel source */
+#include <arm/broadcom/bcm2710-rpi-zero-2-w.dts>
+/* local include */
+#include "buildroot-test.dtsi"
diff --git a/package/custom-dtbs/examples/buildroot-test.dtsi b/package/custom-dtbs/examples/buildroot-test.dtsi
new file mode 100644
index 0000000000..423ed7d6f2
--- /dev/null
+++ b/package/custom-dtbs/examples/buildroot-test.dtsi
@@ -0,0 +1,3 @@
+&chosen {
+	buildroot = "example";
+};
diff --git a/package/custom-dtbs/examples/disable-bt-example.dtso b/package/custom-dtbs/examples/disable-bt-example.dtso
new file mode 100644
index 0000000000..f3a8af1375
--- /dev/null
+++ b/package/custom-dtbs/examples/disable-bt-example.dtso
@@ -0,0 +1,59 @@
+/dts-v1/;
+/plugin/;
+
+/* Disable Bluetooth and restore UART0/ttyAMA0 over GPIOs 14 & 15. */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/{
+	compatible = "brcm,bcm2835";
+
+	fragment@0 {
+		target = <&uart1>;
+		__overlay__ {
+			status = "disabled";
+		};
+	};
+
+	fragment@1 {
+		target = <&uart0>;
+		__overlay__ {
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins>;
+			status = "okay";
+		};
+	};
+
+	fragment@2 {
+		target = <&bt>;
+		__overlay__ {
+			status = "disabled";
+		};
+	};
+
+	fragment@3 {
+		target = <&uart0_pins>;
+		__overlay__ {
+			brcm,pins;
+			brcm,function;
+			brcm,pull;
+		};
+	};
+
+	fragment@4 {
+		target = <&bt_pins>;
+		__overlay__ {
+			brcm,pins;
+			brcm,function;
+			brcm,pull;
+		};
+	};
+
+	fragment@5 {
+		target-path = "/aliases";
+		__overlay__ {
+			serial0 = "/soc/serial@7e201000";
+			serial1 = "/soc/serial@7e215040";
+		};
+	};
+};
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
