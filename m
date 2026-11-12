Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D463606A32D
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZEM4Ci3J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqL7NuAw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA6E409FA;
	Thu, 12 Nov 2026 09:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UoieU-lPMlZL; Thu, 12 Nov 2026 09:39:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6795540A32
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794476392;
	b=guvL+NcpmPjXnQo2tDXXAgElZXJ29hZi10QkEHGTHvhFNvsiU+jK+fAcab/F7/Lyz9PO
	 gChCOx5NSv228CzVzF6aefK4QXBu42R26K4GMf/F8Kl4Fktj4t0HqrXV4v3eir7DvOnH8
	 SXhqlHGHMVV4kpUdyfC08Dx8/n4ram7qi3Qyx2f0rWVxvA3ymxVFk3OYjeHGVxsP0IoLc
	 SQaEjD6Ut+f/W7QcXvWVB3yGtOrJMNPPV0itEoY5iF6aLLE6OfGd1Td/sVpnuGLtewIMv
	 +3c8x4JM25uHRoQ5lIUatNc6jzrPkisOFloJ1211k0Pvljh4p0OhlwMKN9lsZS1y7xQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794476392;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ONoN3yvgldX2/nzKzLvNUCpazyxxu7jpLI+GHJYlRtA=;
	b=caZSdJJGXcfGkI/a7VoyN/e6ZRRwkBRVbJ3U/nQSsM8W4shjqYT1Jvp2XLiSc0WhkhmJ
	 cl0AedhLfZDQ6nbct06Qu902+R3HI8XjC7QmlUE2Aj8Q3krXwg06XY0GFclmRHqJMdLRa
	 1mb4inOOPc5rYPrw19Mwj4r4FEcwzhFJgTKypFPjqcOCkBHk76Y7qSTrkRdx6Mnyh210e
	 4kErI3IRFL75Qd6H4y5WkVizVdlqS1VdtKSHo/LFxOprI7768DuCS5WGjxspuEs95M0XE
	 r0IuKAFf8uVPkjLuTto7+hiZUpKI+8r7T94NaCqVUmMJymyjWIztmU208KjmRsQ8TDw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794476392;
	bh=ONoN3yvgldX2/nzKzLvNUCpazyxxu7jpLI+GHJYlRtA=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZEM4Ci3JiX5rHpp+KuhLsdr6NKsWtKdb0F3uqE8c9m6zReJnHcQDxn4GguxUpPnA4
	 9svGoJlBjOZVHh+6RDQSVp+JbnACwWJFMnyhYU7MV7gmHaNltjzcw90/JWvwOg6Jx6
	 a9bJY0Cp0Lk6rDxleM9zNnfnJIhVzereIHvcMPee0lpLJOB7dOgKnIoGWwIVelXMZg
	 qOkqH9dXhbwB0W0kOVL+IVto9010uy7NFh/Pj6+WPBvr2w1zCagV9B1gqX4HSr2UpF
	 ezX5fFzs1kgm5i5Hio+q1oG7aljPOL3NUgoXR1f9hALq49S3Sf3rK9GZ/B15VzwHVR
	 VjLaethGmHPxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6795540A32;
	Thu, 12 Nov 2026 09:39:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2E9F70B
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 09:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A854F816E4
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 09:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtpymPCwdm5s for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 09:39:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6BA09816E3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=zqL7NuAw
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BA09816E3
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 09:39:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so49491385e9.3
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 01:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794476387; x=1795081187; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kbXuZ8xFBYD3/okP2R6xYtiykbu3h7xOg7dCrFrzObE=;
 b=zqL7NuAwYV8y0AUnoPohgZdtyKYksDr8UXNEtJuEP7o3TtuLNModZK6dTO/ZtdTYGy
 6feRL/97zPMdg1eJA8bzWKSDL1JEzuOj69rgsW0LEhahgKOsUI7xAc4OPZgUx/7x+WNH
 QsQ5yBRU/KTJgFZBQi+Ym45GtoZe4kahoPTDNkTIDPD2Cw2gEFXllEha6LQgWqTy9HsS
 +GUhoT4wo14FrqYliQIHLuTMHV/CXkbZZJHmcL+bgQnaJ8VAy7enHEwordtiylof/4f8
 mQmMGfQvo3bz2PkDi8jD7IrIBhG/2tKcpJqOmtLdcQBmtHQiJARQ7V89HRrXJe62Cuvr
 6c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794476387; x=1795081187;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kbXuZ8xFBYD3/okP2R6xYtiykbu3h7xOg7dCrFrzObE=;
 b=xHedXMLZS3IsiiSQfdqpyNjUcgC1LN1SYP2cDj21hrOWrcLab+8HAHEdy0GZooV2W2
 hbXaJiCJMk9WZ8yvZt4HebN/Vng5MPTwCiko5Z9BzHZ4suSEdya+WkYtofU9da79Bu8R
 s8I5+eOeRwGEAOFZ010vURt3LO0mAjO25aANrsYGQD1BKV1tDU8TpXd45KU9VY2mxlRL
 1xYB593Tfzx7LbqdG64GmAR58E6+0scSZH7pcOx4tTcjL0Mve0iGRdJazRjytAZ77df0
 qLa/QvHoOUdrAtorA0n8EfTgSLJfyQRrqP4BNJdkmzOWwYi07uIa5yTa9IMZEhy2LPK+
 UKzg==
X-Gm-Message-State: APuU4Z/anUgsWAmSQdyWjPsM88aafrkipVBVFeI63ki3PRCpdac8CFyw
 mrJzj0w5u6zq5nkINJn3L+wO571d3u/yc4emLw+Hlqw2g7mWSA5346DgOGKicQ==
X-Gm-Gg: AYBFou2StcRZ+Dn5U4tkWzVisZOH+sK+1Rj9eRLnayOSLSP1vfVb0jcRa8bDFwWZTAH
 Y2/p19HVARQL3r2zXv0+pK1mZ04NX5bMUdTwsC3ONlbKjcIwB04deor2kW5Ba1ViCWR4dlkf8jl
 qriBTmfvMy65p6a+cskmYs6Helkx/12JtubHGZQJF7+mwjnXZ/X1rGbfCDliQC8r1fTN+vJJq3L
 GtUoHrLmYqe92Ai04+NarGA3JbYaIJrslTDUiXpPduxfdTmBGPAAglnvZDm06Vc12fmbSunFzEf
 LJ8MShJ7BMlTYOOuZr4HsTdNUa0364IBqMk0QciQiBmwwBfX5wm+faFkANQYvzunAqt8uUK8lLX
 AcrziyY2sm+xjk8bXgm3SSPM8JRRMLK/2JMk2H0kUWddaI+5dOcyyHcihjuTQRcGNgMpTtpz7zb
 gKkI7bhZw5g5u5DPRagmcZxFY7+pXtHi1Q+JsWYp/PbHmZUfjSEPpCp9N3q6wfhuk+7hkmpflGB
 KOxUdPxqR7ioEXW/ZDV8rYXU1IqHRxQeYQl6cfuPImbVbyXUkeb5VYnYe4eNPThrTxLE3kiHo4l
 6PZwdJdY44idWX6LFe1p0IdA5veBzIyx1Ln/MsuMxfYG2ad+Nf0/wSXpIAxDINCe7XFWtLtErLX
 vBHzQSkKhiwn/G6iIY3l7Bz5Quuwz/s5tRw4kTJ4noOY=
X-Received: by 2002:a05:600c:34c7:b0:4a3:5d64:df91 with SMTP id
 5b1f17b1804b1-4ba09382f46mr83525745e9.18.1794476386921; 
 Thu, 12 Nov 2026 01:39:46 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e251c26sm55406845e9.1.2026.11.12.01.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 01:39:46 -0800 (PST)
Date: Thu, 12 Nov 2026 10:39:45 +0100
From: Leo Denieul <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <474ec5cfc432c4b9e9413ee991ccb9d0763c9392.1794475724.git.leo.denieul.yoshino@gmail.com>
References: <cover.1794475724.git.leo.denieul.yoshino@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1794475724.git.leo.denieul.yoshino@gmail.com>
Subject: [Buildroot] [PATCH 2/2] board/freescale/lx2160a-rdb: add secure
 boot support
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When NXP secure boot is enabled, use the signed BL2 and DDR FIP
(bl2_sd_sec.pbl, ddr_fip_sec.bin) in the SD card image, add the hash
of the mbed TLS archive needed for X.509 and document the secure boot
build in the readme.

Signed-off-by: Leo Denieul <leo.denieul.yoshino@gmail.com>
---
 .../arm-trusted-firmware.hash                 |  2 ++
 board/freescale/lx2160a-rdb/post-build.sh     |  6 ++++
 board/freescale/lx2160a-rdb/readme.txt        | 34 +++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 367a03c1ce..24c30057e3 100644
--- a/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,4 @@
 # Locally computed
 sha256  b807d8bf190b7c46b4260729b4bbe2f7df83cd1086edcb181d66595ae6598d23  arm-trusted-firmware-v2.15.0-git4.tar.gz
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.7:
+sha256  a7e8bcbec0e6f761b4af24f25677626b35f762f68eef79c08677a363212d11f6  mbedtls-3.6.7.tar.bz2
diff --git a/board/freescale/lx2160a-rdb/post-build.sh b/board/freescale/lx2160a-rdb/post-build.sh
index 4042bf9c7e..b5d7c12ba6 100755
--- a/board/freescale/lx2160a-rdb/post-build.sh
+++ b/board/freescale/lx2160a-rdb/post-build.sh
@@ -9,3 +9,9 @@ ln -sf dpc-usxgmii.dtb "$TARGET_DIR/boot/dpc.dtb"
 ln -sf dpl-eth.19.dtb "$TARGET_DIR/boot/dpl.dtb"
 sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
 sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
+
+if grep -q "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT=y" "$BR2_CONFIG"; then
+    sed -i -e 's/"bl2_sd.pbl"/"bl2_sd_sec.pbl"/' \
+        -e 's/"fip_ddr.bin"/"ddr_fip_sec.bin"/' \
+        "$BINARIES_DIR/genimage.cfg"
+fi
diff --git a/board/freescale/lx2160a-rdb/readme.txt b/board/freescale/lx2160a-rdb/readme.txt
index f0c03a5958..90a5964ab1 100644
--- a/board/freescale/lx2160a-rdb/readme.txt
+++ b/board/freescale/lx2160a-rdb/readme.txt
@@ -39,6 +39,40 @@ board/freescale/lx2160ardb/readme.txt.
 For details about the medium image layout, see the definition in
 board/freescale/lx2160a-rdb/genimage.cfg.
 
+Secure boot
+===========
+
+With BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT=y, TF-A signs the
+boot images with the NXP Code Signing Tool (host-qoriq-cst):
+  - the PBI and BL2 get a CSF header signed with the SRK key; the
+    BootROM checks it against the SRKH fuses;
+  - BL31, BL33 and the DDR PHY firmware get X.509 certificates; BL2
+    checks them against the ROT key hash embedded in BL2.
+
+Set the images to install:
+
+  BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd_sec.pbl ddr_fip_sec.bin"
+
+Set the keys to use:
+  - BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_KEYS_DIR: directory
+    containing srk.pri and srk.pub;
+  - BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_X509_KEYS_DIR:
+    directory containing rot.pem, trusted_world.pem,
+    non_trusted_world.pem, bl31.pem, bl33.pem and ddr.pem.
+
+If these directories are empty, development keys are generated in the
+TF-A build directory. For the CSF headers, custom CST input files can
+be used instead of the SRK keys directory.
+
+The post-build script then puts the signed images in sdcard.img.
+
+When changing any of these options, rebuild TF-A from scratch:
+
+  make arm-trusted-firmware-dirclean && make
+
+While the ITS fuse is not blown, a BootROM authentication failure is not
+fatal: the board still boots, with the SNVS in Non-Secure state.
+
 Known limitations
 =================
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
