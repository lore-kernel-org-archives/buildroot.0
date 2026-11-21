Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8E606A33C
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 22:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TiAgk5Tl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BH/o49GF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D0DE60621;
	Sat, 21 Nov 2026 22:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Za3IG_b_55CE; Sat, 21 Nov 2026 22:23:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 71F4760628
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795299799;
	b=Y9xPp4QaBwoFoqpbp2bsa1UfJPQ7iv8sTrPkwFxbzyY9MSeNy9tJijcY5sBowj7pdxDx
	 GxReLpEA6CaG3G7sv7EIc3i3s7Y1G4/Isy/EQoR9gclEZvxv1xp12FtiXECUrNCI2fd5U
	 lUsglHtfXU7otDRBpVvKiPBdC6LRW2Xp6+s/UzARWO/0Lpjgo2bIYsozc5KoT3ywNk8kN
	 iRvvkawbKHFSRBFXkT/RZ/gmeeMDGlkfQ4RA99FKOi6k9PqII/RO8kB45mzOU1HOCEAur
	 SV9qcqDGekyhe6IwMI4j9v+k1e7CNa0q7rvn4YcdvX3hZHFF9+Jpyzn6RnR5y/4AEMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795299799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=JtJEiuDaupYn0x1KFF8DerhO42nCC/tUtvMwzjcXsL8=;
	b=gVKpWcDu+K+IfzCQdvYM889leWvkmJbMgBvo/mzhM847c5wPWaHNadIsmo2hrELi6cRU
	 HEngLzamArDMsvr4R/S92p6JducUwoCpgfR+FIBf3qWBPVrAlDZTFgjE0eJwvmeyrTu/V
	 jVYQ7TrG3lVGkF2sLmLZKOYZJHz+gcQgP5lINQ1Y9SBvCBdMLrhjm7V4BPI0Sf8y8knhL
	 FSzPBxs3Va4ZEquHBr2oRYrxqTCf91MYTrwTOGZv0lum8gw2UreQKmbGiVtemJ2p52pHv
	 zDDKMATxKTkyX1QT+f8TRbWK2RlU06qxouplcXJ8WDWUJkgegR89bcpAEaytFeBssGw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BH/o49GF";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795299799;
	bh=JtJEiuDaupYn0x1KFF8DerhO42nCC/tUtvMwzjcXsL8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TiAgk5TlKGELoDJRiQUjbo0COKA4uRLO17UVCjtkcVrvb9eQp1vRLZIy+oLhbpu1r
	 OYae057Bn2HNInGEHT2QdkIshCVIOps477VseiP2y4FXsXhXrPr2AQrSavTkvXTGhp
	 vLMAP13s2fpV3z45aCBS9yZJJ0TMw7C7782lygiSVDovA6SgFQYAyc6MWA4VHLPhL9
	 ZCNAcqbM1GSvhjZUgIuqmMDZSlJ7NtE6ER3FjFsZMqovQksjKQzpr1/NqO7He+QLjZ
	 KwylYbA0oOCN4H0BFa1S3t3Ch3kghTP3qwIWqa4ctNnJFHyJ2I2WIhS3rIrbysbP9U
	 rJAYffszvOB/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F4760628;
	Sat, 21 Nov 2026 22:23:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9FE6310
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F74360628
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTtM-uDpskRW for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 22:23:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3957D60621
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=BH/o49GF
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3957D60621
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:23:14 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so15367625e9.2
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 14:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795299793; x=1795904593; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DGBYGSwH5dlIgNdBZ8BaX+Ar8TEjDYNVc9gwUSI8nuU=;
 b=BH/o49GFpYBAOCeOaQsyL/paRgLKOHPcAdx9fBd0gEWtHbbXqg5zjA5yFonwafNnzg
 ++KvwnKO7LlJWr2GNQOMLj8euSfarUm8zLqQe/VB/3Ku7qvK3RuTxayRO7VJ211O+/wO
 uBpHGRM+wNX5RdQyErDUCWiVbQnhar/+RL3MPylc4BdGLlRb/XCpUKoC3mjEo+fhIyke
 pP4arOQLZnnysCI3PjjLPqe3DWBDSX0KCs+AbbgwZPgL009zfxmlEwzPqCAiThCQd1Y2
 cUzlddTckVSX0vsSQsAoOLCfYEoJDnlta8iEi+eT2zdPYLmZ7WF7agaXq2T3ht+XiLIV
 VtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795299793; x=1795904593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DGBYGSwH5dlIgNdBZ8BaX+Ar8TEjDYNVc9gwUSI8nuU=;
 b=e3E96wbtVumPsPm6nd0OH5+yRnbgZHMDE1vDcyK3is430P5YxgErt3J6yKYBepvjWu
 0RcjXniF48aO8lkP+bztiQ5PoCEu3sxJp7yP9v6cX3MOE2oU6dBJqkkgxZ2TCvVdiy+d
 XuqXmPsXpMDtbzXkbD3z04VMXS3YTtyCXas/XRemHhPJfQ63HokwCIlWKq8t34t0XGj3
 XHazmWiOnFOcoSTcPrQ8t7YkY62EBduiwTzW0F5zw0nPySe1CfYTH0f9wCaLpUWbAJcF
 qSKWTCae76Acd26xRxlrJdyEDbDRCs2j7Fdf74qc/cg0/EhDYiBPyLnMpp9zv64uH8pw
 I/Qg==
X-Gm-Message-State: APuU4Z/7Nwe2NON1FKdhGsr0eyPBp57WGbKRbesAs7+/+/ojE78tyvq3
 Kt4M9vuzHDjbeg8RxAvxdDgZZ0VWkA2Z3NzDEUmzFxZN/Msv/tJSIsRFA2GZeOHk
X-Gm-Gg: AZFdTZdbDE9bAD2sYx5U3JHV/RzAw4mYt8HYfHXnWXWR8114W21NmRmNJHKLx3kwqj7
 B+MM4T0GOqpnjebXFm4e3AjXslazuaVXMPIkuS99zfNvj7/MIipq68LtxGL2wKNj1If/076pbA8
 j4KnJOdY/rzHpyxoHh7P1VwNHRbwHzmH/Ooqa7kN5J12ne7StHecQ8bJu26V/MjVA/ObdALx1Zu
 UIa5VWhvN4JU7QpTznlBZvP3IKwc1wchs/Mwr+1Ua06PIe9G8FYPILdLvRrOvCH/c9NbdZIdcWT
 mTLSxZRmiYhwhQq5aYPWRRyrdkpG+MtqxrB8k7ZWemlHmLYMJ7c5xCnoDtQcg49I/1w4YgGYi1F
 MNwW3j0spePzz//84qK3RtFE3Z2nwxqOZVll2hXPCx+fxdfNXccRZMZKU4hRsdGT8ND2sUr2/XV
 79ro5FFGjrPmL0+ECyn3g2PaMjQRF/MsE0YMSVNJ1w+kppmO4GtSo2i/mmAhFOTzLtJx8eorf1i
 LnK1iXKI0H1/IQDtoMgKYpY1aDO2jfcJ3FagdLqSujuubzb8XZJ+x7Zi8SofxUWIiPzbhTFN28/
 GDpavX60pIyuzkJR3YcDaqbsPo4qIlE7XuK+s383GPx2hiijg0g=
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id
 5b1f17b1804b1-4bb88807909mr165445175e9.5.1795299792864; 
 Sat, 21 Nov 2026 14:23:12 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b8429sm325310145e9.14.2026.11.21.14.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 14:23:12 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Laurent Badel <laurentbadel@eaton.com>
Date: Sat, 21 Nov 2026 23:23:10 +0100
Message-ID: <20261121222310.213127-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121222310.213127-1-angelo.compagnucci@gmail.com>
References: <20240206125833.10103-1-laurentbadel@eaton.com>
 <20261121222310.213127-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] boot/mxs-bootlets: add support for
 zImage with appended DTB
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

From: Laurent Badel <laurentbadel@eaton.com>

When building a zImage with appended DTBs, buildroot creates copies of
the zImage named zImage.$(LINUX_DTS_NAME). mxs-bootlets.mk does not
take this into consideration and passes only the original zImage
(without DTB appended) to elftosb to generate the SB file. Thus,
make sure that the correct zImage files are used in this process.

Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - rebase on the new patch 1/2
  - use the DTS name without its directory, as linux.mk does for the
    zImage.<dts> copies: in-tree DTS names now have a vendor directory
    (e.g. nxp/mxs/imx28-evk), so v2 looked for a missing file
  - set MXS_BOOTLETS_BOOTSTREAM_EXTS in a single ifeq/else, to fix the
    check-package "conditional override" warning
  - drop the indent and trailing whitespace reported by check-package
  - strip only the trailing .sb, with patsubst

Supersedes v2: https://patchwork.buildroot.org/project/buildroot/patch/20240206125833.10103-1-laurentbadel@eaton.com/

 boot/mxs-bootlets/mxs-bootlets.mk | 36 ++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index eb396da723..3c481c3595 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -45,20 +45,27 @@ MXS_BOOTLETS_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	CC="$(TARGET_CC) -std=gnu89 -fno-stack-protector"
 
+# With an appended DTB, build one bootstream per zImage.<dts> copy
+ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX)$(BR2_LINUX_KERNEL_APPENDED_DTB),yy)
+MXS_BOOTLETS_BOOTSTREAM_EXTS = $(foreach dts_name,$(LINUX_DTS_NAME),.$(notdir $(dts_name)).sb)
+else
+MXS_BOOTLETS_BOOTSTREAM_EXTS = .sb
+endif
+
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
 MXS_BOOTLETS_DEPENDENCIES += barebox
 MXS_BOOTLETS_BOOTDESC = barebox$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASENAME = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX)
 
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
 MXS_BOOTLETS_DEPENDENCIES += linux
 MXS_BOOTLETS_BOOTDESC = linux$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASENAME = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX)
 
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
 MXS_BOOTLETS_DEPENDENCIES += uboot
 MXS_BOOTLETS_BOOTDESC = uboot$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASENAME = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX)
 endif
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
@@ -71,9 +78,13 @@ ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
 define MXS_BOOTLETS_BUILD_LINUX_PREP
 	$(MAKE1) $(MXS_BOOTLETS_MAKE_OPTS) -C $(@D) linux_prep
 endef
+
 define MXS_BOOTLETS_SED_LINUX
 	sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
-	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+endef
+
+define MXS_BOOTLETS_SED_ZIMAGE
+	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage$(1)";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
 endef
 endif
 
@@ -89,6 +100,12 @@ endef
 
 MXS_BOOTLETS_POST_EXTRACT_HOOKS += MXS_BOOTLETS_INSTALL_BAREBOX_BOOTDESC
 
+define MXS_BOOTLETS_ELFTOSB_CMD
+	$(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
+	-z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
+	-o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASENAME)$(1)
+endef
+
 define MXS_BOOTLETS_BUILD_CMDS
 	$(MAKE1) $(MXS_BOOTLETS_MAKE_OPTS) -C $(@D) power_prep
 	$(MAKE1) $(MXS_BOOTLETS_MAKE_OPTS) -C $(@D) boot_prep
@@ -98,13 +115,16 @@ define MXS_BOOTLETS_BUILD_CMDS
 	$(MXS_BOOTLETS_SED_BAREBOX)
 	$(MXS_BOOTLETS_SED_LINUX)
 	$(MXS_BOOTLETS_SED_UBOOT)
-	$(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
-		-z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
-		-o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM)
+	$(foreach ext, $(MXS_BOOTLETS_BOOTSTREAM_EXTS),
+		$(call MXS_BOOTLETS_SED_ZIMAGE,$(patsubst %.sb,%,$(ext)))
+		$(call MXS_BOOTLETS_ELFTOSB_CMD,$(ext))
+	)
 endef
 
 define MXS_BOOTLETS_INSTALL_TARGET_CMDS
-	cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM) $(BINARIES_DIR)/
+	$(foreach ext, $(MXS_BOOTLETS_BOOTSTREAM_EXTS),
+		cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASENAME)$(ext) $(BINARIES_DIR)/
+	)
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
