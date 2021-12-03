Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BADDC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 18:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 390E4832EA;
	Fri,  3 Dec 2021 18:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30ADXCm8_rDZ; Fri,  3 Dec 2021 18:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 515E8831C1;
	Fri,  3 Dec 2021 18:51:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5E251BF3CC
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 18:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C302B4099B
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 18:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4N3s4rTEKHB for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 18:51:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38CD840999
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 18:51:17 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so5842980pjb.5
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 10:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3h7BT8I1+YEQfGHp904c7x9u68/7IQDuIN2HwCqshw8=;
 b=bOSPwwgXL7npDKx1vmtvOwaSei5oz2JYqcb5xaUqgqT/t55BHjA6cIxo+Yr36kqk7l
 ePBs7BqhuBthAdYIvsSHy00ZIGNA9JD41SiTIkaUm6K2E9tJHszcnvyL5+vT2PjxlJwf
 zNo/KkuwhDbkB5+lVFrfm0oCfnnvVrRscSmouoNJpXjOGib3QEdFxiJoGI5ts51AaD1t
 QYxjvq621hxoCMAUkUPh8YOqTsI6BaDyUycKynVfoBiwj8ZD1OTlsqLI0RWAVgvVxEs5
 sZqmnVYYLWvseLGblMZ0q6metaG5aUdlao8iUlQJxkP3OyIEBEeeyHjAKYDqN5veLIAQ
 Y0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3h7BT8I1+YEQfGHp904c7x9u68/7IQDuIN2HwCqshw8=;
 b=bupk/8BBmwnC7FGxuMc/S3Ku/QpaO8wGfjeVoS3HsQIi4UjAHXqPqtI93LQy5tcPGT
 2COCqPNQQaydcJ/1Ml7kaDAjuz1Gcjqehmuw/Yy1+g0HYQ+TqU9uaDbl0GicyK6KlG/o
 bvgXfR2Fsj6BCo5mZxlHs4Af7hbun1XQ/xN2LNF++9z91g9nAfg8c45RioYkWU5gerDG
 uxs2RmK78kvtSdGakxHjo7UD/EaEcqoC8CfQCrJNN/WSVQP9x9waogeSeZRE8Va3u4eG
 ZH5mvl+n6OTnDUWPA3ukQRDobt5eKrYpTcHgu+zxs6ScRiKnRlZEALDWVQfntJ5V4327
 rHNg==
X-Gm-Message-State: AOAM531Xcw95HpWoFBacYYjg2fJEOecew2Dik6ldXdCyrfNig8oKLwUN
 q+QfgsknJDrzNjShAV59ZgrdJf0ZJLJ6HQ==
X-Google-Smtp-Source: ABdhPJxwAqDGCUljmeNjbRCPDhk/wWOrS8hKiOp2ksWNvxyXKb9hZQIXliLFO1jQVjHUUOdJ+MOIwQ==
X-Received: by 2002:a17:902:b7c8:b0:141:9ddb:33e7 with SMTP id
 v8-20020a170902b7c800b001419ddb33e7mr24744697plz.60.1638557476312; 
 Fri, 03 Dec 2021 10:51:16 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id v15sm4505215pfu.195.2021.12.03.10.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 10:51:15 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 10:51:06 -0800
Message-Id: <20211203185106.1196187-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203185106.1196187-1-aduskett@gmail.com>
References: <20211203185106.1196187-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 2/2] package/mender-grubenv: fix grub module
 checks
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b68810e70cbd (boot/grub2: add support to build multiple Grub2
configurations in the same build) broke mender-grubenv by splititng up
BR2_TARGET_GRUB2_BUILTIN_MODULES into two separate symbols, one for legacy
boot and one for EFI boot.

This change causes a systematic build failure now, as the legacy variable
BR2_TARGET_GRUB2_BUILTIN_MODULES is now always empty (during build). We fix
that by supplicating the missing modules to check: one for EFI and one for
legacy boot.

The EFI check is tricky: Indeed, there can be more than one EFI platform
enabled simultaneously; indeed, on x86_64, we can have both the 32-bit
and 64-bit EFI platforms enabled. So the check is inverted, and we check
that no platform is not enabled (yeah, double negation). For consistency,
we do the same for the legacy boot, even though in that case, there can
only ever be only one enabled at once at most.

Additionally, we add a new check to Config.in to support only one grub
installation type at a time. Mender-grubenv requires a config file in
/etc/mender, defining where the bootloader lives. As such, mender-grubenv does
not support multiple installations of grub.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
changes v1 -> v2:
  - Change ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y) to
    ifneq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI),) to cover all grub2
efi
    scenarios. (Thomas)
  
  - Change BR2_TARGET_GRUB2_BUILTIN_MODULES to
    BR2_TARGET_GRUB2_BUILTIN_MODULES_PC (thomas)

Changes v2 -> v3:
  - Check for both MODULES_EFI and MODULES_PC (Thomas)

Changes v3 -> v4:
  - Add qstrips to needed variables (Thomas)
  - Check for empty module lists (Thomas)
  - Split up MENDER_GRUBENV_INSTALL_IMAGES_CMDS to work with pc and efi
    at the
    same time.

Changes v4 -> v5 (Yann):
  - drop superfluous check on empty modules lists
  - move EFI and legacy commands under same condition as checks

Changes v5 -> v6 (Adam):
  - Add a check in Config.in to ensure only one grub target is selected
  - Clean up the commit grammar.

 package/mender-grubenv/Config.in         |  7 ++-
 package/mender-grubenv/mender-grubenv.mk | 58 ++++++++++++++++--------
 2 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
index 97f785ad3f..3fc20bacbb 100644
--- a/package/mender-grubenv/Config.in
+++ b/package/mender-grubenv/Config.in
@@ -3,12 +3,14 @@ config BR2_PACKAGE_MENDER_GRUBENV
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MENDER # runtime
 	depends on BR2_TARGET_GRUB2
+	depends on (BR2_TARGET_GRUB_EFI && !BR2_TARGET_GRUB_LEGACY) || \
+		(BR2_TARGET_GRUB_LEGACY && !BR2_TARGET_GRUB_EFI)
 	help
 	  Contains the boot scripts and tools used by Mender to
 	  integrate with the GRUB bootloader.
 
 	  The following Grub modules must be selected for this package:
-	  loadenv hashsum echo halt gcry_sha256 test
+	  loadenv hashsum echo halt gcry_sha256 test regexp
 
 	  https://github.com/mendersoftware/grub-mender-grubenv
 
@@ -34,3 +36,6 @@ comment "mender-grubenv needs a grub2 bootloader"
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MENDER
 	depends on !BR2_TARGET_GRUB2
+
+comment "mender-grubenv does not support both legacy and EFI grub2 bootloaders at the same time"
+	depends on BR2_TARGET_GRUB_EFI && BR2_TARGET_GRUB_LEGACY
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 07df25512c..8564476581 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -13,7 +13,7 @@ MENDER_GRUBENV_LICENSE_FILES = LICENSE
 MENDER_GRUBENV_DEPENDENCIES = grub2
 MENDER_GRUBENV_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
+ifeq ($(BR2_TARGET_GRUB_LEGACY)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
 MENDER_GRUBENV_ENV_DIR = /boot/grub
 else
 MENDER_GRUBENV_ENV_DIR = /boot/EFI/BOOT
@@ -31,14 +31,44 @@ MENDER_GRUBENV_DEFINES = \
 # These grub modules must be built in for the grub scripts to work properly.
 # Without them, the system will not boot.
 MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test regexp
-MENDER_GRUBENV_MODULES_MISSING = \
-	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
+
+# grub2 does not provide a syntetic EFI option, so check all of them
+ifneq ($(BR2_TARGET_GRUB_EFI),)
+MENDER_GRUBENV_MODULES_MISSING_EFI = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
+		$(MENDER_GRUBENV_MANDATORY_MODULES))
+
+define MENDER_GRUBENV_INSTALL_EFI_CFG
+	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
+	cp -dpfr $(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/grub.cfg \
+		$(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/mender_grubenv* \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT
+endef
+endif
+
+# grub2 does not provide a syntetic legacy boot option, so check all of them
+ifneq ($(BR2_TARGET_GRUB_LEGACY)$(BR2_TARGET_GRUB2_ARM_UBOOT),)
+MENDER_GRUBENV_MODULES_MISSING_PC = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
+define MENDER_GRUBENV_INSTALL_I386_CFG
+	mkdir -p $(BINARIES_DIR)/boot-part/grub
+	cp -dpfr $(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/grub.cfg \
+		$(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/mender_grubenv* \
+		$(BINARIES_DIR)/boot-part/grub
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
-ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
-$(error The following missing grub2 modules must be enabled for mender-grubenv \
-	to work: $(MENDER_GRUBENV_MODULES_MISSING))
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING_EFI),)
+$(error The following missing grub2 efi modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MODULES_MISSING_EFI))
+endif
+
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING_PC),)
+$(error The following missing grub2 pc modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MODULES_MISSING_PC))
 endif
 endif
 
@@ -54,21 +84,9 @@ define MENDER_GRUBENV_INSTALL_TARGET_CMDS
 	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-# Overwrite the default grub2 config files with the ones in this package.
-ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
 define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
-	mkdir -p $(BINARIES_DIR)/boot-part/grub
-	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
-		$(TARGET_DIR)/boot/grub/mender_grubenv* \
-		$(BINARIES_DIR)/boot-part/grub
+	$(MENDER_GRUBENV_INSTALL_I386_CFG)
+	$(MENDER_GRUBENV_INSTALL_EFI_CFG)
 endef
-else
-define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
-	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
-	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
-		$(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
-		$(BINARIES_DIR)/efi-part/EFI/BOOT
-endef
-endif
 
 $(eval $(generic-package))
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
