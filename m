Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD2F606A328
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pw+L5xI8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBdnjWFz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D311F60778;
	Thu,  5 Nov 2026 15:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxLyFXq_dFFw; Thu,  5 Nov 2026 15:37:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7FFB16070C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793893030;
	b=iSOWyc3rgMMoVs40HDCCsBik6nSpjO1AIXrVoclDPXVy64u56bhNGY2cCQnZdeFJlI1i
	 PcZYaClZUzeUxtZV1iv4T7tFrt3+HfUSUBqgtZVsds+bzs6/xNTfFRmtxtket9uEeLB3S
	 MQq58BqV9/hs/R5MzXA88eNWRvk/pdGbB4d0QjTK6AkGwGahD8Y3YKt02SMBfeuMScAqs
	 XOcGOLe4/uIQ+iqpfHdb8P12lcibjo2afEuGnnaUELKL19wQsn71PHDgnV6MbSGL6+YER
	 /82dU3YQyxmliWlHj64AvMt3I2O46rCYCK23xyGpb/Mx4hPg1FWSvykKV1ao3PFY9ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793893030;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LfQzsyRTl6yNWi+Ifu9JWbqZFW/tSgheg07kyjcxAXs=;
	b=d1TCUULxURmGG12aamWemYbMJcNx4s7BbLb57NuSZp1R4f1CqaK0FxonqLId7+JSw9lw
	 1BqxWYmk4FMUsleoCzMr3bBJ9AagMjik9l/7i6gbiBf+AEezjreX52+GrVUo6eJwaqdTU
	 4QdAGFY/UA44A73RiNZqur6ou0Z3YC9n4IS0Nsz89T2pK00Asw9oNkDHahDm8OAoCMulJ
	 vpsySxipvE0X6N6+3FnXDweRYOH7r4cSz0i9XaHnz9qyAxyd9Smh7040sKrB+rHsvc2cm
	 UocWjPoWo+SxyFT+D1qeW9NSeGRuWcnoh5r8y6AHBu26a8azXOApMgE+0SkN3TmdrAg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793893030;
	bh=LfQzsyRTl6yNWi+Ifu9JWbqZFW/tSgheg07kyjcxAXs=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pw+L5xI8huFkJaKGiynJllk07jY7nCpCeETMm6dHj2YPQ3J40FBiyPLtdc2I4nMtx
	 Z64NcnewRG5WBOp82e1xJ4rrjGdKY5GmYrUbmsxmIRLNzB7TjaAXIb6PtXbW3N7kkM
	 hiH3BiXNet/jbArDX2QQkcBnIJaSksNvy5vMPDFQ30eZpLY5sHmVCq5HAC57TW4cEX
	 HLfkEjFYOmNwnlqSMIzCwwmVXqpj2WdtzL0JGP0FLolSF3o3eAkwLe9uKBQ1DJzAKD
	 pLxcqohM5prG2a18pTDdSQWEgjzuZX517rt6KA9QEXLpB/wAXqH2Oj30NP7v2iZcpF
	 4AYwRuVkYE+9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FFB16070C;
	Thu,  5 Nov 2026 15:37:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BB53B00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EBE1401B9
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9MoceyxC2H7 for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 15:37:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B1E0D4007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=pBdnjWFz
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1E0D4007E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:37:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so12776255e9.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793893024; x=1794497824; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=R3Ir4zDdBSZlt5n7Om0EMqCq6gN/GqshMzB74GIBMnM=;
 b=pBdnjWFzGcymNuEHx5TE8Lre5m0hqc2hKwEpEQo1cJDi7FTeQun3wdsyxEIAWJrr9M
 mKwtH4gyOT8aPyZJ1QcTBoyulCFbqUYp6geI88s0GwkqwaYO+5/fHEl9i6DywVKMtjvd
 doK3Bi4htXf1PxX7b1qY7Q8+U2wav+O7AKxhIwQofnw+EHt76Gbo5NtQgpDfSRK0/e+A
 eqxiC77K+tiWOuXnzWCl6t4xlZ8Bgj6Mejioz6yC6ZS/nqGdR/ZZRNUO7O5hufmltpVz
 S9/Sd4jxsOrn50sDWwV/vhGj4KwEeinHoUtFIxUrXGTvFa+IjQLlPBzGI/7fRMYWvfxt
 kJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793893024; x=1794497824;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=R3Ir4zDdBSZlt5n7Om0EMqCq6gN/GqshMzB74GIBMnM=;
 b=xHGqEwXYbKd2swnkMaHuZ8fSjHCtYSvkJb05+Qxw8w9Iemek1gPZgSC4xWiM/1MckT
 oI46dl5Oq+4b3Vh0zRodmlAi+BGpoB5Abejk4dFHpiejP9CIRGW3nuD/r/ecSqBI8ESf
 k0lZbgXzwfPfo3jOLJ8XCkgYV+ebpNwoC7XTSrXkzTgkLe2t+Ael1a9WxLBRk0NUd/p7
 d2XsZyDKF9tMFpa9HZPy1hYCOnTADv6304sdPxhPJhCaetAbT5q6ZGai9AY3FdE/nRR8
 NhlEEZpFm3MWB4PV6GINBVCZZo1rUNsr07GUTIr1c5JyaZVbb6O1BDo34qon6c8izV4m
 8Y5Q==
X-Gm-Message-State: APuU4Z+qUIgQzC9rZh01wRnPKY5QM/hKmC9zUu73PPksSPvfMCgVegid
 gmQ0VLmNdi8N81AvYzy314AWyzJWZntcQf8jBYCqlx0hJJNXmUI/bPRaKXQMvKjo
X-Gm-Gg: AYBFou0RFF12awkctZECZcgbMrAj6VS1EASfr/e8VAQ48Hk8280rVLpVe+fXR46K0cG
 x/FfmGJj7313gH87ndXcFlX+12dI3tZUxyTmGCYM8LvdZwyIswnA5icuU30k1+KmWoBuMMPhNp3
 TJ7FU9oy01ewaWq+Is75kblrYgRPXWckpg5T3cdq08RbQdO/LGB5GkWw4/deXJ1xPFiCZGyIECZ
 XtA2TUOmEOCt9opc5BLfBg0uT/GG1RKyvxFJi5m7sJqBGFy5VlPYA0V41qvZbd5IH8YXavK4m9w
 LjIXKtZG5PkKl/3UguiNqrVNjBQb4hmIJPgyyR26oZ0VEU8IRgbipQBMOKy1ukY3CSVcosoUQUh
 /VRQE//K8I2Suo+eM+XoTs7jeujS06Wlz/Mw7AmDCGhDV4vSPqawkXm3gNbOIbi2TiZFtwKR3hu
 0AE/RCycUV9U+SL7TEjMlm4NP6BtWI+Z2Z7r7rxmAPQ6/G8bzTdL2Veo3MIKfldOthBuUVGAMVT
 TcbAR9yi1XNEK0RYNsX3ldSKQ30IyfJ9A7tBtXXsYiTxCzxagNLpR4QeLdpDXrbCHdfb4ef3Unl
 tIQlJURvNczUTwABFHmeCubuYAJCh+uJIQa/5PeLE00g/R/F0kdsUCKHv/hJE1SvAq1WBTCMyKh
 75be3YRwOdBbRE/Q7JBfmIH+Qrfz1VCLILo5fABS/0Q==
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id
 5b1f17b1804b1-4ac1970b9f7mr419789245e9.34.1793893023999; 
 Thu, 05 Nov 2026 07:37:03 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fece99d67sm10808207f8f.24.2026.11.05.07.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 07:37:03 -0800 (PST)
Date: Thu, 5 Nov 2026 16:37:02 +0100
From: =?iso-8859-1?B?TOlv?= DENIEUL <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>
Message-ID: <auyinlA6m22X6x6P@leo-ThinkPad-P16s-Gen-4-AMD>
References: <auIW8EW-9Qo0NFXv@skbuf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auIW8EW-9Qo0NFXv@skbuf>
Subject: [Buildroot] [PATCH v8 2/2] configs/lx2160a-rdb: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a defconfig for the NXP LX2160A-RDB using upstream components
instead of the NXP BSP forks used by freescale_lx2160ardb_defconfig:

  - TF-A v2.15.0
  - U-Boot 2026.10 (lx2160ardb_tfa_defconfig)
  - Linux 6.18.60 (arm64 defconfig, fsl-lx2160a-rdb.dtb)

This avoids depending on NXP BSP release tags, which are not updated
as often as the upstream projects.

The RCW, U-Boot environment and configuration fragment are shared with
board/freescale/lx2160ardb/. board/freescale/lx2160a-rdb/ contains the
hashes of the upstream components, its own genimage.cfg (without the
retimer firmware), and the post-build script and extlinux.conf from
lx2160ardb, so that the post-build script picks this genimage.cfg.

Mainline U-Boot has no loader for the Inphi IN112525 retimer firmware,
so qoriq-firmware-inphi is not selected and the firmware is not
written to the SD card. As a consequence, the 25GbE/50GbE/100GbE ports
are not functional.

Tested on an LX2160ARDB: boot from SD card.

Signed-off-by: L=E9o DENIEUL <leo.denieul.yoshino@gmail.com>
---
 DEVELOPERS                                    |  2 +
 board/freescale/lx2160a-rdb/extlinux.conf     |  1 +
 board/freescale/lx2160a-rdb/genimage.cfg      | 40 +++++++++++++
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  2 +
 .../lx2160a-rdb/patches/linux/linux.hash      |  2 +
 .../lx2160a-rdb/patches/uboot/uboot.hash      |  2 +
 board/freescale/lx2160a-rdb/post-build.sh     | 11 ++++
 board/freescale/lx2160a-rdb/readme.txt        | 46 +++++++++++++++
 configs/lx2160a-rdb_defconfig                 | 56 +++++++++++++++++++
 10 files changed, 164 insertions(+)
 create mode 120000 board/freescale/lx2160a-rdb/extlinux.conf
 create mode 100644 board/freescale/lx2160a-rdb/genimage.cfg
 create mode 100644 board/freescale/lx2160a-rdb/patches/arm-trusted-firmwar=
e/arm-trusted-firmware.hash
 create mode 100644 board/freescale/lx2160a-rdb/patches/linux-headers/linux=
-headers.hash
 create mode 100644 board/freescale/lx2160a-rdb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160a-rdb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160a-rdb/post-build.sh
 create mode 100644 board/freescale/lx2160a-rdb/readme.txt
 create mode 100644 configs/lx2160a-rdb_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 659c748db9..cdce895254 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2176,7 +2176,9 @@ N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 =

 N:	Leo Denieul <leo.denieul.yoshino@gmail.com>
+F:	board/freescale/lx2160a-rdb
 F:	configs/freescale_lx2160ardb_defconfig
+F:	configs/lx2160a-rdb_defconfig
 =

 N:	Leon Anavi <leon.anavi@konsulko.com>
 F:	board/olimex/a10_olinuxino
diff --git a/board/freescale/lx2160a-rdb/extlinux.conf b/board/freescale/lx=
2160a-rdb/extlinux.conf
new file mode 120000
index 0000000000..bc68bcfca3
--- /dev/null
+++ b/board/freescale/lx2160a-rdb/extlinux.conf
@@ -0,0 +1 @@
+../lx2160ardb/extlinux.conf
\ No newline at end of file
diff --git a/board/freescale/lx2160a-rdb/genimage.cfg b/board/freescale/lx2=
160a-rdb/genimage.cfg
new file mode 100644
index 0000000000..c6780e6220
--- /dev/null
+++ b/board/freescale/lx2160a-rdb/genimage.cfg
@@ -0,0 +1,40 @@
+image sdcard.img {
+	/* Primary GPT table needs to be moved to a region which does
+	 * not collide with the RCW/PBI location
+	 */
+	hdimage {
+		partition-table-type =3D "gpt"
+		gpt-location =3D 6M
+	}
+
+	partition rcw {
+		offset =3D 4K
+		in-partition-table =3D "no"
+		image =3D "bl2_sd.pbl"
+	}
+
+	partition u-boot {
+		offset =3D 1M
+		in-partition-table =3D "no"
+		image =3D "fip.bin"
+	}
+
+	partition u-boot-environment {
+		in-partition-table =3D "no"
+		image =3D "uboot-env.bin"
+		offset =3D 5M
+	}
+
+	/* Offset must match PLAT_DDR_FIP_OFFSET from ATF */
+	partition ddr-phy {
+		in-partition-table =3D "no"
+		image =3D "fip_ddr.bin"
+		offset =3D 8M
+	}
+
+	partition rootfs {
+		bootable =3D "true"
+		image =3D "rootfs.ext4"
+		partition-uuid =3D %PARTUUID%
+	}
+}
diff --git a/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/arm-t=
rusted-firmware.hash b/board/freescale/lx2160a-rdb/patches/arm-trusted-firm=
ware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..367a03c1ce
--- /dev/null
+++ b/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/arm-trusted-=
firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  b807d8bf190b7c46b4260729b4bbe2f7df83cd1086edcb181d66595ae6598d23  =
arm-trusted-firmware-v2.15.0-git4.tar.gz
diff --git a/board/freescale/lx2160a-rdb/patches/linux-headers/linux-header=
s.hash b/board/freescale/lx2160a-rdb/patches/linux-headers/linux-headers.ha=
sh
new file mode 100644
index 0000000000..a5e2b5fc40
--- /dev/null
+++ b/board/freescale/lx2160a-rdb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  =
linux-6.18.60.tar.xz
diff --git a/board/freescale/lx2160a-rdb/patches/linux/linux.hash b/board/f=
reescale/lx2160a-rdb/patches/linux/linux.hash
new file mode 100644
index 0000000000..a5e2b5fc40
--- /dev/null
+++ b/board/freescale/lx2160a-rdb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  =
linux-6.18.60.tar.xz
diff --git a/board/freescale/lx2160a-rdb/patches/uboot/uboot.hash b/board/f=
reescale/lx2160a-rdb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b535557b88
--- /dev/null
+++ b/board/freescale/lx2160a-rdb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  =
u-boot-2026.10.tar.bz2
diff --git a/board/freescale/lx2160a-rdb/post-build.sh b/board/freescale/lx=
2160a-rdb/post-build.sh
new file mode 100755
index 0000000000..4042bf9c7e
--- /dev/null
+++ b/board/freescale/lx2160a-rdb/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+BOARD_DIR=3D"$(dirname "$0")"
+PARTUUID=3D"$("$HOST_DIR/bin/uuidgen")"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+# Default DPL and DPC selections for mcinitcmd
+ln -sf dpc-usxgmii.dtb "$TARGET_DIR/boot/dpc.dtb"
+ln -sf dpl-eth.19.dtb "$TARGET_DIR/boot/dpl.dtb"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/b=
oot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/=
genimage.cfg"
diff --git a/board/freescale/lx2160a-rdb/readme.txt b/board/freescale/lx216=
0a-rdb/readme.txt
new file mode 100644
index 0000000000..f0c03a5958
--- /dev/null
+++ b/board/freescale/lx2160a-rdb/readme.txt
@@ -0,0 +1,46 @@
+******************************************
+NXP LX2160ARDB (upstream TF-A/U-Boot/Linux)
+******************************************
+
+This file documents the Buildroot support for the LX2160A Reference Design
+Board, using upstream versions of TF-A, U-Boot and Linux instead of the NXP
+BSP forks used by freescale_lx2160ardb_defconfig.
+
+The upstream components are:
+  - arm-trusted-firmware, v2.15.0
+  - uboot, 2026.10 (lx2160ardb_tfa_defconfig)
+  - linux, 6.18.60 (arm64 defconfig, fsl-lx2160a-rdb.dtb)
+
+The board files (RCW, U-Boot environment and configuration fragment) are
+shared with freescale_lx2160ardb_defconfig and live in
+board/freescale/lx2160ardb/. This directory only contains what differs:
+the hashes of the upstream components and the SD card layout.
+
+Build
+=3D=3D=3D=3D=3D
+
+First, configure Buildroot for the LX2160ARDB board:
+
+  make lx2160a-rdb_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the same files as described in
+board/freescale/lx2160ardb/readme.txt, except in112525-phy-ucode.txt.
+
+Create a bootable SD card and boot the board
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The procedure is identical to freescale_lx2160ardb_defconfig, see
+board/freescale/lx2160ardb/readme.txt.
+
+For details about the medium image layout, see the definition in
+board/freescale/lx2160a-rdb/genimage.cfg.
+
+Known limitations
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Mainline U-Boot cannot load the firmware of the Inphi IN112525 retimer,
+so the 25GbE/50GbE/100GbE ports are not functional.
diff --git a/configs/lx2160a-rdb_defconfig b/configs/lx2160a-rdb_defconfig
new file mode 100644
index 0000000000..c261ade4af
--- /dev/null
+++ b/configs/lx2160a-rdb_defconfig
@@ -0,0 +1,56 @@
+BR2_cortex_a72=3Dy
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=3Dy
+BR2_GLOBAL_PATCH_DIR=3D"board/freescale/lx2160a-rdb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy
+BR2_TARGET_GENERIC_HOSTNAME=3D"lx2160ardb"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=3Dy
+BR2_TARGET_GENERIC_GETTY_PORT=3D"ttyAMA0"
+BR2_ROOTFS_OVERLAY=3D"board/freescale/common/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/freescale/lx2160a-rdb/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=3Dy
+BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.18.60"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
+BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
+BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"freescale/fsl-lx2160a-rdb"
+BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
+BR2_TARGET_ROOTFS_EXT2=3Dy
+BR2_TARGET_ROOTFS_EXT2_4=3Dy
+BR2_TARGET_ROOTFS_EXT2_SIZE=3D"256M"
+BR2_TARGET_ROOTFS_CPIO=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D"v2.15.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D"lx2160ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=3Dy
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES=3D"BOOT_MODE=3Dsd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=3D"fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=3Dy
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
+BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2026.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"lx2160ardb_tfa"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES=3D"board/freescale/lx2160ardb/uboot=
.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=3Dy
+BR2_PACKAGE_HOST_GENIMAGE=3Dy
+BR2_PACKAGE_HOST_QORIQ_RCW=3Dy
+BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH=3D"board/freescale/lx2160ardb/rcw_2=
200_750_3200_19_5_2_sd.rcw"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=3Dy
+# Minimal U-Boot environment for bootstd with DPAA2 MC firmware init
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=3D"board/freescale/lx2160ardb=
/uboot-env.txt board/freescale/common/env-dpaa2.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE=3D"0x2000"
+BR2_PACKAGE_QORIQ_DDR_PHY_BINARY=3Dy
+BR2_PACKAGE_QORIQ_MC_BINARY=3Dy
+BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A=3Dy
+BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH=3D"boot"
+BR2_PACKAGE_QORIQ_MC_UTILS=3Dy
+BR2_PACKAGE_QORIQ_MC_UTILS_DPC_INTREE=3D"lx2160a/LX2160A-RDB/dpc-usxgmii l=
x2160a/LX2160A-RDB/dpc-warn"
+BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE=3D"lx2160a/LX2160A-RDB/dpl-2dpni lx2=
160a/LX2160A-RDB/dpl-eth.19"
+BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH=3D"boot"
+BR2_PACKAGE_QORIQ_RESTOOL=3Dy
-- =

2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
