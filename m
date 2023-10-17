Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAE7CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 10:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B389D60E50;
	Tue, 17 Oct 2023 10:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B389D60E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KNO0eODINZxS; Tue, 17 Oct 2023 10:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F010B60F85;
	Tue, 17 Oct 2023 10:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F010B60F85
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 186181BF97E
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 10:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3BAC40364
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 10:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3BAC40364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1kBHvFTU3jvY for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 10:40:27 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC9D9402A7
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 10:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC9D9402A7
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3226cc3e324so5142142f8f.3
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 03:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697539224; x=1698144024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JrHqYia1Z2QgJPgzM5byw99zLPhkKuOnM5MGO+kWUgg=;
 b=OG7jVXliHXmpyEW7ErtNVhwBrA6y3zXV3kBiNeGnM4CqD8M/fiFiClEhDdLKSztJ7P
 VQxsTDKsqT3lJ158Z9BA+/axkqT4yooECaM7YffL9/IkX46xrnoUookNZNHMzG34hhP6
 lm8Rx9DhXuyya8AmRiMjtEn8HLBqwi+Z4nq8TYfsbngnMuFAEJ/d2HTYekMDeX55keTB
 NcgaYX4+jvpsjJZow13lI9hg9cMpU6WxuyLtOxZCgy89jC82Dz1OJ/m5UGbksGw7/GPk
 fVC+MA4u91E6oOJzFH3zuUQOOUj0j4dcLGdjtFA3Md72GtkRHuSF1xWj7fDkcXk1pqVZ
 CeOg==
X-Gm-Message-State: AOJu0YxNLKZ/G7tgbD4ND4dJwDANoS3ESAldzXibhK+7qhwvuFpcTY8W
 Q+wI9U600M1FkeLIgcvjlyRvSOtj67ojJmwjCkgm4iC9/1Q=
X-Google-Smtp-Source: AGHT+IESdsiw84N8dutEjWV7VIxlmRK6f81OF8pVfnagK9KXU2CnXQ4WM/qBU87auQZyzxi7SkYQNQ==
X-Received: by 2002:a05:6000:136b:b0:32d:adda:e8cd with SMTP id
 q11-20020a056000136b00b0032daddae8cdmr1675381wrz.22.1697539224497; 
 Tue, 17 Oct 2023 03:40:24 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 w17-20020a5d4b51000000b0032da4c98ab2sm1401068wrs.35.2023.10.17.03.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 03:40:23 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 12:40:13 +0200
Message-ID: <20231017104015.1492775-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017104015.1492775-1-adam.duskett@amarulasolutions.com>
References: <20231017104015.1492775-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697539224; x=1698144024;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrHqYia1Z2QgJPgzM5byw99zLPhkKuOnM5MGO+kWUgg=;
 b=q/WD4UQuKyAX3rgVg1JA18Tg6kELyVLj4VQfK3+zvCggYAhuFTT7OSTvMqJLKDH/Wf
 FCHxR2xCVJyxOGC7Pc1WeZVPh985ClGWIpBllSW+TxpdYkTW9Mj4uy0alaG4A6AewYur
 jTHiFpX1Giw+BjDts9s7+rJ2Uec60gnKYxC9A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=q/WD4UQu
Subject: [Buildroot] [PATCH 3/5] package/mender-grubenv: bump version to
 64e32b01d1bf54784d2a290ad0469c583e843864
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
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mender grubenv now expects bios installs to be in boot/grub-mender-grubenv
instead of boot/grub/grub-mender-grubenv.

Also, update the LICENSE hash as the year has been updated to 2023.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index 193bff073b..d44220eadd 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7a08eb3d996afb38c1a4f7c51b7eb44aec6197ff713ce75e4f39d5b448cfc82  mender-grubenv-2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b.tar.gz
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  5232988ff3063a5132099807fcc7da9b70f0bf50a5396f763f4113a80284dff8  mender-grubenv-64e32b01d1bf54784d2a290ad0469c583e843864.tar.gz
+sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 9b3753ad8c..b8d2867f05 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = 2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b
+MENDER_GRUBENV_VERSION = 64e32b01d1bf54784d2a290ad0469c583e843864
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
@@ -30,14 +30,14 @@ MENDER_GRUBENV_MODULES_MISSING_PC = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
-MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/grub
+MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot
 
 define MENDER_GRUBENV_INSTALL_I386_CFG
 	mkdir -p $(BINARIES_DIR)/boot-part/grub
 	cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
 		$(TARGET_DIR)/boot/grub/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
-		$(TARGET_DIR)/boot/grub/grub-mender-grubenv \
+		$(TARGET_DIR)/boot/grub-mender-grubenv \
 		$(BINARIES_DIR)/boot-part/
 endef
 MENDER_GRUBENV_TARGET_FINALIZE_HOOKS += MENDER_GRUBENV_INSTALL_I386_CFG
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
