Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5055C60A3829
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SaIi7BeB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yplFqaCb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AFA981291;
	Tue, 10 Nov 2026 21:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpvfpC3tF91C; Tue, 10 Nov 2026 21:56:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D13C81317
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794347773;
	b=C1I/brv443kBJWCiz13oz23gSoVMXM3QzPq49XkMrbAQYtc0Mo9lECK2A3iJxzCApmV1
	 Op1NyxmWkLkg9595ktWan00ZulXYq9j+Oq2pj7EmvhBa4/8/0ihq15QkyjVO77y7wfdyO
	 f5PnnA8205G5s5MNPZP/ojNvl7/7j6GSX2uPy4QnFJqGfjqUNUSWVzRpTRaG+cJRWTvS9
	 zNmG1J1we+K+XeTYwVEo+qulRqT3wUozIzw+/Ad8MLc/THWJs4IoWUctFoYSCKf9r06At
	 3GezrnMIuVnPT4iBgU6UHzH5MlB9fxqSaEwiMeBT+4+ZGx9LUb8+5rF06SbfKNeLphg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794347773;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9ew6xKrzN3fjW+FJM0Pi9jcvnD0EW2M2sUd/Kj8kaUI=;
	b=o1RKdf3TpNwIvoHhgOxHyqrzlSN3Q/c9wsdO/If+lRyvFG1ny/DWj8+tcjqedyemuLXx
	 hPsNWaHGAQykTSpm5n5sE9L2gGSJsrfvOzFbOwVDznpQ0DH2QoS+oMLSBrezyRYZSf7Gn
	 NMlFa2WkLR1NdwYwuigYzNlpp2zN7p7ADVv/U20iKbJjQHNknQ1FoWpsEKT1olCNn2gty
	 nOQV2pWK9Px6qUqcphxk1YOkw3VhT9Y7pZ0uLOXHe8NJLkjozjMhvR4fuX7iTpsZypjKM
	 n7xbrPAuZQw9twJVgj7J1OuiTyasHhADnLoxrYH4WYYnQaY0x22TsP2wiPfIPloVCIQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794347773;
	bh=9ew6xKrzN3fjW+FJM0Pi9jcvnD0EW2M2sUd/Kj8kaUI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SaIi7BeBEQWG60O9a2M/enssKd4A4YH+zU2A3xmHUTbvqPPNaXkzXEXoCyFuWohDt
	 lIGTCwC9dJweOUcXYWnPsnHeUe344nZsKnoP8Fn7aWWI0en2ZJs8wWlgWG8rCkNzy/
	 AOfNf0ljZ6UZAQbKwDX8ldRlC2X5rbXualV3kvy8srJgppII33MIj2Go3uwrh/xC9E
	 /zMMB316OWYdLxvcH9Iy4NdfKsNnYZhK2FsaJKRpJNDVmYueNO2f+YGelY4XljxyX8
	 qmIuJSiE4fGiqlkGoEfL/GK/q/MsAn4mf9EjyaVdClh3ChZ1WctM5Q82J9p5omoyJ9
	 Cd8yBd1kDyCFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D13C81317;
	Tue, 10 Nov 2026 21:56:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FE4C731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 316E060AAC
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skkj01z0kDfy for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 21:56:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA881605E3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=yplFqaCb
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA881605E3
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-490585eddfcso2013723f8f.0
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794347765; x=1794952565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kauEONaGciMQL+EJ3pCXOn/7RO3gaLX7DGm79cFw/XA=;
 b=yplFqaCbUgbM/7G33SzKpmdhT3VAuSxiOhfsSt0GShH4h+rk3I8eBqJOBZKETeGCOM
 YFYpEejKjC0iC3ckZPLTwuGtH9kxw3QFHKtVjyzR7M6rsO3Pcs+LnX5vS/OWXIC03YCz
 NdYmdfvMuBvt8h2Xs0CqyE3VsWus/NELOtmn0DX6muwG0Ofi2PM7+UbeipUmmH/hJ8Ng
 k16nooSBzo8qqSzz/V1yPoAHlRZKhl7Q/4Ao0GEBGuAXAOQ5nRxWgkQXctf4kxgJeCnS
 n9hvw7N39iB7/kRmCDPZNLDygX7S8yGMznqDSeNUh/wQj/C5eUIE2zwIsDmxTEk1+WVt
 iMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794347765; x=1794952565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kauEONaGciMQL+EJ3pCXOn/7RO3gaLX7DGm79cFw/XA=;
 b=x2d/EZ80HCln9xbWaO7sEmaR7YgvDupdm9RTwNp6ae7WM3z+ZiwGelEogeTJOsymaB
 aoJ9tqrHahcjkYxxdFk8LS5RPRbvWdW2U0e2qIliKyZGF8T3NVEvYnFNON96Fy9aZSn+
 vqJUOylu2xvHN9ij6N+j/1rAtY4q0k14RvJJ08xBDVwBbPpFYHNRmAvY6vhD3nAUFB7h
 Zpo1gJsFxuIll/aT7bMJzrJtP8D9Fqipaves5F0TOw/+2wrrAjGDk5J9U3TtD6aRebNY
 Heitd7g5bl5l5fa+ztOErAlr0eYXRPRwDtnJ59vK8Jr8HWd1WzDGvQRi4nmuELg78eWU
 cBLw==
X-Gm-Message-State: APuU4Z9yP35gQFCqlMceSgKQcKwF+ByUsdrtoEvjQ2IN55TssQOcq03z
 WejkZNtXoyCg++ep+9YUyPRq3A/dqxzFYMdX8khhD8KOfAg8EQBLwpun/PQ/uw==
X-Gm-Gg: AYBFou1hziCuwUPqldEwsGQMZ9spqRpuZ3kTh753FfbJNpPSncr0gcBUj36ZhiYtPgf
 FiTKl9Ha6tRt6mGnOgQg0gnYlcxFe+CBRy+BeuUVRvE1vzaEDziSxPxhj/PoMYSasjJWwIsdmTU
 b54V6og9stu5Vq3qQ0k3qfYCqdPypgE5cIhJsiX0u2cizLBV0Ios5ffnCjuBMvRrW4ajQUwo7Qp
 nC5kFXgzZ3gT0//cEuGq45eB6/45GLEyZXp9V6Xq0By8JHvvS1wG/J7XfvdPztOLpmxcU/0XoaO
 18vwKXUQ+iGnYFzsXzKkCnHc97Gohf+iiFUh1CbN303FaYrN/u8mKqvDZMQNFT1byVRJZoZuvN7
 KwJoeyo+3O7lYYRRYOK9NVToHVDCWKjxAOU5HwgT7T3XauUgbj38+Wqapaq8IXk7oJWL11e/o7p
 9v6Ls0B7Y3E7x3eIr4YqyXaqKodBqdlus006J3S10Klm1+LB79/D+3ROc9wgnlZgQsrFPxJhkia
 6uQ04lflHj3uCmTADMoi1lxO/9fLY1CGoZ94RM3i+WyBwiFL3VOwymXiGKk5qNzOUfItuwt3vyz
 DuxNbbdarIUNValwekhkhX0SVHe6lb+8hjoTmj7xDmd3q5FlUO+E
X-Received: by 2002:a5d:5e83:0:b0:493:2eb8:e7d2 with SMTP id
 ffacd0b85a97d-499c7a2375bmr349761f8f.41.1794347764973; 
 Tue, 10 Nov 2026 13:56:04 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836b8eb11sm7767889f8f.57.2026.11.10.13.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 13:56:04 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 22:55:57 +0100
Message-ID: <20261110215557.2248804-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] configs/acmesystems_arietta_g25_{128mb,
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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
