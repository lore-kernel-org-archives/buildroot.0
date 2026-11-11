Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ADA606A321
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 18:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AhhmkV5P;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VqRicb8s
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67A9760E39;
	Wed, 11 Nov 2026 18:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftJcmO7X29m8; Wed, 11 Nov 2026 18:38:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D2CE60E78
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794422291;
	b=JHFZ0J8rSBIkYghwrSOdGWtfTOrAjqDgobpTLBTH/3G+iGugHouUDs1cbIOExlT3ZW5o
	 Sj835eBv+1OK4jjM6LADv8vLjnl3hY+aYoNsqotEqV15cVLVl/9yvM5n1TSMqmTqvg/N/
	 64+DltSIQHlBtpu0l5TbFbs+ZPB2luW9jXR5CRbd09YqLUcod9bwKaxwLvtcjuOirWeRM
	 NYin3r0xCiK520iBAbYxy25zESNST/rLnOunPAW69boGp0HrHLZkjq64ILP1MB61JosEt
	 GMvx1ME5dXb7JJncZw+0roXyBki9CFl0J8h/KR+B0zTYlHXtiNwqd9ZMV7qe5A5dVwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794422291;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=DaaxdXg/KLQoxIJY4/IEuojx9eUBuwyo5wb5Svkjs2I=;
	b=Hu1nvUisvmGAFOAREwN0Mrcvl4TmW5spxeT6V5QjJQpQMgiulUxh+rGTDD8zSTZjiS2n
	 RSQ4EBnUkytBVqcr5lefcS13hc01dAqlKrUm2hPMMJTVAesEtgVeqfTXXs5nQSB9sYGKr
	 fpqz9LGnLdORVR+a2HUYCHboP8MWcw2t04Dww1e8OSVEsoOGnIreDoBc19lgHq98azoxz
	 4le97bybx94REdYhYqkgADrT25eSaTUwwZ3WflbeRDch+fn2WtNlZGYfeAkQ8FMp4dBiI
	 B1C3BqgGEda2f1GEG+jAfOMR4eUgJhzOlmB1M6/SOn7UQMmJtqWm0o2uQZBF36y0Y4w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VqRicb8s;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794422291;
	bh=DaaxdXg/KLQoxIJY4/IEuojx9eUBuwyo5wb5Svkjs2I=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AhhmkV5PagAFfvduc9rw39eMHPUcmA2MM+2FOJHHHk72UatXJWWSKlfMMS4f7ZFKw
	 XFl4Bp2yqWyTFgu5v0ZzNLb10dVXhijfOO2DIec8EY5KTnWYhUN1NbCJ2yiLYs1wtx
	 kTCRhXVcD7pdI9b8LvaVF77dFecsF0yMTtORmwtYtl/6zKPUOUecXqEYBlBxawE0wb
	 LO5JTdMQTkUEh3X/BYPkR3JHbJetl6bjJnL3CqeKtZskRobOkMzu8rUXvPovF+3gh6
	 Rgc4ZT/FiP4xcyqnnfxaL5ORobP73bHiYErdqXs5NKWekrJsGLsoJZOSF6rtUWIyCW
	 ugKsD/g0aC/cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D2CE60E78;
	Wed, 11 Nov 2026 18:38:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B2EFEC3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C8DD60E39
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGvYWO-XhDmo for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 18:38:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 133F760E78
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=VqRicb8s
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 133F760E78
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so2678234f8f.3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794422285; x=1795027085; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m4eKVdU8VmpYH/nAJnJdSh4zYvS9lo2taxEomATTPew=;
 b=VqRicb8sThU2cgd4S2ukTk9pS0uSavUpsC8uEhqFmgPgM9sY6B+F/R5rvtOINJM2i5
 w5EA0uTWnkSeLGXOKi7EF1AxuzUqUnfRTVKQiRiLc6/6MQYdFuVWYycIPIzOiiLMIjaJ
 wH0v1ACk3viXsznpF5QQgY87HkUsM/cPWA3oQn6txD0Axwk6zo1nt+ChJ49gkostQaQI
 +oP3eFla/nL7/MSFhEICStzVdnww8WhnB0q45PDEV0BXngOxPBsRLK3Qhp7g5M6rvUQt
 A/oCDwo1ecVXwIVlTh/o0kFtd18Lfce/5Mg7baj7LQjoHp6i16MTXdjO7tcM8XiO7vhn
 T1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794422285; x=1795027085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=m4eKVdU8VmpYH/nAJnJdSh4zYvS9lo2taxEomATTPew=;
 b=0svCtufqQZB+2QoZ86hSla8/HQbNkkBTgtr8vYsdNrcsJL3sTWnHyQdCesNoQS9M9u
 0OglSwvvC7SNTvAFZvSjEnLLYYUtjUEvczOfLLYXqq1S+irk562VgIEHYKSMFUUwAyZy
 mpRQ6oFozULQsMGYetKbRy9+lDf3IaoMgE/FfU1rOBXwZaxw5QT6NJuduJHUwylIDARN
 9Uj2Un4/Y5MZ1zxYsb9nX2ItfyQZxLw3sBOydUIk7ZdCoNLJ17WQdOzVzcWlgtHAlgWp
 A8Bxrh73GA/ACn0IiC8wlsCW9GD8nLD+OamSCOMsNGahHmEmKfdvQ7yuKe1w4hOfaUPg
 DSDg==
X-Gm-Message-State: APuU4Z8OOMmqQ9ZrbFZwxAZxHgUy24RGrD2odCBTch1PYBL8OIf+aAAF
 IP8RrTxqOnfz9aspdhW2r1bGTCaBLedm4lnAGhDeobffTNCdYKeU3wY5h5bjHRxg
X-Gm-Gg: AYBFou2n0YKiEHCOnP8Sgf3F1EMgnhujixbNdP2JTNBtZIwN8o2KVBHmXA74axL8v/O
 XLz4FbS13D1x3COt0I7uPB2SRSgJaH57XE3jTaoSAHoju/l9rUeFUaXoq03hG+Ie1zUpwGatkAk
 Xre4GAueRrOrST8EkyrKSigYTaw7uk9bwPt1e47DB84/zSXz2D5utOX7Bw9x+Nh5CHw281ZkoPs
 WjPIS4hlx/r3RjiPzJ4Y9hw08Vdk6MGCqeO9MafAq7vIvPlRQewPtGSDjV8qluy34f6UHUyTYZA
 SjYulzlrORfsG+Gk++fVLU7hKejUztTi+NSnEjHu47PJ+MRqfWsW019oQXiAwfrBSRwuFwI4QSp
 XYWdfJFwo1z5OBZBs/GRDCH/Tirs+6s5DmiykCMpNaZwwf1s6k83iAEb5gRQcjvHRPKQbHFdDZG
 KvGkK8wBYNQ8wyga8B/VYR34Igvmif2B5qq7aJv0GmHOYMvUxh92gxmbJcage3dxttybIx/7mw5
 502G0nNwHGUYjGkSaVx2QMji6DFe224kFuC5herUFM/PGSGiGimgSOvCxaWw1vXYmkPL7UU7NZH
 JWTq7OezIwFuuf/Xz4wiAuC1H7Qg34z06uUQBU3Nml7WGMe2mF1zwA==
X-Received: by 2002:a5d:6f07:0:b0:490:9af:d49b with SMTP id
 ffacd0b85a97d-499ca849bbbmr5311582f8f.53.1794422285363; 
 Wed, 11 Nov 2026 10:38:05 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4988bdef64dsm11007672f8f.20.2026.11.11.10.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 10:38:04 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 19:37:55 +0100
Message-ID: <20261111183756.2235235-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
References: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
 <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 6/7] configs/acmesystems_arietta_g25_{128mb,
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
Changes v2 -> v3:
  - none

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
