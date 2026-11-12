Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC8F606A327
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TMEdyM80;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIivL5Tx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3885D81180;
	Thu, 12 Nov 2026 09:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyHUyT8XJbxb; Thu, 12 Nov 2026 09:39:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2846F816E3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794476367;
	b=iuKY1R85TDAr467p7pEWjcz/xlTYsOK4mC9q8+KMvVsUMGfLT1a9FmoQgqS5nsuQZbGT
	 3Pt2IK6b/pngWlt7+YF6XPVINCmcyoIm19vpSHPqquIoYdtUo4lDpd3qT0cDPjSpK453O
	 jGMMDlXkLLgxNhfsEnmn0ElWWEwUZ9murfYn7R9C3fsr1//yZlILo1wJz4HOF/roMvnfQ
	 wpAXoDb2Flh1BKjGyDC2vY+9JWT9gOozYknGhpIyJu3nKFJ5hqFO25OtVqzx3GbigXrsd
	 Bx4vLHWJl4MUzCJ22YgM0aMmn+db8ksaGnZCScmWyP2FX7uH3b24HIITnmVxG4CmH0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794476367;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3AbelwDRxp3o45z0sIVy0hh22sokBBVrhidz0SHI5Ms=;
	b=r9n4byFWoZNGRAeboJhI8+WdlFHSihe310O8KAbQDGbgfOvJnM89VRh6uXFfYm8TBaCY
	 E2/z7d4N4fZ9vWrxfP3FsGA3pjQRovnUTmDvqJlP8Rcx57mLl2JznvuhUWM7LoI5jKhFz
	 CNuLwHVrXE33gc8Rv+NCh9Ahlg9Pqz1BXsMZC1EOTACzs+S+y2ON6OQwLuI6XLZCgO1M9
	 V0PPuthIbXnypGThxtASwG3W10dVvzl0hyh/hdq+XdUlBZQv2K7CRllYj3FqpHoPka5pB
	 h7wWX+kO4nrKZwqSwwTRrcGBKVVot3L8jcU6VoNPDUpp/NZQkzfIBwyR3fX8sKw8rYw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794476367;
	bh=3AbelwDRxp3o45z0sIVy0hh22sokBBVrhidz0SHI5Ms=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMEdyM80kN46VJYt/1jZiLV6kbLE9dpMtrNkMnN3Cpr9TT6V86wozDe5GEEpkMXjW
	 esl/sWaKiRDXZL/hKlCqj0jt/sGQeNZBMCKlOrkI0tWqYYlkD5pERuVLYNnZcdUI8m
	 NoW4yzMYB9NEaveDeAzskEBHj0vrwtN24Ei9QbpBqcfivB9e/u+zhjjl+pAXrCSxJp
	 wOFCtgOCENWnNDYwCREvxGXv2wf3kvRd9QJ36g7xK+7HZ5fud5DSDI5+O94oxr4kSW
	 eIAfYP8MZGrdn3XFZN/rG3N75YMb2QVJgCHy0fLcPXpxd2NaGjjyLA2ELGsNmb2LD+
	 NtRLqxxrByWgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2846F816E3;
	Thu, 12 Nov 2026 09:39:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EE20E09
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 09:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 403DF40A32
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 09:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_NrMx6PYQec for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 09:39:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0FF1D409FA
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=VIivL5Tx
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FF1D409FA
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 09:39:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-492690dd5daso3252025f8f.1
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 01:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794476361; x=1795081161; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uHkSWS6GYQC0Sra0KoxpNltm4Piwmm1vWl4I410JRIA=;
 b=VIivL5Tx2mSyzXtczvDZLCEO/2g4wDffgCt2X2EdegT+l9D2UJje6H9lbVuPVpf4XL
 HFospxjTnt9EZ8uhbutaRYOisLLQs1smuraSiL1gtiEfiAUWfcJn/kB72tjuA7J2hxRW
 mUNlhToU867QzgMhCzh+Wt3Si57CC7FVkpnGVdHNbCT0ZPSAeqEw0EQJYCvTxokZg0gy
 jfh+u9Tq2GoHPBTeBHJEJ0Fi7O/vE9BH1GPjVqNZ2dDp7W1uj+xreJGDEegZH1BWy/sp
 ObdyvtkhTO+7gcDz+O5WY73lLnzpAf/y5pues4YmeBo+f7wFmntSMS66VIhjNQ+/MwWm
 VzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794476361; x=1795081161;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uHkSWS6GYQC0Sra0KoxpNltm4Piwmm1vWl4I410JRIA=;
 b=GRgfA1lb26Wh82kE3z00TtNIPQUNml4MiBLcQKG/0qpEr3s6EvQBHL+r9HgcufZ+K2
 NR6mMhLtRt9nFOuwKvxfUEK/cPp5Q8T/+HFHyKo0Pc8wTWy6SfH7GIoQSCgaf74o6Y+M
 rFxjYtCCWSbvC9V1ZJtNGuhkuntXERxPUx5IhiVkLAaH/dUqWoBLTdSwnSU2S5dtsH5D
 dKkbnJefBUvVZ3QAAJo2ap7ZWH/+D+OZTJlOQP1JiApVLyeHE161NlpjfjmzFrR/8CG/
 mt6ghSGYL0qKEYnE+bjBiaPWMWwDVUdqJwMNbYW+evYx08D0S/wvmJrfLlBKUcslc3H4
 KHEA==
X-Gm-Message-State: APuU4Z9u8Xf34oHp+dv3BkKIsO9toRO0pyO7oU/Vo/1XUm5Z3R2YffOB
 YP97hbiXsTZUCFOiWTNncXTMFL5bkOU46WbDBg6hkW5JUtvCEx7vVd42lVq3Wg==
X-Gm-Gg: AYBFou19fs7Idoz3rGyitqo2Bv/o14pR1EIAtpITaXaO09t/uxbUpJkvRHK3z9T49/o
 Q7YUap8rm6inf9htoKsFlMzWGrV+wDWcQ47+cdchOJYE0qw/dZH6vn0AUezCRead5GS2r4HSIF6
 S2AAySeqvSGlZEjFu7+AlsZT68r1g8DWwCNUsKBhDKEnoa5GOWtQys/StNuLa5SK0Ne3ytiR99S
 lD7ADdZ0lU0qE5GF7XbKK/zUHQreZNjyuqc+VDU7qkDv72sJ15tyNz+K7Tg+ecSksYCIE86X84D
 eYFA+UoX+XwVMMRS9krUuzbt1WKaNYIPCxyhvxzoQAwMznCkdOvHbZ7NQXjh7qOyTyhaIIlTnUh
 /e+WP3Iv1HCvoHzmQY7aaIZgib7+ZujLQqxVwq81FXFF/8iPIAjXXIcOXRJ2o4IbOBFKubO3LcE
 Tyititm+8uRUDj8RHFojZ3V2QlPYWPNMP7mN1F3jS0Q03Lx/3jHD8GNewnOFlXiXwkqrUt0jODM
 3PYPgPjwpcqvLXAYFVoBZjUvGxMeOTZu+6YD9Z0UHVs2ULSxCXrP8T5pQs+VoUUxO5sOD6DkxXD
 Ohn7A4J49fuiSsCzCIiNknfBvYGBI1XjqQglJ86JtH8wMiF87abPCh7F7NZNcesgCxFtzjyd0l7
 ztGQ8D7anfTsSpFaTSuErL7Tk+0R93qvE6lMz2j0uy+w=
X-Received: by 2002:a05:6000:2203:b0:488:7df9:3898 with SMTP id
 ffacd0b85a97d-499caa40bfamr8576831f8f.56.1794476360971; 
 Thu, 12 Nov 2026 01:39:20 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498365cbbe5sm17494063f8f.42.2026.11.12.01.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 01:39:20 -0800 (PST)
Date: Thu, 12 Nov 2026 10:39:19 +0100
From: Leo Denieul <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <678dad354c159cdfb564c7b19dd3531ac6e6fc05.1794475724.git.leo.denieul.yoshino@gmail.com>
References: <cover.1794475724.git.leo.denieul.yoshino@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1794475724.git.leo.denieul.yoshino@gmail.com>
Subject: [Buildroot] [PATCH 1/2] boot/arm-trusted-firmware: add NXP
 Layerscape secure boot support
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add options to build signed boot images for NXP Layerscape SoCs with
the NXP Code Signing Tool (host-qoriq-cst), as done by NXP flexbuild:
the PBI and BL2 get a CSF header signed with the SRK key, checked by
the BootROM against the SRKH fuses, and BL31, BL33 and the DDR PHY
firmware get X.509 certificates checked by BL2.

With TF-A versions that build the mbed TLS sources with their own
CFLAGS (e.g. NXP lf-6.12.34-2.1.0, used by
freescale_lx2160ardb_defconfig), mbed TLS 3.6 fails to build:

  mbedtls/include/psa/crypto.h:122:29: error: redundant redeclaration
  of 'psa_key_attributes_init' [-Werror=redundant-decls]

as psa/crypto.h redeclares functions already defined static inline in
psa/crypto_struct.h. Add -Wno-error=redundant-decls when X.509 is
enabled. Recent TF-A versions build mbed TLS through CMake and are not
affected.

Signed-off-by: Leo Denieul <leo.denieul.yoshino@gmail.com>
---
 boot/arm-trusted-firmware/Config.in           | 75 +++++++++++++++++++
 .../arm-trusted-firmware.mk                   | 63 ++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 70fdec5c2a..084af08792 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -300,4 +300,79 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL
 	default "strong"  if BR2_SSP_STRONG
 	default "all"     if BR2_SSP_ALL
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT
+	bool "NXP Layerscape secure boot"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
+	select BR2_PACKAGE_HOST_QORIQ_CST
+	help
+	  Sign the boot images with the NXP Code Signing Tool
+	  (TRUSTED_BOARD_BOOT=1).
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT
+
+choice
+	prompt "Signature format"
+	help
+	  Format used to sign the BL31, BL33 and DDR images. BL2 and
+	  the PBI are always signed by CST with the SRK keys, whatever
+	  the format.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_X509
+	bool "X.509"
+	help
+	  Sign BL31, BL33 and DDR images with X.509 certificates
+	  (TF-A NXP_TBBR_USE_X509=1, GENERATE_COT=1, mbed TLS).
+
+endchoice
+
+choice
+	prompt "CST input files"
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_CST_INPUT_FROM_KEYS
+	bool "Generate from SRK keys"
+	help
+	  Use the TF-A default input files with the SRK keys below.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_CST_INPUT_CUSTOM
+	bool "Custom input files (advanced)"
+	help
+	  Use your own input files instead of the TF-A defaults.
+
+endchoice
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_CST_INPUT_FROM_KEYS
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_KEYS_DIR
+	string "SRK keys directory"
+	help
+	  Absolute path to the directory containing the SRK key pair,
+	  srk.pub and srk.pri, as generated by the gen_keys tool of
+	  qoriq-cst. If empty, TF-A generates a new development SRK
+	  key pair in its build directory and images are signed with
+	  them.
+endif
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_CST_INPUT_CUSTOM
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_CST_INPUT_DIR
+	string "Custom CST input files directory"
+	help
+	  Directory with input files named as in TF-A, e.g.
+	  input_pbi_ch3_2, input_bl2_ch3_2 and input_blx_ch3.
+
+endif
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_X509
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_X509_KEYS_DIR
+	string "X.509 keys directory"
+	help
+	  Directory with rot.pem, trusted_world.pem,
+	  non_trusted_world.pem, bl31.pem, bl33.pem and ddr.pem.
+	  If empty, TF-A generates automatically new keys at each build.
+
+endif
+
+endif
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 2aaa7e3d19..b711d673c2 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -243,4 +243,67 @@ endif
 
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT),y)
+ARM_TRUSTED_FIRMWARE_NXP_KEYS_DIR = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_KEYS_DIR))
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-qoriq-cst
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += TRUSTED_BOARD_BOOT=1 CST_DIR=$(HOST_DIR)/bin/cst
+
+ifeq ($(BR2_PACKAGE_QORIQ_DDR_PHY_BINARY),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += qoriq-ddr-phy-binary
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += DDR_PHY_BIN_PATH=$(QORIQ_DDR_PHY_BINARY_DIR)/lx2160a
+define ARM_TRUSTED_FIRMWARE_BUILD_FIP_DDR
+	$(ARM_TRUSTED_FIRMWARE_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) fip_ddr
+endef
+ARM_TRUSTED_FIRMWARE_POST_BUILD_HOOKS += ARM_TRUSTED_FIRMWARE_BUILD_FIP_DDR
+endif
+
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_CST_INPUT_FROM_KEYS),y)
+ifneq ($(ARM_TRUSTED_FIRMWARE_NXP_KEYS_DIR),)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	SRK_PRI_KEY=$(ARM_TRUSTED_FIRMWARE_NXP_KEYS_DIR)/srk.pri \
+	SRK_PUB_KEY=$(ARM_TRUSTED_FIRMWARE_NXP_KEYS_DIR)/srk.pub
+endif
+endif
+
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_X509),y)
+ARM_TRUSTED_FIRMWARE_EXTRA_DOWNLOADS += $(MBEDTLS_SITE)/$(MBEDTLS_SOURCE)
+define ARM_TRUSTED_FIRMWARE_EXTRACT_MBEDTLS
+	mkdir -p $(@D)/mbedtls
+	$(call suitable-extractor,$(MBEDTLS_SOURCE)) \
+	$(ARM_TRUSTED_FIRMWARE_DL_DIR)/$(MBEDTLS_SOURCE) | \
+	$(TAR) --strip-components=1 -C $(@D)/mbedtls $(TAR_OPTIONS) -
+endef
+ARM_TRUSTED_FIRMWARE_POST_EXTRACT_HOOKS += ARM_TRUSTED_FIRMWARE_EXTRACT_MBEDTLS
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += GENERATE_COT=1 NXP_TBBR_USE_X509=1 MBEDTLS_DIR=$(@D)/mbedtls
+
+ARM_TRUSTED_FIRMWARE_NXP_X509_KEYS_DIR = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_X509_KEYS_DIR))
+ifneq ($(ARM_TRUSTED_FIRMWARE_NXP_X509_KEYS_DIR),)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	ROT_KEY=$(ARM_TRUSTED_FIRMWARE_NXP_X509_KEYS_DIR)/rot.pem \
+	TRUSTED_WORLD_KEY=$(ARM_TRUSTED_FIRMWARE_NXP_X509_KEYS_DIR)/trusted_world.pem \
+	NON_TRUSTED_WORLD_KEY=$(ARM_TRUSTED_FIRMWARE_NXP_X509_KEYS_DIR)/non_trusted_world.pem \
+	BL31_KEY=$(ARM_TRUSTED_FIRMWARE_NXP_X509_KEYS_DIR)/bl31.pem \
+	BL33_KEY=$(ARM_TRUSTED_FIRMWARE_NXP_X509_KEYS_DIR)/bl33.pem \
+	DDR_KEY=$(ARM_TRUSTED_FIRMWARE_NXP_X509_KEYS_DIR)/ddr.pem
+endif
+
+endif
+
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_CST_INPUT_CUSTOM),y)
+ARM_TRUSTED_FIRMWARE_NXP_CST_INPUT_DIR = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_CST_INPUT_DIR))
+ifeq ($(BR_BUILDING),y)
+ifeq ($(ARM_TRUSTED_FIRMWARE_NXP_CST_INPUT_DIR),)
+$(error No CST input files directory set, check BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_CST_INPUT_DIR)
+endif
+endif
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL2_INPUT_FILE=$(ARM_TRUSTED_FIRMWARE_NXP_CST_INPUT_DIR)/input_bl2_ch3_2 \
+	PBI_INPUT_FILE=$(ARM_TRUSTED_FIRMWARE_NXP_CST_INPUT_DIR)/input_pbi_ch3_2 \
+	BL31_INPUT_FILE=$(ARM_TRUSTED_FIRMWARE_NXP_CST_INPUT_DIR)/input_blx_ch3 \
+	BL33_INPUT_FILE=$(ARM_TRUSTED_FIRMWARE_NXP_CST_INPUT_DIR)/input_blx_ch3 \
+	DDR_INPUT_FILE=$(ARM_TRUSTED_FIRMWARE_NXP_CST_INPUT_DIR)/input_blx_ch3
+endif
+
+endif
+
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
