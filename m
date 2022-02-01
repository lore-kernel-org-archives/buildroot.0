Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5EFC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 09:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 299B9409A0;
	Tue,  1 Feb 2022 09:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w6VRKxFXTrAA; Tue,  1 Feb 2022 09:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D47F40992;
	Tue,  1 Feb 2022 09:13:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC8F1BF28A
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 09:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1872140571
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 09:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1zTFWAwuO0x for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 09:13:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B57E5415A1
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 09:13:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s9so30571867wrb.6
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 01:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rPFQbD4CUaPFl6HCBiqH804H6DpeMvyMV2GhkgqDb6Q=;
 b=Qlyiv7TfIoZf02pJ3uuGP8ZTyJ379ELBME9c7lAM/12llyM1q356vPgM1s7Cf1XHwU
 1V7usNr7A0J7Hs1TNIf5+eXmzN9upvMsAgxPzkhHvhJ1jGbZL69cKWiwzE7/JMODTdr0
 J5gff3i/gFd+i0/jex4QCOTQKSdSR/8KUjJZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rPFQbD4CUaPFl6HCBiqH804H6DpeMvyMV2GhkgqDb6Q=;
 b=m8mEfP6etHO5b/dcji5TGQiGbs/q79f5jYFZCfvb4w4P3SPsoAC+FV3vD4dCxqlmSt
 tbzE42EAqtnTbFwRrVz5y+94r6WZi/+TaAiwci115PkMeHSVAbZ4QGJLFbP03skh7sfi
 zdDY6Hmh7FIT/1ikveufB/M+QtSlY8M9RaRPDJPsC4z1mOmuZ7vVrnoeu0b7sTG22PpB
 ZQT6AYN6ZIAQsLs62XFvOIMVW++mDcgt8t3WLF6hmaAq+4uzaEhP6T9sUHDatWpmNw2G
 7VfhwUo21HKPb00Ra7Qj5GqjT44+Tt8M3r5f2eAWmsnmDMLAnhGVdiXKgw6ZWWZ9/8rQ
 JBBQ==
X-Gm-Message-State: AOAM530PTgKWslu9Hw4MZt6li+fHUHityalL1gYRuqOup5AAXxc9CI9L
 Zfb+UJvi5kiTwJv0ULyy+7+MDcJCr65oWw==
X-Google-Smtp-Source: ABdhPJzOzepR9kSvHF9fxI0FlUuXNeoQy5gICyswmyfRHk6cc8a+ASjby5uy2Vg2GLLtn/cLsF4W0A==
X-Received: by 2002:a05:6000:2a5:: with SMTP id
 l5mr15057129wry.394.1643706825717; 
 Tue, 01 Feb 2022 01:13:45 -0800 (PST)
Received: from localhost.localdomain ([62.18.234.10])
 by smtp.gmail.com with ESMTPSA id h11sm1446531wmb.12.2022.02.01.01.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 01:13:45 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	buildroot@buildroot.org
Date: Tue,  1 Feb 2022 10:13:42 +0100
Message-Id: <20220201091342.143010-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/uboot: add support for bundling TEE in BIN
 format into U-Boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some U-Boot platforms (e.g. nxp) can bundle OPTEE's tee.bin
into the U-Boot image using binman. This patch brings the necessary changes to
enable this feature.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 boot/uboot/Config.in | 12 ++++++++++++
 boot/uboot/uboot.mk  | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c630fc6552..117bbd3faf 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -237,6 +237,18 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 	  U-Boot. This option makes sure optee-os gets built prior to
 	  U-Boot, and that the TEE variable pointing to OPTEE's
 	  tee.elf, is passed during the Buildroot build.
+choice
+	prompt "U-Boot OPTEE BL32 format"
+	default BR2_TARGET_UBOOT_NEEDS_OPTEE_BIN
+	depends on BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
+
+config BR2_TARGET_UBOOT_NEEDS_OPTEE_BIN
+	bool "tee.bin"
+
+config BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF
+	bool "tee.elf"
+
+endchoice
 
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 574fc7089a..210fa219ed 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -177,7 +177,19 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
 UBOOT_DEPENDENCIES += optee-os
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF),y)
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
+define UBOOT_COPY_TEE_FIRMWARE
+	cp $(BINARIES_DIR)/tee.elf $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
+else
+UBOOT_MAKE_OPTS += BL32=$(BINARIES_DIR)/tee.bin
+define UBOOT_COPY_TEE_FIRMWARE
+	cp $(BINARIES_DIR)/tee-raw.bin $(@D)/tee.bin
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
+endif
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
