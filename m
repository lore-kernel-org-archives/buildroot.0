Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81571C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 17:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A0844094F;
	Sun,  3 Mar 2024 17:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGEChcmhx_kI; Sun,  3 Mar 2024 17:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 733854020B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 733854020B;
	Sun,  3 Mar 2024 17:19:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47CD41BF4D7
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 17:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 421B081EE8
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 17:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UMW5_vq97ALn for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 17:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F02F081EE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F02F081EE5
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F02F081EE5
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 17:19:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-412e17d60fcso1648505e9.1
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 09:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709486386; x=1710091186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OVXfMwZvGIUxEL0fYg41kjD7bE3o/2wxsiGPsc+YrBw=;
 b=KO7ZWSHMAMQnrE7h5aq9SLCgWmLr2joRmSuqStrsDY9JXvdwkwGwTcMKgCnQzuoiP6
 faxFX+bRRAfWQPEcMswqGBszCorOrFMvr3wSfGYspjamu9cv88dlb6GzWy2Hf5eRvgL5
 BivzY92HLp4xzFYoKtgGfABFF/w5ZRxAg6kERifKKvfYd8TvpW5D8rm9ugMEfxLQ3Ekz
 9kdNVsNdRDD7OFnzGGEYtIhmPMdG2E9498bF2Sf3tU5gEo77AFllUTHM047KfDOnRbW8
 ZZ4fNFG7SCf393WxQd5Bs+nKl7rWzEkYClzN3osyJaLDUXJDVAzembCxEImJ8E99DDa4
 49NA==
X-Gm-Message-State: AOJu0Yx0E6DRUN0ZK3e6X3zwogFx5R/wd9IFfxUtOiy+uTHnPnK3cAKS
 YKQ4qggQGKJx0gkmpCKxrr0x9H+KoOHTuaPBGGhN29hXg4wVLaVPUHrGMUHj
X-Google-Smtp-Source: AGHT+IGhtR0ZkR0a+yt2vI/eQf9CfBL8f8WxobFy6V4b2KNT3gv6hodUjwsd8hE7BZvcIIxWyPgZLA==
X-Received: by 2002:adf:978a:0:b0:33e:175b:4af8 with SMTP id
 s10-20020adf978a000000b0033e175b4af8mr7146661wrb.28.1709486385950; 
 Sun, 03 Mar 2024 09:19:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bp22-20020a5d5a96000000b0033d8b1ace25sm10492455wrb.2.2024.03.03.09.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 09:19:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 18:19:37 +0100
Message-ID: <20240303171937.490553-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709486386; x=1710091186; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OVXfMwZvGIUxEL0fYg41kjD7bE3o/2wxsiGPsc+YrBw=;
 b=ZhDfuSX5ueniah6AUkqc3eWvWTPcDXQvWmS4kyPnn8uaqRKkGAGj3e5iK8geITlcQa
 b6yEJPwtd/qpzxLIpCaLrrzkfo5rotWMf3OB/kvtyr08XK7EFLN9MxyGQ5xJTmPk+yEh
 f200GKUkxFf2DXh4DM2uPJevafzgAp3ISoXMk0XoeWfgpsnYtteh25kIyvGd1NzRLAev
 EdDQjc576T3upgPN1w8vKzH5qGK9wlu94NYTzuqppmnkvfQrO8KZJFooEb77Kje6uJdu
 1ST6LJhqWb7Sy/jF73YM0P0QNLBl+4u7LVAVVQyEMRnnyoyas/UOc6+3RxL0pIWs3scs
 lsHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZhDfuSX5
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix FIT build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FIT needs signature support as mkimage unconditionally calls
image_get_{checksum,crypto,padding}_algo resulting in the following
build failure since 2022:

/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/sh4-buildroot-linux-gnu/11.4.0/../../../../sh4-buildroot-linux-gnu/bin/ld: tools/image-host.o: in function `fit_image_setup_sig':
image-host.c:(.text+0x738): undefined reference to `image_get_checksum_algo

Moreover, FIT also needs cipher as it unconditonally calls
image_get_cipher_algo, fit_image_decrypt_data, etc.

So merge BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT into
BR2_PACKAGE_UBOOT_TOOLS_FIT. No legacy option is added to
Config.in.legacy as the end user will get signature support as soon as
FIT is selected.

Fixes:
 - http://autobuild.buildroot.org/results/c2fc9ba770bfa5ebdd8421c1623f87de5474d79a
 - http://autobuild.buildroot.org/results/a5b0a8e5c549e366217280c8184f1259debb996d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uboot-tools/Config.in      | 17 ++++++-----------
 package/uboot-tools/Config.in.host | 10 +---------
 package/uboot-tools/uboot-tools.mk | 28 ++++++++++++++--------------
 3 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index e8bbf3a16e..d0e255615e 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_DTC_PROGRAMS
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Enables support for Flattened Image Tree (FIT).
 
@@ -21,17 +22,6 @@ config BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
 	  in a single blob. To boot this new uImage structure,
 	  pass the address of the blob to the "bootm" command.
 
-comment "u-boot tools FIT support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
-if BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
-
-config BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
-	bool "FIT signature verification support"
-	select BR2_PACKAGE_OPENSSL
-	help
-	  Enables support for FIT Signature Verification.
-
 	  Flat Image Trees (FIT) supports hashing of images so that
 	  these hashes can be checked on loading. This protects
 	  against corruption of the image. However it does not prevent
@@ -47,6 +37,11 @@ config BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 	  libcrypto, and possibly GPL/OpenSSL licensing
 	  incompatibility issues.
 
+comment "u-boot tools FIT support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+if BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
+
 config BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN
 	bool "fit_check_sign"
 	depends on BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index 622070405d..3715be4d6e 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -10,6 +10,7 @@ if BR2_PACKAGE_HOST_UBOOT_TOOLS
 config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
 	bool "Flattened Image Tree (FIT) support"
 	select BR2_PACKAGE_HOST_DTC
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 	help
 	  Enables support for Flattened Image Tree (FIT).
 
@@ -19,13 +20,6 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
 	  in a single blob. To boot this new uImage structure,
 	  pass the address of the blob to the "bootm" command.
 
-if BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
-
-config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
-	bool "FIT signature verification support"
-	help
-	  Enables support for FIT Signature Verification.
-
 	  Flat Image Trees (FIT) supports hashing of images so that
 	  these hashes can be checked on loading. This protects
 	  against corruption of the image. However it does not prevent
@@ -37,8 +31,6 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 	  public key is stored in a non-volatile place, any image can
 	  be verified in this way.
 
-endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
-
 config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
 	bool "Environment image"
 	help
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 12e10dea91..d2a85ab061 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -34,13 +34,13 @@ UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
 	STRIP=$(TARGET_STRIP)
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
-UBOOT_TOOLS_DEPENDENCIES += dtc
-endif
-
-ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
-UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
+UBOOT_TOOLS_MAKE_OPTS += \
+	CONFIG_FIT=y \
+	CONFIG_FIT_CIPHER=y \
+	CONFIG_FIT_SIGNATURE=y \
+	CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000 \
+	CONFIG_MKIMAGE_DTC_PATH=dtc
+UBOOT_TOOLS_DEPENDENCIES += dtc openssl host-pkgconf
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE),y)
@@ -123,13 +123,13 @@ HOST_UBOOT_TOOLS_MAKE_OPTS = HOSTCC="$(HOSTCC)" \
 	CONFIG_EFI_HAVE_CAPSULE_SUPPORT=y
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
-HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
-HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
-endif
-
-ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
-HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
+HOST_UBOOT_TOOLS_MAKE_OPTS += \
+	CONFIG_FIT=y \
+	CONFIG_FIT_CIPHER=y \
+	CONFIG_FIT_SIGNATURE=y \
+	CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000 \
+	CONFIG_MKIMAGE_DTC_PATH=dtc
+HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc host-openssl
 define HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
 	$(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sign $(HOST_DIR)/bin/fit_check_sign
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
