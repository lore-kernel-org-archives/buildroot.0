Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58587606A321
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WSFFDmsT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qri6dgHC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF184060E;
	Mon, 23 Nov 2026 21:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGOfIQxa84L6; Mon, 23 Nov 2026 21:10:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 788F640687
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795468255;
	b=ExxN2BI4ptt2vqu04Q/HSyCF6zYhD5YcRS3vRNTgGOu6XuRVjEsrLyZ3mOybewsG35Ya
	 JPMQJfjGCKiG34im6RTqTob3e7yVzteOGOrvWUQGFsR+CpAZ8h0g9jtuM4txg4jbxFW1r
	 brgTrZXZKrmlXeItmitHIqX+DYmWfItnzWNCfubv46iY5caKrU8FB2W+9u9J+ZyynBka1
	 W1HJnnrpOBBCoFP5E+a6wu7Ldw/jI98NlE3KX1eNiuzOsyPxWevJirrcMVCJxw9i32tu6
	 R1YNp5YmpBeB8jwNVrY2qH3iJxM5SybzDBGpczy9Vnx6f/qgio8m4fIpr/oFqm2pOFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795468255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Mx5I0jGO4zNkyOQQjxSippvVXsI5/sxWVI2Q+YPfXg8=;
	b=CfKINGwyczWceCdfALOJsI0ovkZiXCrOihJnqsMABp9b4nxGXsfZTpOW5C1NsXnUjmgT
	 2w0NuDbXfwB5/tg8eVD/NXQq/WJuqwd/uOFiBMB/AwAWy28ymbb8oerRnkrpPxGsWUzzE
	 aYlyKCC5If7dujH+ESZ7O+6CCDBr3sw43GGrdRzuTNnLUplEzMUtx/2BqbqloeDqajWZ2
	 rldkWJ5ZaziqaJIwanU8nUGgJLGFbtpYHT+r0cmhETtnIa2XST0zLbifvb6FLjLDcVmZk
	 zOBu3s/vcdKJdy8fS8m0Bot5Icph4ASGFi26KBBXjgTb/rmOCn1Bn2zFaQC183xU9Qw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795468255;
	bh=Mx5I0jGO4zNkyOQQjxSippvVXsI5/sxWVI2Q+YPfXg8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WSFFDmsTwbfNwpQHLW0kDTcMHsq/28+wd/o413161+L+OjTJ8ZM906DgXPbOVcLpl
	 OJWR+OEgys//Sv+7gxoKw8n8l3E3yHXfMVz0fWz/K0Ae/epbLJ5xW71fmY1Y/9WhLF
	 orrQ3m7hxDLWRdS1SBlUxlFedl1uu1ThOQX/kWmN7RZmdcLV+LfjEKtqzsSHwrgAtW
	 bNrxxEqtncrLeLTnR0ebeF1DCLk6Dz4w0cUVrHcnk32CqAW7OLtsMxkl4Iw3CSFxAx
	 lkptwb1lwc+kHnINjfRDvqU3psE8qby5yfoMGNAO9mzy/RgYLTEdAOJN7Oji9KhpYU
	 Y6NYO7nFdfL/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 788F640687;
	Mon, 23 Nov 2026 21:10:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BAB12311
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0CD880DD1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzqfpTaF4KBE for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:10:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D79CD80E9D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=outtierbert@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Qri6dgHC
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D79CD80E9D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:10:51 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b87a1a2babso8885041a12.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 13:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795468249; x=1796073049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3ve36AnQysR09vA1gvmx+Z3+n2JEr2r4/7GrhqZeAyI=;
 b=Qri6dgHC/p14cQwVhmO16Aoq7OLigloH65bHcsLYh8WvkBeF3rWjOZd819p+axXjIw
 f9nQzPDoCDqP3/mNrvDKAs8KHS0mSPcsxzRXktcD23jeSpYd3l+XvvWDCKK6AYe8CaX4
 0zboHhGC4Q2pwHfFkibwCd1b+vSCM5GRaKFuZ5l1ZCY18pFW6YQbeD8w8nGUfWfFGeW0
 BlUlipcaN2z79uVG9uEfCXVAmA11fEYtVOFEYa2xrltHIyj9lpQwLRfuJ5L8Kiezew5m
 aXEnYHqitL4Au3oyLmGWMKhIexzKoafNzhcIeoXyduGgezN6Vwu1w6+hB7xdrGjR4Kho
 4BFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795468249; x=1796073049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3ve36AnQysR09vA1gvmx+Z3+n2JEr2r4/7GrhqZeAyI=;
 b=O9HQNGfkUwzmJHd9uz2JfPXQouKexI9eELPHVp7cLgxXu3MBizKVM3GYTXVjjiM18E
 u8rxg6utUfnJVkWbHkM6lOtUz3AcptUph0YX17DE+9rRdUqaGF6f1wLuwSmRpaHN65OV
 smHOynuGZ0bAT8CPfS6RSG8mn1fmIyc18hTyskrxF0tOjTa0LtmRa9saqYy1pQctQVxk
 UGUE7MYBHvfmFBbCQaACbYKzSTo4nlsG2OVmj6KtIwWyCAu/a6UQVpI56F+eehrpqTC3
 bFqOtZDnGB7BGXFj35n6CsT/jTBqML0tUa9RcUZrWuCJA8KoTSEFZ/87cz7co1HDplrr
 99Ew==
X-Gm-Message-State: APuU4Z/RZdI5tFrIBo7C4w+YdVAJ+0qC16tQ1FDiiPH8bgw0u2oveF6F
 wBaccUfgMdgDB/DIjbFMUUGNx6eTQO8jsizyp4svOFoZHTio67B6cpRt7JPAqQ==
X-Gm-Gg: AZFdTZcQvUbAe5B9Ijp6xXEsrd4TouOUmc8TY5wp1haAivNfhDk9DZS4/+ps2mq25IR
 I2zWBSE1W2ibUG1qHibnyAnmn2lG1oCGiQ/XZ1UK32t/IKXhs8wpJ7LmEbd+iULhTxyFonOumjj
 qaLPSO7jIEIWhBO/mcCcKLz29LwpYHrO1MrzoRJ76qop7Bllxuvt31YKSjIr9zABP+Gz/gPOZsy
 VAWDmJTVDVVyBBO8jYpEAJNuFIzUd2NDSnkM9lLklNSlTIvxEIb5GjJn3g/ZRzteY6LpP6UhLtr
 wHXeVw7q0clLL4B9DNO3aTv6GRensIaSw4T1gwtUImYrqZ2DPIYgLI2Shk2wYEWYy65vnXjmMPT
 8QjYa+4w1i2vn34cMKQvM5zHK8n66vsq9SSeHQYTGGRJ05howoFvP0PWHJpfgNoeWzjyANdMC2e
 l9E4HIs2REkZK6wqGfsQElFkYXkWZg46AKMEukXPToJ/RQxrKpnWPpClezFMvgqs/Px/QqgVlbt
 l8bY0X96uZ/wgtDlvJqEinhOPI5r2uNtMsFpkyLFvrThtVOIPGehCFw0Rnl16Zj0hQt650dRS9D
 WFXD4Dy5M7vxUrfb76rbrIr+cGZ9KYzfMRWxh7JbCAnzho6OqJasvp8+6Mi2Ynqk9IaivjyejWl
 GAkbiVpxeKE9aXU/4
X-Received: by 2002:aa7:d698:0:b0:6b4:7b32:eb48 with SMTP id
 4fb4d7f45d1cf-6ba1fafc91cmr7573807a12.7.1795468249157; 
 Mon, 23 Nov 2026 13:10:49 -0800 (PST)
Received: from bert-Precision-5530.local
 (195.6-132-109.adsl-dyn.isp.belgacom.be. [109.132.6.195])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6ba3710721bsm6068600a12.29.2026.11.23.13.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 13:10:48 -0800 (PST)
From: Bert Outtier <outtierbert@gmail.com>
To: buildroot@buildroot.org
Cc: Bert Outtier <outtierbert@gmail.com>
Date: Mon, 23 Nov 2026 22:10:40 +0100
Message-ID: <20261123211046.1694048-1-outtierbert@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/phyxbe_tess: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the Phyx Tess board, an Adafruit Feather compatible
board built around the Allwinner T113-S3 (2x Cortex-A7, 128 MB DDR3
in package), with:
- USB-C connector (USB device, FEL)
- microSD card connector on SDC0
- ESP32-C3 WiFi/BLE co-processor (SPI0 for WiFi with esp-hosted,
  UART2 for BLE HCI)
- MIPI DSI display connector
- Adafruit Feather headers (UART5, SPI1, I2C3, GPIO, ADC)
- USB1 host and UART3 console on extra header pins
- Li-ion charger, its status as a gpio-charger power supply

The board has no upstream device tree yet: it is shared between Linux
and U-Boot (BR2_TARGET_UBOOT_CUSTOM_DTS_PATH). U-Boot uses the
mangopi_mq_r defconfig (same SoC and DRAM) with a fragment for the
device tree.

Signed-off-by: Bert Outtier <outtierbert@gmail.com>
---
 DEVELOPERS                                    |   4 +
 board/phyxbe/tess/genimage.cfg                |  23 ++
 .../patches/linux-headers/linux-headers.hash  |   1 +
 board/phyxbe/tess/patches/linux/linux.hash    |   2 +
 board/phyxbe/tess/patches/uboot/uboot.hash    |   2 +
 board/phyxbe/tess/readme.txt                  |  76 +++++
 .../boot/extlinux/extlinux.conf               |   4 +
 .../rootfs_overlay/etc/network/interfaces     |   6 +
 .../rootfs_overlay/etc/wpa_supplicant.conf    |   8 +
 board/phyxbe/tess/sun8i-t113s-tess.dts        | 287 ++++++++++++++++++
 board/phyxbe/tess/uboot.fragment              |   7 +
 configs/phyxbe_tess_defconfig                 |  45 +++
 12 files changed, 465 insertions(+)
 create mode 100644 board/phyxbe/tess/genimage.cfg
 create mode 120000 board/phyxbe/tess/patches/linux-headers/linux-headers.hash
 create mode 100644 board/phyxbe/tess/patches/linux/linux.hash
 create mode 100644 board/phyxbe/tess/patches/uboot/uboot.hash
 create mode 100644 board/phyxbe/tess/readme.txt
 create mode 100644 board/phyxbe/tess/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/phyxbe/tess/rootfs_overlay/etc/network/interfaces
 create mode 100644 board/phyxbe/tess/rootfs_overlay/etc/wpa_supplicant.conf
 create mode 100644 board/phyxbe/tess/sun8i-t113s-tess.dts
 create mode 100644 board/phyxbe/tess/uboot.fragment
 create mode 100644 configs/phyxbe_tess_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..55fe1a0531 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -556,6 +556,10 @@ F:	package/zix/
 F:	package/znc/
 F:	support/testing/tests/package/test_perl_html_parser.py
 
+N:	Bert Outtier <outtierbert@gmail.com>
+F:	board/phyxbe/
+F:	configs/phyxbe_tess_defconfig
+
 N:	Biagio Montaruli <biagio.hkr@gmail.com>
 F:	board/acmesystems/
 F:	configs/acmesystems_*
diff --git a/board/phyxbe/tess/genimage.cfg b/board/phyxbe/tess/genimage.cfg
new file mode 100644
index 0000000000..f4d91abff5
--- /dev/null
+++ b/board/phyxbe/tess/genimage.cfg
@@ -0,0 +1,23 @@
+# Tess microSD card
+#
+#   8 KiB  U-Boot with SPL (the T113 boot ROM loads it from 8 KiB)
+#   4 MiB  mmcblk0p1: root filesystem, with the kernel, the device tree
+#          and /boot/extlinux/extlinux.conf for U-Boot
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 4M
+	}
+}
diff --git a/board/phyxbe/tess/patches/linux-headers/linux-headers.hash b/board/phyxbe/tess/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/phyxbe/tess/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/phyxbe/tess/patches/linux/linux.hash b/board/phyxbe/tess/patches/linux/linux.hash
new file mode 100644
index 0000000000..f83883b936
--- /dev/null
+++ b/board/phyxbe/tess/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/phyxbe/tess/patches/uboot/uboot.hash b/board/phyxbe/tess/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/phyxbe/tess/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/phyxbe/tess/readme.txt b/board/phyxbe/tess/readme.txt
new file mode 100644
index 0000000000..0bc12867a3
--- /dev/null
+++ b/board/phyxbe/tess/readme.txt
@@ -0,0 +1,76 @@
+Phyx Tess
+=========
+
+Tess is an Adafruit Feather compatible board built around the Allwinner
+T113-S3 (dual core Cortex-A7, 1 GHz, 128 MB DDR3 in package), made by
+Phyx.
+
+https://phyx.be
+https://github.com/phyx-be/TESS
+
+Board features:
+- USB-C connector (USB0: USB device, and the FEL USB bootloader)
+- microSD card connector on SDC0
+- ESP32-C3 WiFi/BLE co-processor (SPI0 for WiFi, UART2 for BLE HCI)
+- MIPI DSI display connector
+- Adafruit Feather headers (UART5, SPI1, I2C3, GPIO, ADC)
+- USB1 host and UART3: two extra pins at the end of each Feather
+  header row
+- RESET and BOOT buttons
+
+How to build
+============
+
+$ make phyxbe_tess_defconfig
+$ make
+
+This creates output/images/sdcard.img, with:
+
+    8 KiB  U-Boot with SPL (the T113 boot ROM loads it from 8 KiB)
+    4 MiB  mmcblk0p1: root filesystem (ext4), with the kernel, the
+           device tree and /boot/extlinux/extlinux.conf for U-Boot
+
+How to write the image
+======================
+
+Take the microSD card out of the board and plug it in the host. Write
+the image to it, where sdX is the card:
+
+$ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
+
+Then plug the card back in the board and power it up: it boots from
+the card.
+
+Serial console
+==============
+
+The Linux and U-Boot console is UART3 (ttyS3), 115200 8N1, 3.3V levels,
+on the two extra pins at the end of the 12-pin Feather header row (U3T
+and U3R on the silkscreen). Connect a 3.3V USB-serial adapter:
+
+  U3T: UART3.TX (PB6)  -> RX of the USB-serial adapter
+  U3R: UART3.RX (PB7)  -> TX of the USB-serial adapter
+  GND                  -> GND of the USB-serial adapter
+
+Do not connect the VCC pin of the adapter, and do not use a 5V adapter.
+
+$ picocom -b 115200 /dev/ttyUSB0
+
+WiFi
+====
+
+WiFi goes through the ESP32-C3 with esp-hosted: the esp32_spi kernel
+module (esp-hosted package) talks over SPI0 to the esp-hosted firmware
+on the ESP32-C3. That firmware is not built by Buildroot: the ESP32-C3
+must already run the network_adapter firmware of esp-hosted-linux
+(https://github.com/espressif/esp-hosted-linux, esp/esp_driver/) built
+from the same commit as the esp-hosted package, as the driver refuses a
+firmware of another version.
+
+Edit board/phyxbe/tess/rootfs_overlay/etc/wpa_supplicant.conf, or
+/etc/wpa_supplicant.conf once on the board:
+
+* Replace YOURSSID with your AP ssid
+* Replace YOURPASSWD with your AP password
+
+The MIPI DSI display is not enabled in this configuration.
diff --git a/board/phyxbe/tess/rootfs_overlay/boot/extlinux/extlinux.conf b/board/phyxbe/tess/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..d71da347db
--- /dev/null
+++ b/board/phyxbe/tess/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label TESS
+    kernel /boot/zImage
+    devicetree /boot/sun8i-t113s-tess.dtb
+    append console=ttyS3,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/board/phyxbe/tess/rootfs_overlay/etc/network/interfaces b/board/phyxbe/tess/rootfs_overlay/etc/network/interfaces
new file mode 100644
index 0000000000..89e7d74aff
--- /dev/null
+++ b/board/phyxbe/tess/rootfs_overlay/etc/network/interfaces
@@ -0,0 +1,6 @@
+auto lo
+iface lo inet loopback
+
+auto wlan0
+iface wlan0 inet dhcp
+wpa-conf /etc/wpa_supplicant.conf
diff --git a/board/phyxbe/tess/rootfs_overlay/etc/wpa_supplicant.conf b/board/phyxbe/tess/rootfs_overlay/etc/wpa_supplicant.conf
new file mode 100644
index 0000000000..b43292b0a7
--- /dev/null
+++ b/board/phyxbe/tess/rootfs_overlay/etc/wpa_supplicant.conf
@@ -0,0 +1,8 @@
+ap_scan=1
+
+network={
+        ssid="YOURSSID"
+        scan_ssid=1
+        key_mgmt=WPA-PSK
+        psk="YOURPASSWD"
+}
diff --git a/board/phyxbe/tess/sun8i-t113s-tess.dts b/board/phyxbe/tess/sun8i-t113s-tess.dts
new file mode 100644
index 0000000000..0cf9a46caa
--- /dev/null
+++ b/board/phyxbe/tess/sun8i-t113s-tess.dts
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (C) 2024-2026 Bert Outtier <outtierbert@gmail.com>
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+
+/* <arm/...> resolves in both the Linux and the U-Boot build */
+#include <arm/allwinner/sun8i-t113s.dtsi>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Phyx Tess T113-S3";
+	compatible = "phyx,tess-t113", "allwinner,sun8i-t113s";
+
+	aliases {
+		i2c2 = &i2c2;		/* DSI connector */
+		i2c3 = &i2c3;		/* feather */
+		serial2 = &uart2;	/* ESP32-C3 BLE HCI */
+		serial3 = &uart3;	/* console */
+		serial4 = &uart4;	/* ESP32-C3 programming */
+		serial5 = &uart5;	/* feather */
+		spi0 = &spi0;		/* ESP32-C3 WiFi */
+		spi1 = &spi1;		/* feather */
+	};
+
+	chosen {
+		stdout-path = "serial3:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function-enumerator = <0>;
+			function = LED_FUNCTION_DISK;
+			gpios = <&pio 6 14 GPIO_ACTIVE_LOW>; /* PG14 */
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function-enumerator = <1>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 4 9 GPIO_ACTIVE_LOW>; /* PE9 */
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function-enumerator = <2>;
+			function = LED_FUNCTION_USB;
+			gpios = <&pio 4 8 GPIO_ACTIVE_LOW>; /* PE8 */
+		};
+	};
+
+	/* board wide 5V supply directly from the USB-C socket */
+	reg_vcc5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	/* Li-ion charger: CHG.STAT (PG12) is low while the battery charges */
+	charger {
+		compatible = "gpio-charger";
+		charger-type = "usb-sdp";
+		charge-status-gpios = <&pio 6 12 GPIO_ACTIVE_LOW>;
+	};
+
+	/* SY8008 DC/DC regulator on the board */
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vcc5v>;
+	};
+
+	/* SY8008 DC/DC regulator on the board, also supplying VDD-SYS */
+	reg_vcc_core: regulator-core {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-core";
+		regulator-min-microvolt = <880000>;
+		regulator-max-microvolt = <880000>;
+		vin-supply = <&reg_vcc5v>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_vcc_core>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_vcc_core>;
+};
+
+/* A DSI display can be added with a device tree overlay */
+
+/* A0 on the feather header, 0 - 1.8V */
+&gpadc {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@0 {
+		reg = <0>;
+	};
+};
+
+&dmic {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+/* restart handler for reboot */
+&wdt {
+	status = "okay";
+};
+
+&dcxo {
+	clock-frequency = <24000000>;
+};
+
+/* microSD card connector */
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins>;
+	vmmc-supply = <&reg_3v3>;
+	disable-wp;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&pio {
+	/*
+	 * Sample the GPIO interrupts with HOSC instead of the 32 kHz LOSC
+	 * reset default, which misses the short ESP32-C3 handshake and
+	 * data-ready pulses (one value per IRQ bank, PB-PG, in us).
+	 */
+	input-debounce = <1 1 1 1 1 1>;
+	vcc-pb-supply = <&reg_3v3>;
+	vcc-pd-supply = <&reg_3v3>;
+	vcc-pe-supply = <&reg_3v3>;
+	vcc-pf-supply = <&reg_3v3>;
+	vcc-pg-supply = <&reg_3v3>;
+
+	/omit-if-no-ref/
+	uart2_pe_pins: uart2-pe-pins {
+		pins = "PE0", "PE1", "PE2", "PE3";
+		function = "uart2";
+	};
+
+	/omit-if-no-ref/
+	uart4_pe_pins: uart4-pe-pins {
+		pins = "PE4", "PE5";
+		function = "uart4";
+	};
+
+	/omit-if-no-ref/
+	uart5_pb_pins: uart5-pb-pins {
+		pins = "PB4", "PB5";
+		function = "uart5";
+	};
+
+	/omit-if-no-ref/
+	i2c2_pd_pins: i2c2-pd-pins {
+		pins = "PD20", "PD21";
+		function = "i2c2";
+	};
+
+	/omit-if-no-ref/
+	i2c3_pe_pins: i2c3-pe-pins {
+		pins = "PE6", "PE7";
+		function = "i2c3";
+	};
+
+	/omit-if-no-ref/
+	spi1_pd_pins: spi1-pd-pins {
+		pins = "PD11", "PD12", "PD13";
+		function = "spi1";
+	};
+
+	/omit-if-no-ref/
+	dsi_gpio_pd_pins: dsi-gpio-pd-pins {
+		pins = "PD14", "PD15";
+		function = "gpio_out";
+	};
+};
+
+/* esp32-c3 BLE uart */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pe_pins>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* shell */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pb_pins>;
+	status = "okay";
+};
+
+/* esp32-c3 programming */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pe_pins>;
+	status = "okay";
+};
+
+/* feather uart */
+&uart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart5_pb_pins>;
+	status = "okay";
+};
+
+/* DSI connector i2c */
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pd_pins>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+};
+
+/* feather i2c */
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pe_pins>;
+	status = "okay";
+};
+
+/* esp32-c3 wifi spi */
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+	status = "okay";
+
+	wifi@0 {
+		compatible = "espressif,esp32-spi";
+		reg = <0>;
+		spi-max-frequency = <30000000>;
+		spi-cpol;					/* SPI mode 2 */
+		reset-gpios = <&pio 4 11 GPIO_ACTIVE_LOW>;	/* PE11: WiFi.EN */
+		handshake-gpios = <&pio 2 6 GPIO_ACTIVE_HIGH>;	/* PC6 */
+		data-ready-gpios = <&pio 3 22 GPIO_ACTIVE_HIGH>; /* PD22 */
+	};
+};
+
+/* feather spi */
+&spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pd_pins>;
+	status = "okay";
+};
+
+/*
+ * No ehci0/ohci0: they share PHY 0 with usb_otg and would switch the
+ * USB-C port to host mode. USB1 (extra Feather header pins) is the host
+ * port.
+ */
+&ohci1 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+/* The USB-C socket has its CC pins pulled to GND, so is hardwired as a UFP. */
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	usb1_vbus-supply = <&reg_vcc5v>;
+	status = "okay";
+};
diff --git a/board/phyxbe/tess/uboot.fragment b/board/phyxbe/tess/uboot.fragment
new file mode 100644
index 0000000000..92b143200c
--- /dev/null
+++ b/board/phyxbe/tess/uboot.fragment
@@ -0,0 +1,7 @@
+# Tess on top of the upstream mangopi_mq_r_defconfig (same T113-S3 and
+# DRAM settings, console on UART3)
+
+# Device tree: the Tess DTS, shared with Linux and copied to arch/arm/dts
+# by Buildroot (BR2_TARGET_UBOOT_CUSTOM_DTS_PATH), so not from dts/upstream
+# CONFIG_OF_UPSTREAM is not set
+CONFIG_DEFAULT_DEVICE_TREE="sun8i-t113s-tess"
diff --git a/configs/phyxbe_tess_defconfig b/configs/phyxbe_tess_defconfig
new file mode 100644
index 0000000000..5cd1f323c5
--- /dev/null
+++ b/configs/phyxbe_tess_defconfig
@@ -0,0 +1,45 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/phyxbe/tess/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="tess"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Tess"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS3"
+BR2_ROOTFS_OVERLAY="board/phyxbe/tess/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/phyxbe/tess/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/phyxbe/tess/sun8i-t113s-tess.dts"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_ESP_HOSTED=y
+BR2_PACKAGE_ESP_HOSTED_SPI=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mangopi_mq_r"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/phyxbe/tess/uboot.fragment"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="board/phyxbe/tess/sun8i-t113s-tess.dts"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
