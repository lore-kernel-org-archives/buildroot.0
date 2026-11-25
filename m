Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADED606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HKvwPiCH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjEvBL1l
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21EBD80CB8;
	Wed, 25 Nov 2026 22:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWmIGKSGQZel; Wed, 25 Nov 2026 22:36:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A756D80CBD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795646162;
	b=O4R9pDwweCFZJeByGnVjcVZPKcH1nT/y+xC0tVZz3hAumOlsBecmtKYoLs3GNq72LUdg
	 qFcRkOras/TpPEKk3mOecMyednl9Xy3DGQcH0MosJXkC9awFFlaq7IXKC1UZBiOKeAuzi
	 wiU1IoulBgz07dMPWCwSl/0jyIzrg0VXoBRqvdFM0wEXS06b+GyvOfwinZT8Z3goLntSt
	 F9qXtd41OqQmYKqcGBXcXzX5lN+ynb6fBnPrIBH7HUqngUcwdpMFLtP+86TYeV/0TcInI
	 uKP+dIFsG7aMFOY2C8gtr9uSRXo3Z3zqoKFU2nI1oznKcL4Pd6s0RuZ54QpZV3dmDmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795646162;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=UAl7FrlgVQ79ET5iiveG7A1tye0591cgchNHWP/3/Pg=;
	b=k60l4DGXUzGswIVvf1e3GqpuJ04+IhDpzJKAfGlLGgtzvBswewk7ymfrsJVtsNnFYfBZ
	 tIQcERadD+6JHuh4jVbCF8xE/SlzsdxDxGsHh1l35f6nmot/f6GjLOi9/WdjV7GTknb4o
	 FoD9o2ny8BpPA8oNQ4Uuu+RCblgeAZitLEbHGnPKL2bl21svcW46fQXyZQ7sOOae7zbGV
	 6HBNtKMKAjVBtNpNB24CxOPgX3l45lvX6atI6HFCr5wPI1dqdrGTozaDecEY8uD7NdNNl
	 mAmz8g6+XWS+9ENTTrFOz0wE5PniU0TKW6ogWrx3Xzw4kNl8amR2ywEmCBm4ZwbCstw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795646162;
	bh=UAl7FrlgVQ79ET5iiveG7A1tye0591cgchNHWP/3/Pg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HKvwPiCHtvWEMvpr81oRG56vX+ehrU26XkFt5PgwvtkSDiwOXSyKW2FWKQv7eQTZO
	 GiO02ZScZK8r+vVx4x9Szak8c4FrvP3aUxIrkItv7DBdjbLQxaGAF5U8PjzylTsbvH
	 HZw4vE93rtF9MzvKbm1xXuwHrTLLAhq5C4wYGM1h4gOkZNcXs4f5ULnNiUwzwJm4KO
	 MudhLSTdvZRH1sh2BcHD1Cn0FkBoWzOvJ9k4WtOjYMhM9hSWxeOGj8nmlAn2GIoFi3
	 fFfQNsnwN5JoPeOAMWyYo01Nwh9h51gYWFUhVKxavn6cjRnze6T8lcYYC2C/p/dHIo
	 byZbBE2JvfgSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A756D80CBD;
	Wed, 25 Nov 2026 22:36:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBFE8325
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 22:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D02E24057C
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 22:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbRn-YC-Imk6 for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 22:35:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 30C4F40525
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=BjEvBL1l
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30C4F40525
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 22:35:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-491846221ffso5459782f8f.3
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795646157; x=1796250957; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aX0qBjIydmNQGb164gzeeej8csjAfO38A5cttV1Xl40=;
 b=BjEvBL1lvBewtHyoTBmXZyZwiyNBsn0mk61dETsbWDDdVD4QlkOxrYyx2G+nqKcUX2
 1ErFdrBBHerHqxwZf5uH1EV9qJdeiSJjmRwIYh0NyXrgrhy16m/zioFCDKXtFIuwHTtO
 Zgk/SVEQa40HwnYgXTCTl0v+p+gr/jLd8YFITN1ss7A0bfIldQ7UD/JYlNQlsqEZfmDc
 NCwdVW57039DWwFvzUA/1WtP+JdDXPVclIGL5iN0zlkvV1x/oXO3C6ZXU2pn+A9xDiKB
 /aaHJfBPigHZ70skKsaTlqn4HRbzySU5RrhBWAW2kYngh2sBxVCpvRlEN6Cm7XiIggGC
 neAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795646157; x=1796250957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aX0qBjIydmNQGb164gzeeej8csjAfO38A5cttV1Xl40=;
 b=0Wap6Unny1CdSQsB+KQE9OHcF/l1/NKDKBIDL9xn1x87xC0vTh1qlYS5zugy8uKg/L
 840YNk9odPHTOAUKzAnvA3eDqMTOQixN9576fqGppPj0v6QwkrhwZQHqLkhpcdAYsfdg
 IQg/q502k3o6wkr5IPKEuB0dSMXNJCEzUGWxDfIzvNqXupqFxdF00xdfEcwQMO6sgeH5
 5P2NAHOCxKYQWvX869wgLJwUGEhEAs3+CpRmTny96mDAQVdg8eYXTquRxwTSfb7+za66
 ldWqH3g0y8/oBc4Alf6R/jCPtzen1OX+x5Z4CbW582m83fYpKpn52Ibe1ZUGsV27tl1c
 V84w==
X-Gm-Message-State: APuU4Z8GrSNKD4lF+wEXhVeanrkIPwdulfmFYAgGCkj9HeHgO5El6jcG
 2W99YEE6dbIwTc9SzAZL3HFBiEZSd5WfKhqRIPA/AP43dvHTUyyE96xgwNcrFA==
X-Gm-Gg: AZFdTZdFFq8zZOLvZ5qsW/ilR0YjMkyhmJqfUQEgJvwXPBTBHb7qKexx5t2gNGo5zj0
 6UkLhW+kfst0wcnXgpZvI6xH+qYCswAFo00+jLBTLfBnpHjbyR0QvOjYRJg2uuZZBRQiPw8dS/e
 4OQQM+sbScutnkG0yU/x82gBTtqyPoH7AWAL8OMvgLKraM/YiVN3vs0TcTcc2+/Vm8BPOjqhVot
 ZCWIIN9FHgdjwyrwi6yqGSQKzlo6Nw62kp8RH+lMArWDcMyEpl1KrlSqYQYbBfmoI95VSZ3na9c
 Ilo9QDh89ZtegbmatELF6iw3zcqTUX9BDTzBH5OHW1sfSfDRmJsUE8Panq9xheEELj3mGKHDxWJ
 axAhxXfeIi9QmqWMdrq8t3wPMWCT4bKN8OLEM8hFPPL+RtZrwzxoQWGJh795szmSmkP+uyhhbHC
 A1ywQ2M6ktRyFQ4nzKDIhVxduq0TdS2MECWTQUhvowbFTPJD4cwkjxXkjmYHgqn4X+wAFUmRdyZ
 CcFJFhXKJWJl5TxsOJpep02+VZckP46lzwYJRyOygALdcdSJobwqQyOCDlO8/PyQM9YlIPP0ooU
 5vbvj8KE6obHZX/4jh7aj1NT6p80wnrIFbytERRG/qhogeQ/yB8=
X-Received: by 2002:a05:6000:3106:b0:4ac:2194:755a with SMTP id
 ffacd0b85a97d-4ac219475a1mr43438194f8f.41.1795646157000; 
 Wed, 25 Nov 2026 14:35:57 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67fe75sm42194222f8f.24.2026.11.25.14.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 14:35:56 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 25 Nov 2026 23:35:54 +0100
Message-ID: <20261125223554.3326338-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125223554.3326338-1-angelo.compagnucci@gmail.com>
References: <20261125223554.3326338-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/friendlyarm_nanopi_neo_air: new
 defconfig
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

NanoPi NEO Air: Allwinner H3, 512 MB RAM, 8 GB eMMC, AP6212 Wi-Fi and
Bluetooth, no Ethernet.

Based on friendlyarm_nanopi_neo_defconfig: Linux 6.18.65, U-Boot
2026.01, mainline device tree and U-Boot defconfig.

Micro SD card and eMMC:
 - genimage builds sdcard.img and emmc.img, with different disk
   signatures;
 - U-Boot enables the eMMC (CONFIG_MMC_SUNXI_SLOT_EXTRA=2) and boots
   from the device it was loaded from first;
 - extlinux.conf uses root=PARTUUID=${distro_bootpart_uuid}.

eMMC flashing over USB, in FEL mode:
 - U-Boot enables "ums"; boot.scr runs "ums 0 mmc 1" through
   bootcmd_fel;
 - a custom U-Boot device tree includes the mainline one and enables
   usb_otg, in peripheral mode;
 - host-sunxi-tools provides sunxi-fel and fel-sdboot.sunxi (the board
   has no FEL button);
 - flash-emmc.sh loads U-Boot with sunxi-fel, waits for the UMS disk
   and writes emmc.img to it.

Wi-Fi:
 - a kernel fragment enables brcmfmac (disabled in the sunxi
   defconfig);
 - linux-firmware BCM43XXX, with a post-build link to the AP6212 NVRAM
   under the name brcmfmac looks for;
 - wpa_supplicant.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS                                    |  2 +
 .../friendlyarm/nanopi-neo-air/extlinux.conf  |  4 +
 board/friendlyarm/nanopi-neo-air/fel-ums.cmd  |  4 +
 .../friendlyarm/nanopi-neo-air/flash-emmc.sh  | 30 ++++++
 board/friendlyarm/nanopi-neo-air/genimage.cfg | 37 ++++++++
 .../nanopi-neo-air/linux-wifi.fragment        |  6 ++
 .../nanopi-neo-air/patches/linux/linux.hash   |  2 +
 .../nanopi-neo-air/patches/uboot/uboot.hash   |  2 +
 .../friendlyarm/nanopi-neo-air/post-build.sh  |  9 ++
 board/friendlyarm/nanopi-neo-air/readme.txt   | 95 +++++++++++++++++++
 .../sun8i-h3-nanopi-neo-air-ums.dts           |  9 ++
 .../friendlyarm/nanopi-neo-air/uboot.fragment |  8 ++
 configs/friendlyarm_nanopi_neo_air_defconfig  | 45 +++++++++
 13 files changed, 253 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo-air/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-neo-air/fel-ums.cmd
 create mode 100755 board/friendlyarm/nanopi-neo-air/flash-emmc.sh
 create mode 100644 board/friendlyarm/nanopi-neo-air/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-neo-air/linux-wifi.fragment
 create mode 100644 board/friendlyarm/nanopi-neo-air/patches/linux/linux.hash
 create mode 100644 board/friendlyarm/nanopi-neo-air/patches/uboot/uboot.hash
 create mode 100755 board/friendlyarm/nanopi-neo-air/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-neo-air/readme.txt
 create mode 100644 board/friendlyarm/nanopi-neo-air/sun8i-h3-nanopi-neo-air-ums.dts
 create mode 100644 board/friendlyarm/nanopi-neo-air/uboot.fragment
 create mode 100644 configs/friendlyarm_nanopi_neo_air_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 59fad7f26b..54a2dafc72 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -222,8 +222,10 @@ N:	Andrey Yurovsky <yurovsky@gmail.com>
 F:	package/rauc/
 
 N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
+F:	board/friendlyarm/nanopi-neo-air/
 F:	board/sipeed/lichee_rv/
 F:	board/sipeed/lichee_rv_dock/
+F:	configs/friendlyarm_nanopi_neo_air_defconfig
 F:	configs/sipeed_lichee_rv*
 F:	docs/website/
 F:	package/apparmor/
diff --git a/board/friendlyarm/nanopi-neo-air/extlinux.conf b/board/friendlyarm/nanopi-neo-air/extlinux.conf
new file mode 100644
index 0000000000..574f21ddb0
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/extlinux.conf
@@ -0,0 +1,4 @@
+label NanoPi NEO Air linux
+  kernel /boot/zImage
+  devicetree /boot/sun8i-h3-nanopi-neo-air.dtb
+  append console=ttyS0,115200 earlyprintk root=PARTUUID=${distro_bootpart_uuid} rootwait panic=10
diff --git a/board/friendlyarm/nanopi-neo-air/fel-ums.cmd b/board/friendlyarm/nanopi-neo-air/fel-ums.cmd
new file mode 100644
index 0000000000..d7b3dcf68f
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/fel-ums.cmd
@@ -0,0 +1,4 @@
+# Run by U-Boot when it is loaded over USB with sunxi-fel (FEL mode):
+# export the eMMC to the PC as a USB disk, to write emmc.img to it.
+echo "NanoPi NEO Air: the eMMC is exported over USB, write emmc.img to it"
+ums 0 mmc 1
diff --git a/board/friendlyarm/nanopi-neo-air/flash-emmc.sh b/board/friendlyarm/nanopi-neo-air/flash-emmc.sh
new file mode 100755
index 0000000000..aff7236e4b
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/flash-emmc.sh
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+# Write emmc.img to the eMMC of a NanoPi NEO Air in FEL mode.
+# Usage: sudo board/friendlyarm/nanopi-neo-air/flash-emmc.sh [OUTPUT_DIR]
+
+set -e
+
+OUTPUT_DIR="${1:-output}"
+IMAGES_DIR="${OUTPUT_DIR}/images"
+SUNXI_FEL="${OUTPUT_DIR}/host/bin/sunxi-fel"
+
+echo "Waiting for the board in FEL mode..."
+until "${SUNXI_FEL}" ver 2>/dev/null | grep -q "(H3)"; do
+	sleep 1
+done
+
+"${SUNXI_FEL}" -v \
+	uboot "${IMAGES_DIR}/u-boot-sunxi-with-spl.bin" \
+	write 0x43100000 "${IMAGES_DIR}/boot.scr"
+
+# U-Boot exports the eMMC as a USB disk ("ums"): wait for it
+echo "Waiting for the eMMC USB disk..."
+DISK=""
+while [ -z "${DISK}" ]; do
+	sleep 1
+	DISK=$(find /dev/disk/by-id -name 'usb-Linux_UMS_disk_*-0:0')
+done
+
+umount "${DISK}"-part* 2>/dev/null || true
+dd if="${IMAGES_DIR}/emmc.img" of="${DISK}" bs=1M conv=fsync status=progress
diff --git a/board/friendlyarm/nanopi-neo-air/genimage.cfg b/board/friendlyarm/nanopi-neo-air/genimage.cfg
new file mode 100644
index 0000000000..b5790709ff
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/genimage.cfg
@@ -0,0 +1,37 @@
+# NanoPi NEO Air images: the same system for the micro SD card and for
+# the eMMC, with different disk signatures, so different PARTUUIDs.
+image sdcard.img {
+	hdimage {
+		disk-signature = 0x4e454f41
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 1M
+	}
+}
+
+image emmc.img {
+	hdimage {
+		disk-signature = 0x4e454f45
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 1M
+	}
+}
diff --git a/board/friendlyarm/nanopi-neo-air/linux-wifi.fragment b/board/friendlyarm/nanopi-neo-air/linux-wifi.fragment
new file mode 100644
index 0000000000..d27f52f733
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/linux-wifi.fragment
@@ -0,0 +1,6 @@
+CONFIG_WLAN=y
+CONFIG_WLAN_VENDOR_BROADCOM=y
+CONFIG_CFG80211=m
+CONFIG_BRCMFMAC=m
+CONFIG_BRCMFMAC_SDIO=y
+CONFIG_PWRSEQ_SIMPLE=y
diff --git a/board/friendlyarm/nanopi-neo-air/patches/linux/linux.hash b/board/friendlyarm/nanopi-neo-air/patches/linux/linux.hash
new file mode 100644
index 0000000000..99b8fa41a5
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c92606f956f09dc50b5a0e2af9e86763fce27ada1647de97f8d1ac8cfc95801d  linux-6.18.65.tar.xz
diff --git a/board/friendlyarm/nanopi-neo-air/patches/uboot/uboot.hash b/board/friendlyarm/nanopi-neo-air/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/friendlyarm/nanopi-neo-air/post-build.sh b/board/friendlyarm/nanopi-neo-air/post-build.sh
new file mode 100755
index 0000000000..029da3b351
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
+
+# The AP6212 NVRAM of linux-firmware, under the name brcmfmac looks for
+ln -sf brcmfmac43430-sdio.AP6212.txt \
+	"$TARGET_DIR"/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo-air.txt
diff --git a/board/friendlyarm/nanopi-neo-air/readme.txt b/board/friendlyarm/nanopi-neo-air/readme.txt
new file mode 100644
index 0000000000..d398859940
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/readme.txt
@@ -0,0 +1,95 @@
+NanoPi NEO Air
+
+Intro
+=====
+
+This configuration builds a minimal system for the FriendlyELEC NanoPi
+NEO Air (Allwinner H3, 512 MB RAM, 8 GB eMMC, AP6212 Wi-Fi/Bluetooth).
+The same system boots from a micro SD card or from the eMMC.
+
+The board has no Ethernet port. The console is on the debug UART pins,
+115200 8N1.
+
+FriendlyELEC NanoPi NEO Air link:
+https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO_Air
+
+How to build it
+===============
+
+    $ make friendlyarm_nanopi_neo_air_defconfig
+    $ make
+
+The build creates two images in output/images:
+
+ - sdcard.img, for the micro SD card;
+ - emmc.img, for the eMMC.
+
+They have the same content, but different partition IDs, so the board
+can have a system on both at the same time.
+
+The board boots from the micro SD card when it finds a system on it,
+then from the eMMC.
+
+Booting from a micro SD card
+============================
+
+Write output/images/sdcard.img to a micro SD card:
+
+    $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+    $ sudo sync
+
+Insert the micro SD card in the board and power it up.
+
+Booting from the eMMC
+=====================
+
+The eMMC is written over USB, in FEL mode: in this mode, the boot ROM
+of the H3 waits for a PC on the micro USB port. The board enters it
+when it finds no system on a micro SD card nor on the eMMC (e.g. a new
+board).
+
+ 1. Connect the micro USB port to the PC, and power the board up in FEL
+    mode:
+
+    - when the eMMC is empty: without a micro SD card;
+    - when the eMMC already has a system: with a micro SD card that only
+      enters FEL mode (the board boots from the micro SD card first),
+      written once with:
+
+        $ sudo dd if=output/images/fel-sdboot.sunxi of=/dev/sdX bs=1024 seek=8
+
+      Remove this micro SD card once U-Boot is loaded (step 2), before
+      the board is powered off and on (step 4).
+
+    For your convenience, a flash-emmc.sh script has been provided. It
+    does steps 2 and 3: it waits for the board in FEL mode, loads
+    U-Boot, waits for the USB disk and writes emmc.img to it:
+
+        $ sudo board/friendlyarm/nanopi-neo-air/flash-emmc.sh output
+
+ 2. Load U-Boot and its FEL script (output/images/boot.scr) over USB:
+
+        $ sudo output/host/bin/sunxi-fel -v \
+            uboot output/images/u-boot-sunxi-with-spl.bin \
+            write 0x43100000 output/images/boot.scr
+
+    U-Boot runs the script, which exports the eMMC to the PC as a USB
+    disk: a new disk appears on the PC (/dev/sdY).
+
+ 3. Check its name with lsblk, unmount it if it was mounted, and write
+    the image to the whole disk (/dev/sdY, not a partition):
+
+        $ sudo dd if=output/images/emmc.img of=/dev/sdY bs=1M conv=fsync status=progress
+
+ 4. Power the board off and on, without a micro SD card: it boots from
+    the eMMC.
+
+Wi-Fi
+=====
+
+    # modprobe brcmfmac
+    # wpa_passphrase <SSID> <passphrase> > /etc/wpa_supplicant.conf
+    # wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf
+    # udhcpc -i wlan0
+
+Enjoy!
diff --git a/board/friendlyarm/nanopi-neo-air/sun8i-h3-nanopi-neo-air-ums.dts b/board/friendlyarm/nanopi-neo-air/sun8i-h3-nanopi-neo-air-ums.dts
new file mode 100644
index 0000000000..8dd4e73757
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/sun8i-h3-nanopi-neo-air-ums.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include "sun8i-h3-nanopi-neo-air.dts"
+
+/* USB OTG port in peripheral mode, for "ums" */
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
diff --git a/board/friendlyarm/nanopi-neo-air/uboot.fragment b/board/friendlyarm/nanopi-neo-air/uboot.fragment
new file mode 100644
index 0000000000..631483fbb7
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-air/uboot.fragment
@@ -0,0 +1,8 @@
+CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_USB_GADGET=y
+CONFIG_USB_MUSB_GADGET=y
+CONFIG_USB_GADGET_DOWNLOAD=y
+CONFIG_CMD_USB_MASS_STORAGE=y
+CONFIG_USB_ETHER=y
+CONFIG_BOOTDELAY=1
+CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-nanopi-neo-air-ums"
diff --git a/configs/friendlyarm_nanopi_neo_air_defconfig b/configs/friendlyarm_nanopi_neo_air_defconfig
new file mode 100644
index 0000000000..796bd4f6fb
--- /dev/null
+++ b/configs/friendlyarm_nanopi_neo_air_defconfig
@@ -0,0 +1,45 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-neo-air/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo-air"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO Air"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo-air/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo-air/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.65"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/friendlyarm/nanopi-neo-air/linux-wifi.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-nanopi-neo-air"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo_air"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/friendlyarm/nanopi-neo-air/uboot.fragment"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="board/friendlyarm/nanopi-neo-air/sun8i-h3-nanopi-neo-air-ums.dts"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_SUNXI_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo-air/fel-ums.cmd"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
