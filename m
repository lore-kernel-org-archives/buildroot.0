Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44526C433EF
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 21:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D887740523;
	Wed, 24 Nov 2021 21:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pbSbLqutTsLH; Wed, 24 Nov 2021 21:07:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4E8C404FD;
	Wed, 24 Nov 2021 21:07:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74C7A1BF3EC
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 21:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CF6060BC5
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 21:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_BfhMWTLZNb for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 21:07:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B184260617
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 21:07:14 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id z6so2878900plk.6
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 13:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2ePkF0q5G5cEEo0wrc9j9FOAihnpJrfWfJ4NMGvxs4=;
 b=VraHIVF+gBy8OpCVHs+YgZZr3fFQLP1a0dIKyoWiJOpcz51si8q1G2LRz/Z1/ML8F1
 iGPWsbwjj2J9CvJASOhnmQNLtg0p/CWzg7nptjWoEOnAFXMfYYv/QUK+P62Rs331qcXU
 HmLPYJDB/C3b9fMJ1xfHSemP2UIts/k/dkX5Yy4YfYxqf4zBszQc+TkumNAhlq5sWdQu
 bxMjph0ndxUIaEOnuQ3bzHHkRu3vKfC5q9mJUmPgk6xnOS7OirPZu4xJMmdc23xZNx3K
 2jrqPb6vWezR0mhKRPrRzQPl6qGZP1RGVgSwibBSTlhynNqI/LeBCaIUkX5NbqBn9u/W
 tyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2ePkF0q5G5cEEo0wrc9j9FOAihnpJrfWfJ4NMGvxs4=;
 b=qbn+MnkCCuDxaU8S8sSRKYDYrdLEGmzditBsRP+B6sIi83a32EidRylBPoClYnd/W8
 JpTBf5kgMXi4oztknU72gRz2Ud7syLbTHSrzKAnDIrV4FYWUFUgukTri6xuS806qMI2G
 qJBIHcxVyTI367VK25rpwMfXmToommzcBAxN+5Y86VLNHfW/wuzg3xfjPASZNdi2ln5v
 iVce9udGsY7VkklPLlwwLXUX6Ze3ZaVMktSyoXnjj6G+cppzzUTQ8Bzx9Jlhxpcix9bW
 w18UicEVGixuvgpCBd60EclsIoZ4CsMkqCth8ENuEzUoEuZ4961G45sqra7Mh7z/cq15
 eaog==
X-Gm-Message-State: AOAM532GbFWkDvPB7rAU+i4p+N6zBW8TX5HxkNwaeRjRuYELv0ACBqSs
 8ZnHiD+3P5oJyyunf6XkiYvMcju/ACLIDg==
X-Google-Smtp-Source: ABdhPJxEqlYGO2yF/Lk2O4drja51AfYZE0oDF3E7fS0abSKaSRMks/vAmhUzJ2snL4gad/jA793KcA==
X-Received: by 2002:a17:902:ee8d:b0:143:8e80:62a8 with SMTP id
 a13-20020a170902ee8d00b001438e8062a8mr21728265pld.30.1637788033899; 
 Wed, 24 Nov 2021 13:07:13 -0800 (PST)
Received: from adam-workstation.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id g22sm643362pfj.29.2021.11.24.13.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:07:13 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Nov 2021 13:07:07 -0800
Message-Id: <20211124210707.1348764-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/1] package/mender-grubenv: fix grub module
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3efb5e31fc05705ce3c46b1f0ec031978a5cfab6 broke mender-grubenv by
splititng up BR2_TARGET_GRUB2_BUILTIN_MODULES and
BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI. Indeed, when a user now builds a system
with EFI, the MENDER_GRUBENV_MODULES_MISSING list always returns a full list
of grub modules, resulting in the error condition on line 46 to trigger.

In addition, BR2_TARGET_GRUB2_BUILTIN_MODULES has been renamed to
BR2_TARGET_GRUB2_BUILTIN_MODULES_PC, so this is changed in mender-grubenv.mk
as well.

- Add a ifneq check for both efi and i386 targets. If any of them are selected,
  check if the corresponding module list is empty and print an error message if
  so.

- Add two ifeqs, one for BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI and the other
  for BR2_TARGET_GRUB2_BUILTIN_MODULES_PC. If either is not empty,
  check for the required modules and error out if either of the two
  have missing modules.

- Split up the MENDER_GRUBENV_INSTALL_IMAGES_CMDS into two separate parts, one
  for I386_PC/ARM_UBOOT, and another for EFI targets. This allows both EFI and
  I386 builds to install at the same time.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
changes v1 -> v2:
  - Change ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y) to
    ifneq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI),) to cover all grub2 efi
    scenarios. (Thomas)
  
  - Change BR2_TARGET_GRUB2_BUILTIN_MODULES to
    BR2_TARGET_GRUB2_BUILTIN_MODULES_PC (thomas)

Changes v2 -> v3:
  - Check for both MODULES_EFI and MODULES_PC (Thomas)

Changes v3 -> v4:
  - Add qstrips to needed variables (Thomas)
  - Check for empty module lists (Thomas)
  - Split up MENDER_GRUBENV_INSTALL_IMAGES_CMDS to work with pc and efi at the
    same time.

 package/mender-grubenv/mender-grubenv.mk | 52 ++++++++++++++++++------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 07df25512c..bb4ec87755 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -31,14 +31,38 @@ MENDER_GRUBENV_DEFINES = \
 # These grub modules must be built in for the grub scripts to work properly.
 # Without them, the system will not boot.
 MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test regexp
-MENDER_GRUBENV_MODULES_MISSING = \
-	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
+
+# Unfortuantly, there is no easy way to check if the efi list is empty without
+# checking to see if any of the supported EFI platforms are selected.
+ifneq ($(BR2_TARGET_GRUB2_I386_EFI)$(BR2_TARGET_GRUB2_X86_64_EFI)$(BR2_TARGET_GRUB2_ARM_EFI)$(BR2_TARGET_GRUB2_ARM64_EFI),)
+ifeq ($(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),)
+$(error The following missing grub2 efi modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MANDATORY_MODULES))
+endif
+MENDER_GRUBENV_MODULES_MISSING_EFI = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
+		$(MENDER_GRUBENV_MANDATORY_MODULES))
+endif
+
+ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
+ifeq ($(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),)
+$(error The following missing grub2 efi modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MANDATORY_MODULES))
+endif
+MENDER_GRUBENV_MODULES_MISSING_PC = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
+endif
 
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
 
@@ -56,19 +80,23 @@ endef
 
 # Overwrite the default grub2 config files with the ones in this package.
 ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
-define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
-	mkdir -p $(BINARIES_DIR)/boot-part/grub
+define MENDER_GRUBENV_INSTALL_I386_CFG
+	mkdir -p $(BINARIES_DIR)/boot-part/grub;
 	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
 		$(TARGET_DIR)/boot/grub/mender_grubenv* \
-		$(BINARIES_DIR)/boot-part/grub
+		$(BINARIES_DIR)/boot-part/grub;
 endef
-else
-define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
-	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
+MENDER_GRUBENV_INSTALL_IMAGES_CMDS += $(MENDER_GRUBENV_INSTALL_I386_CFG)
+endif
+
+ifneq ($(BR2_TARGET_GRUB2_I386_EFI)$(BR2_TARGET_GRUB2_X86_64_EFI)$(BR2_TARGET_GRUB2_ARM_EFI)$(BR2_TARGET_GRUB2_ARM64_EFI),)
+define MENDER_GRUBENV_INSTALL_EFI_CFG
+	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT;
 	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
 		$(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
-		$(BINARIES_DIR)/efi-part/EFI/BOOT
+		$(BINARIES_DIR)/efi-part/EFI/BOOT;
 endef
+MENDER_GRUBENV_INSTALL_IMAGES_CMDS += $(MENDER_GRUBENV_INSTALL_EFI_CFG)
 endif
 
 $(eval $(generic-package))
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
