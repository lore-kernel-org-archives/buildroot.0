Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254F8C83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 16:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0CD84051F;
	Sat, 26 Aug 2023 16:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0CD84051F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1mvAXJlzZyet; Sat, 26 Aug 2023 16:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1FD84055E;
	Sat, 26 Aug 2023 16:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1FD84055E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 586B41BF831
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 16:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A13F40517
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 16:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A13F40517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdUBvDb65LYA for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 16:56:35 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EE66400AC
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 16:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EE66400AC
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31781e15a0cso1621784f8f.3
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 09:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693068993; x=1693673793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOdGN8tqZcEIvnkXWROMOvnGpegpJWA+bU0Xxw3YXII=;
 b=FQkJdSOUsd43aUv6Yyeleu9lB5ul8RnVO01JQRlxCkEnD6suk5Oeb32fI09SzYdmoM
 zTya1RALXH5LbiZ4vpkL473RB5npeyfvv2vf4Huqi+QotIUgYupoRIKjcjgGGRWx8Qc6
 G9cyzTrrduzJ+j8CFpua3fZqoWceZjJKiUmE+mhcNnwHkByV5hpWj4IkhziDIqxtmXBA
 kJaOhLBCThvVLLSuv/BnZEE/acUTETx92UgI/4d1dFoh0xXIZcIOlawVlJucCJsOm6n/
 8TDHl6kXtcWiNqo08fShPB0CzpmtVTDAuXJr18ojXMXU6y1Ql0IqUWbxqhVBb7a8M3/+
 /7jA==
X-Gm-Message-State: AOJu0Yw113B9kjjoVofpBxPz2LgdZ1F1zPEV8EzUtrWW+e6vMJcoV/g9
 JUj33Xm2l9SDnOUuspmvdeUT7Gl2vcg=
X-Google-Smtp-Source: AGHT+IF8zEENU/oAl2nk+J0SftI90TWHF8BwIvCzF344DY9KYQ8S+t+lFj9D4sO6CAQDf3ELMSli5A==
X-Received: by 2002:a5d:63d2:0:b0:317:4755:9e48 with SMTP id
 c18-20020a5d63d2000000b0031747559e48mr16752424wrw.53.1693068993490; 
 Sat, 26 Aug 2023 09:56:33 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 hn1-20020a05600ca38100b003fbe4cecc3bsm8655744wmb.16.2023.08.26.09.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 09:56:32 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 18:56:28 +0200
Message-ID: <20230826165628.31792-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230826165628.31792-1-romain.naour@gmail.com>
References: <20230826165628.31792-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693068993; x=1693673793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOdGN8tqZcEIvnkXWROMOvnGpegpJWA+bU0Xxw3YXII=;
 b=n4ocnYPWInIIz048taAUrn4W0iccs7MirdC6R3HRkoit/B9G6zkvoOMVChLKTLMKrj
 jIw8eOFpOn3DRiw4K9YlFJjhYNzXHN2uC/b6zxtIWXOfN/AFuSI53pKG7pbIXWsQPur4
 IbFRLDvqw1kg7RrzeSWUIoPOEmtrQqsf9SKcexh3KY74obP2RH7TF+nUrIKXIjg3f2Ax
 WO7KtPVJmdfO8aIJL2J/fhXl4HUfGQNT2F74BXip7o3ZzK8NFoo7Xt27UmDa/DFepXYX
 P5xrwK/sY7R4xVIVkgjzowNYGMhpGH9yYqUu/bqKu2cNS2zXRCvQ2kxW516SrnDC/rXP
 8bEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n4ocnYPW
Subject: [Buildroot] [PATCH] configs/sipeed_{maixduino,
 maix_go}_sdcard_defconfig: fix build with binutils >= 2.38
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport an upstream patch fixing the build with binutils >= 2.38
for riscv's for Zicsr and Zifencei.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949340
https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949329

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
All four sipeed_maix* defconfigs sipeed_maix_bit_sdcard_defconfig,
sipeed_maix_dock_sdcard_defconfig, sipeed_maixduino_sdcard_defconfig
and sipeed_maix_go_sdcard_defconfig are using the same uboot version.
Only two were fixed by the previous commit ef4eea32261ed3f21af119936a080cb2fc8897fa
"configs/sipeed_maix_{bit, dock}_sdcard_defconfig: fix build with binutils >= 2.38"
---
 configs/sipeed_maix_go_sdcard_defconfig   | 1 +
 configs/sipeed_maixduino_sdcard_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 6c61e3aaaf..2bea0b97be 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -17,6 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index da8cbe45f9..db7896fadf 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -17,6 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
