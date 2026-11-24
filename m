Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4A9606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 11:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qh5YRCjI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYPhtb9f
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9712E605E8;
	Tue, 24 Nov 2026 11:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDlgEEBs7_JF; Tue, 24 Nov 2026 11:31:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DBFD5607E0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795519872;
	b=CnM3oh8TptD0B9wkLxQYNlY6eaa07O9aj6FnN9u6wWDBVk9uvObD0oVTR+2Lv0FnU9cu
	 9rIvxv023buPUyTMcZgPm9fAh/hqFoEcJp2ayccGblTaj07+S6WgdLzM2c1m4ELY0Sg6+
	 fuRN4dv7plWxKjrAOel3Rub4brJOqx2nckz4+TR6nOA5VYDl5efmIzx7xCdw5oKQ4H7Ny
	 ft6jSEVkEkpsU2YDyWPAMjX3/Jm1+BGquHy/lnfF4gRR3enzf/X1R4NaTlzYVdA7Kbg+V
	 XXjp7xsUDwFLUMdoo/VGyaLHWCUd8Ufub7dwy3cgvNtThNKZQs1xV4Aist7CRHmIi/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795519872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=JTWTprPYcQkft5eR/0ZL4ciJnUgnjmVrls8gZ7YvVa0=;
	b=UB91tUQkCVOnVsErsywibwLqYH/SSYc72n3HJX9+u/Ps0vJwvJUD/YivIZI1V+PIkIWc
	 K+6WHCJpdelmBPo21KoNMwLxn/oWFbo/a2F/srZFNxA5MUQ3VTj2PHRza42pJWEgfNb1d
	 HExxvbYTWq9Sk04ezKtBEHUaHTrY0Dm1VoSZtlXv8MmsnPaFJRhlznbCjbeTavH0u1w0J
	 B1OHDiU2Nti84esCrMdah6nNUywCu6P9E2uunJyXPGFIrz99fVvPOuXU2TU/7YGSJG8Nz
	 OVC1huMiVAVdO7OjdGNGIf8vrV55VFvln/+7oJ75dPbGcxpFe+vDC7heyglMTa2dRWg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYPhtb9f;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795519871;
	bh=JTWTprPYcQkft5eR/0ZL4ciJnUgnjmVrls8gZ7YvVa0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qh5YRCjI5O0FSWvUHfXxhHflgmgfQ673cvjv0Ewe6c0RszrmiaDSmUC/IAq47k6PF
	 cGphNariOuRNqerTqbxp0c4fMD8wx3TaNJ3enEJo2rnfFoKUi9900yt2zfwBmENDQR
	 rfWsSpTgPNXm/Ftst7puLbEHyg2nh5mgNxEGe19hT8I+mbagb1nGBgtGu8oz8grSvA
	 6RPzRvSHW3VBth1Ma7CslcNcxB7JntuUcA93EmwVa/QP1VjfqUiqflf9L5lkQAx987
	 coy69UaS2FTdsIcm2e/sqQf54jzqLxoeaieNZd6q9M5ebNe+0AUD9nkyJxyNSE8OQe
	 LInQ20lTEXQ2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBFD5607E0;
	Tue, 24 Nov 2026 11:31:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A36F8D43
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 953CD607E0
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ouSZDRutiom for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 11:31:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A3977605E8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=outtierbert@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=FYPhtb9f
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3977605E8
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:31:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so56562085e9.1
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 03:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795519865; x=1796124665; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5DyFYijWpAkuCz8E9pio9kbm4h0/nvi5lOWPApEh3L8=;
 b=FYPhtb9fEqVjk+QLrIg15PBCqcqM3dFMxPQPUfnQ8X9PIp7AG7WsSgoczLPd/22OZp
 H8SCnR516Xh6ShaZfpUxow72vpBqxYgb0XGajKNUS92N5yHB80HJltwogbS3MVRtL05K
 rYFNHhVxxHdYFoaz/lwBRfcfKFYNmBGCahLkGniXuk1GapFkbsf6cU4LeYbZBTxP81hz
 zUZyMa5Vx9bZEpPzIO08z/BzbRLQSPRg/9nPR5N4fY8+UEWvMCMwsQbQQzXHlUIgUl2l
 +UBnvlU5M6VyVQ0nOczQVsON9N1MIA/wlD8lQDHf22a6zSqmdcANC5B3bD2iu2eViGJr
 CT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795519865; x=1796124665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5DyFYijWpAkuCz8E9pio9kbm4h0/nvi5lOWPApEh3L8=;
 b=2JBMA4/q5S2emYoeyalb54YG3bpryzFechGSNfBG4dvX7oY1TcbMZmkQW2apXrOEAW
 CphEofgOUo5hx1zCQry7Pci341AydIN6eEKm5d0BBAS43/GvfkD0dpB7bKbRYLCPNHUm
 aiNwrMX1FXJAW6DUrht3dv5pT5uaPUG3bIfo/TrIzCM8/zTrsoY+OPSW4hP76lRMf1V1
 PSqBQwIpJHuw/QuODKpxrTmpj+NIJBLKf0dKF2/ilVwRNW7UKo6LZxw6hgy66En4Dupa
 E25jlsl8wcrnKrZyVHRP9TnkJUTDReqq7VccIwtAVjFE/0C9hYYsDGDZyKamCifvcHuV
 sLeA==
X-Gm-Message-State: APuU4Z9/3lX+rjJn8FbTLraVdjmkihByyHIoyhMSarEObawkSFTkGL6U
 gjnrfB2u1k+42Nfq4VbnnAxALHKXEACDw06ChZ8KM7U4m87wusaXmFaqy3otJQ==
X-Gm-Gg: AZFdTZeQahRNQrEUfQLWhgHiUx4wnVps7wDQ4emSvZU3yWdy3KvVrJCAdjwB+yePeUz
 HzzRAGe8gqCY1c5scWR6EtX2hrwEsyGx9W9SB/7fIaMMhJD98YAdgCTuZilhVwE77BSOQMiAFYR
 GuHth6SpFvq+CvnmHyRuielEvZD2SSTx8adAUvKVMdRFICF9pa3JZUnHWqh9/QrC5QMZWsHoMGw
 ZUNKxABpb2FZRY3XorvimLAsYXKJq2jsMZrhaOg6yvFQsmmPwxo2XCzm3UmQrF7Q/OTbxkNYFt5
 coSp1Enig20LNLGlUTsjf4T0B3PO0ybJkWOgJOEPZeEdh9VjyD8qeGY8AqVFOjVgEBEZyvmTOQc
 n6ImceXgKLY22MamHpjaADejSPzWZHLxdyBPZDppE2qpXAagzAnARHjeyM7uBByvHflwTKrrSlj
 A/b0bMlA/YSiOw/Zof0uFkD4VzGAFUNFE5TJJ5SKC78P8JMLoINSIYxeQDiDAjpPrr4fleHHq5g
 FwKq4YO4eHcOzp3Mwybg0FQQk7E7x0N4pYQchAxkquU8jeuEhpbv9GvWhY1g7xTverCbesYTNeR
 Rvvnndx1TIF0ZmJXmJFoEfP/obqe+gpcMaXS3y41EfJ7UgqAH88zuN51fKEt28A5dpY4GSylFZM
 CaHhf794uiJYZpld6IpyXSbQFQx4uPKXx5+mXEA==
X-Received: by 2002:a05:600d:600b:b0:4a2:18c4:61a5 with SMTP id
 5b1f17b1804b1-4bb887fb6e7mr300384075e9.6.1795519865139; 
 Tue, 24 Nov 2026 03:31:05 -0800 (PST)
Received: from bert-Precision-5530.local
 (195.6-132-109.adsl-dyn.isp.belgacom.be. [109.132.6.195])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm264402265e9.4.2026.11.24.03.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 03:31:04 -0800 (PST)
From: Bert Outtier <outtierbert@gmail.com>
To: buildroot@buildroot.org
Cc: Bert Outtier <outtierbert@gmail.com>
Date: Tue, 24 Nov 2026 12:31:01 +0100
Message-ID: <20261124113103.2422768-1-outtierbert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123211046.1694048-1-outtierbert@gmail.com>
References: <20261123211046.1694048-1-outtierbert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] configs/phyxbe_tess: new defconfig
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
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
- Li-ion charger as a gpio-charger power supply: its status, and its
  charge current, about 450 mA or about 1.2 A (PG13)

The board has no upstream device tree yet: it is shared between Linux
and U-Boot (BR2_TARGET_UBOOT_CUSTOM_DTS_PATH). U-Boot uses the
mangopi_mq_r defconfig (same SoC and DRAM) with a fragment for the
device tree.

Signed-off-by: Bert Outtier <outtierbert@gmail.com>
---
Changes v1 -> v2:
- describe the charge current selection of the charger (PG13, about
  450 mA by default or about 1.2 A) with charge-current-limit-gpios of
  the gpio-charger node
- rebase on master

 DEVELOPERS                                    |   4 +
 board/phyxbe/tess/genimage.cfg                |  23 ++
 .../patches/linux-headers/linux-headers.hash  |   1 +
 board/phyxbe/tess/patches/linux/linux.hash    |   2 +
 board/phyxbe/tess/patches/uboot/uboot.hash    |   2 +
 board/phyxbe/tess/readme.txt                  |  76 +++++
 .../boot/extlinux/extlinux.conf               |   4 +
 .../rootfs_overlay/etc/network/interfaces     |   6 +
 .../rootfs_overlay/etc/wpa_supplicant.conf    |   8 +
 board/phyxbe/tess/sun8i-t113s-tess.dts        | 294 ++++++++++++++++++
 board/phyxbe/tess/uboot.fragment              |   7 +
 configs/phyxbe_tess_defconfig                 |  45 +++
 12 files changed, 472 insertions(+)
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
index 1cfa212f15..cedd6589b8 100644
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
index 0000000000..41f22f3dd2
--- /dev/null
+++ b/board/phyxbe/tess/sun8i-t113s-tess.dts
@@ -0,0 +1,294 @@
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
+	/*
+	 * Li-ion charger: CHG.STAT (PG12) is low while the battery charges.
+	 * PG13 high selects the fast charge current, about 1.2 A, for batteries
+	 * of about 1200 mAh and up; low (and at reset) about 450 mA.
+	 */
+	charger {
+		compatible = "gpio-charger";
+		charger-type = "usb-sdp";
+		charge-status-gpios = <&pio 6 12 GPIO_ACTIVE_LOW>;
+		charge-current-limit-gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>;
+		charge-current-limit-mapping = <1200000 0x1>, <450000 0x0>;
+		charge-current-limit-default-microamp = <450000>;
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
