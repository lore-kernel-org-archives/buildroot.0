Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C786606A324
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rz8aEjN/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ShBAilB2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D12D8118F;
	Wed, 11 Nov 2026 15:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHvzOFKppY8n; Wed, 11 Nov 2026 15:46:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C9BAE81366
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794411972;
	b=ocll9j65Ybc+mOUndvgDGpbQY2LCCpYx1sCQewgnBh/SdN7hwo8n/+vfscTIVjDeYOVE
	 ABWUpJi+nR7N+7zlJ8pOtNNlNIEkeRFaBgGwJ6OpHkrhhwZdRbe9qe/IPY2wNlK+OSJaE
	 XZ91uevhJ617W4ue4eLMf8Aswg0Z3Az/jY94Rc89DXVuecAFGA7lg0K3MqrSM71J/QRCs
	 OtH3tRlmyET4d5R3OiYRkCGb4MGJOTD9sLX8YLBxtwcZ6urxYIHm9odDNBjcDCb0ujtw8
	 NpDRl2RuELWkzuJU3lkxC4CXS2Lgv94ZIi1eGEdEMHyYTbEE7o1pz70uZjaahUtxc5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794411972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=vG4n7ke52aX//fTOGjyrBnff/gEowsqDc3b7oW0yFpI=;
	b=GNHhda9gA7hz4IW5gYEP8UY/11SBrJY+R+Q4fotM1tK4vZxVq62PRH16H7KPY0AchK+N
	 PgUpw9hShFVUVFTg6lGXa4xPkM2+bR2QdTLv+amj4EylmySvDUOYrJ6wwxUXN51HhWuVJ
	 NopeQeXgxehOQi4xBspKgPcpn7R2KSrrd4bpWxaM/qVTZSZ/5sbXkXAv6jx2uZ/Gvlggu
	 ypgXHCaRC+hBVR5Bep+bokSl1V6YXPg3ZQRGQhe4DKg0lhxULBq8/GpdmpwhKnP2cbNEI
	 fQC9ImiE//dSHLHeIgjbh+F0h4OAnnbqQL7x3cCleYPcSFbgLSoCCOAQ1I1ByCvq5vw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794411972;
	bh=vG4n7ke52aX//fTOGjyrBnff/gEowsqDc3b7oW0yFpI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rz8aEjN/gxkidG3uVU8FCSXvVRSN9LjmiLymSXbpgp5OIZi6pvcIygqr5RRCzqYil
	 bmazXBeF1wkaEr77X8ccrwnLcqbiv8Tcv3F3WFVz1+n5jSFoi814WEbIHK8gLazrFm
	 vmB6rERZCmTN/+5kcfcmsKzpHZA/Bp+/GAbAlRmfKpQ5KVgCUrhoHbjN9NCuZezQ2y
	 S8hfs9H0COCTNxKEtQ9jJZ9S8S5bWp1gi5fmYeokUGryO+brf/CyXDthcJ0djj9zNo
	 VJhRsG5rDDrN8TI2gyEEzThJdsFibM3Z+iTm4sZmiOMzpt1xtHoDX+RvsPvMt+FxOr
	 k04HchUr4ne8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9BAE81366;
	Wed, 11 Nov 2026 15:46:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D515E2FE
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C63BC4006F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jWifkz4Y2bd for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 15:46:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5E00B403A8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ShBAilB2
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E00B403A8
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so37179375e9.1
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 07:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794411962; x=1795016762; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LsBacCvJz88TC4g8GiBKba7+Gy3Z2+UiHMTCsdJKfXY=;
 b=ShBAilB244flmTpdS1BC11Ld3y7eKl1Qs4Q2xsgLXL7PLd6ymRWSb+S6WfDk7N5ZbO
 CfNjSvmezZ4yq2/8YTnub7A4YvO29NbyJqSSart/JEV/nbBBfhdlDPvbBHNBUQ89Z8My
 rbSgHXzhwxihnPHwVV60M4l0bNeWPp1TqCOh+65akZS7qfYCFTjuK4jRFK1WZIKxv0HE
 qLkgmWy5J340+J1NcW51syBSQfxCcxzr1VEtfBCIUJovi32k4NJmrOyyFoU2psUwvGlB
 uP7cas9L+LXjfNNI35tjFn7sfGs+XJz3pxz1EWYbS46Stn4SUdfmIqlQKeDp7sSnCcVQ
 ZBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794411962; x=1795016762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LsBacCvJz88TC4g8GiBKba7+Gy3Z2+UiHMTCsdJKfXY=;
 b=ECiZUoqdDlaudr01VgSyl1sA/xDcm9vlPWWq49WxnFfriEK69Yb0Pn2i3qfTWbbYkc
 Jp/nmpQZjvZFuNRIeYRNp+olru4cKhpFftpD/+fucInpYoe3uOK8VL0+eLqw8k5E12Hs
 tUDOvljbK5WgAS2DzvHQmRweG0B+9ZHaTN1IzUYLZtrzQkxLmwzdG4MUHQfE1Pohb0rp
 Xcbhui8CMUO9MEErf+YcCLtPtim2H3CNQmw+JuEa5vhXLLt1bxFy6aRQTKjjnnjbrYjm
 ChOjrxbIewJpY5s7HcZGf9lqdEAb/8CaIdP7Phve+I4X24Rbb7Q9nnkfImozHzqgBVDp
 Ltgg==
X-Gm-Message-State: APuU4Z/TVKZrFeF6x+CBGrUwXDohAXwb/9gkNJnLzBRuralqHgBvyVy8
 dfV/QQWcglUp4HWB6JzmiWznXV+LnxNhmDZdOK9Rg/YzwergbZRbt8wFB6IEmJl9
X-Gm-Gg: AYBFou30xRk6O8NApQ2f3EU4EjyhlvZRd3j+TJ0fvEO5coum1m6axei0KLs259Bv8Ld
 N/MwWXXnpdljKpj3L1bfGiA+wsBHiSwvFZo+A+/iId/YtO2ckln9peeJcYJHIjTGG/kAFnWdZz5
 T0RNOyhPbwWF/jf8RMB8p+cAhyangCj96N1mij/ycNBOBwEpbNrd3LKEeuAzYJ/04gZPh1ThnHK
 4BPs27yXxe5C6tXgOaQUZVZJZcAZF3Ph0vRPjGSe60g0jSGkfjElDHfT4cWwsjqKb/wxX+J+8vO
 6jo9TEm/njToabodPL6CeM64FJ/Pf+Jr05E4Ome95CRrany6+GH7MNdBOHl2kQY6aRDkvSurCny
 oYjWsI9pWk+CaBJF5RiOdA8B00EYipCZnfrNLizasNNsSSm7NVqme4YMDG1ovDhJnDblvokeJwG
 CAGYZzX7m/rzMjosQvQUxh0m4anGBYJdaytbgYSU5/KEu76t7t0dRvyKVHZWYKC5I46Uf4lD82P
 Dpx9HAi6syf4uoXiuPNz4zYOZETKFmRUWjUBlS2EAa6/Uae3NfZCGOmUsE/h++Z/wnBwYJMpiG9
 cvHu4SlQLBzQH+7vQ5Q0D1x6wCcRsgyUwMAUMQMRFbdbMLBs/zk/GyOhJjOSlVie5W+lwD9Czw=
 =
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7ced with SMTP id
 5b1f17b1804b1-4ba0937a886mr51007725e9.17.1794411961492; 
 Wed, 11 Nov 2026 07:46:01 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c53bb94sm4574095e9.8.2026.11.11.07.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 07:46:00 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 16:45:52 +0100
Message-ID: <20261111154553.673632-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
 <20261111154553.673632-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 6/6] configs/acmesystems_arietta_g25_{128mb,
 256mb}_defconfig: re-add defconfigs
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Arietta G25 defconfigs were removed by commit c8bf258e5b
("configs/acmesystems_arietta_g25_{128mb, 256mb}_defconfig: remove
defconfig") because they still used the unmaintained Linux 4.19.

Re-add them with current components and the same boot flow as before:
AT91Bootstrap loads the kernel (zImage) and its device tree from the
FAT partition of the microSD card and starts Linux with the root
filesystem on the second partition, without U-Boot:
- Linux 6.18.63 (LTS), at91_dt defconfig and the in-tree
  microchip/at91-ariettag25 device tree;
- AT91Bootstrap 3.10.4, the latest 3.x release: AT91Bootstrap 4 no
  longer supports the SAM9X5 devices;
- the Bootlin armv5-eabi glibc stable toolchain;
- hashes for Linux and its license files (BR2_DOWNLOAD_FORCE_CHECK_HASHES).

Also add myself to DEVELOPERS for the Acme Systems boards.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - none
---
 DEVELOPERS                                    |  2 +
 board/acmesystems/arietta-g25/genimage.cfg    | 36 +++++++++++++
 .../arietta-g25/patches/linux/linux.hash      |  7 +++
 board/acmesystems/arietta-g25/readme.txt      | 54 +++++++++++++++++++
 .../acmesystems_arietta_g25_128mb_defconfig   | 26 +++++++++
 .../acmesystems_arietta_g25_256mb_defconfig   | 26 +++++++++
 6 files changed, 151 insertions(+)
 create mode 100644 board/acmesystems/arietta-g25/genimage.cfg
 create mode 100644 board/acmesystems/arietta-g25/patches/linux/linux.hash
 create mode 100644 board/acmesystems/arietta-g25/readme.txt
 create mode 100644 configs/acmesystems_arietta_g25_128mb_defconfig
 create mode 100644 configs/acmesystems_arietta_g25_256mb_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 08fa49faf4..e540154254 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -222,8 +222,10 @@ N:	Andrey Yurovsky <yurovsky@gmail.com>
 F:	package/rauc/
 
 N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
+F:	board/acmesystems/
 F:	board/sipeed/lichee_rv/
 F:	board/sipeed/lichee_rv_dock/
+F:	configs/acmesystems_*
 F:	configs/sipeed_lichee_rv*
 F:	docs/website/
 F:	package/apparmor/
diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
new file mode 100644
index 0000000000..e49e35dec5
--- /dev/null
+++ b/board/acmesystems/arietta-g25/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the Acmesystems Arietta G25
+
+image boot.vfat {
+	vfat {
+		file zImage {
+			image = "zImage"
+		}
+
+		file acme-arietta.dtb {
+			image = "at91-ariettag25.dtb"
+		}
+
+		file boot.bin {
+			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.10.4.bin"
+		}
+	}
+
+	size = 16M
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
+		size = 512M
+	}
+}
diff --git a/board/acmesystems/arietta-g25/patches/linux/linux.hash b/board/acmesystems/arietta-g25/patches/linux/linux.hash
new file mode 100644
index 0000000000..6acf301c54
--- /dev/null
+++ b/board/acmesystems/arietta-g25/patches/linux/linux.hash
@@ -0,0 +1,7 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  81764a545072d160748beff4d9de2e7d95aa9f16e8261110288f067a2cc61d71  linux-6.18.63.tar.xz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/board/acmesystems/arietta-g25/readme.txt b/board/acmesystems/arietta-g25/readme.txt
new file mode 100644
index 0000000000..e3a0f7cf56
--- /dev/null
+++ b/board/acmesystems/arietta-g25/readme.txt
@@ -0,0 +1,54 @@
+Acme Systems Arietta G25
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Arietta G25. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+AT91Bootstrap loads the kernel (zImage) and its device tree
+(acme-arietta.dtb) from the first partition of the microSD card and starts
+Linux with the root filesystem on the second partition; there is no
+U-Boot.
+
+You can find additional information, tutorials and a very comprehensive
+documentation on https://www.acmesystems.it/arietta.
+
+Build instructions
+==================
+
+To build an image for the Arietta G25 choose the configuration
+corresponding to the Arietta variant.
+
+For 128MB RAM variant type:
+
+$ make acmesystems_arietta_g25_128mb_defconfig
+
+else for 256MB RAM variant type:
+
+$ make acmesystems_arietta_g25_256mb_defconfig
+
+To customize the configuration chosen type:
+
+$ make menuconfig
+
+When you are ready to start building Buildroot type:
+
+$ make
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Insert the microSD card into the Arietta slot and power it.
+
+The image just built is fairly basic and the only output you will get is
+on the serial console (115200 8N1, on the debug UART pins), please consider
+using a DPI cable (https://www.acmesystems.it/DPI).
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
new file mode 100644
index 0000000000..14e2cec73b
--- /dev/null
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/acmesystems/arietta-g25/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="arietta"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Arietta G25"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.63"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/at91-ariettag25"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
new file mode 100644
index 0000000000..4a504463b1
--- /dev/null
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/acmesystems/arietta-g25/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="arietta"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Arietta G25"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.63"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/at91-ariettag25"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
