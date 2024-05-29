Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DF1C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 18:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE27380C3F;
	Wed, 29 May 2024 18:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3TjvwyFE0-r; Wed, 29 May 2024 18:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9125D80F55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9125D80F55;
	Wed, 29 May 2024 18:38:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5B731BF4D7
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 18:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CE8980EAB
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 18:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHg5Kv-si3og for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 18:38:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD61680C80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD61680C80
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD61680C80
 for <buildroot@buildroot.org>; Wed, 29 May 2024 18:38:56 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4210aa012e5so382365e9.0
 for <buildroot@buildroot.org>; Wed, 29 May 2024 11:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717007934; x=1717612734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u7v76SS9uMNqGyduUH29jEe1rFZFrS2WFLea2BwtkuE=;
 b=G0OtNjlQ4HPUH3fRhxSw87SoF5oxRUgtkMldLvG05TaNusQDTBLhSJOjX6vWEbRi6O
 UcOVQcV5+AJGg7jhDwp9mRvtpcPcscu5MuYnUJj1F+5/IZJeGrwX+uQdCLsmBGpDgyxe
 v9amXm5a34RYaHt8qbJhwH1z+OAAGWfsMHJhcjCn0jTbtPQQ6+WvRja1xr0VLsJ8UOg4
 38jIX5HuapHGv2ATUg9Krct5JJXUwLorRTcwfQCz+SRjTf72DtmwFTzUKvzL0C57wFVH
 l9sp7oo1jiWVUNcDA7vB4QVCKjZWumgodPiubO16ElDt2eEzJcpYwJqljaUZy1ZRCnyz
 OO1w==
X-Gm-Message-State: AOJu0YyMpsBzO1iBjAPz0kTrsXkHVLUEgqOzah1s45X4l/7y7j43glYB
 rp0bum7CZm81EDg/oMW+Cq/Bbsl0Tpc6GGckPbslH61c5+ZAAAGOI8gEG185TkeTO7PdxfgNKc4
 T5+U=
X-Google-Smtp-Source: AGHT+IEEaCsGEQomAqrbd97Mm1gj8RremmU1eR/YlINK/nUCM6DwalTx3dtPfwk4tPO/KZxfNYJF/g==
X-Received: by 2002:a7b:c2aa:0:b0:41c:1434:f571 with SMTP id
 5b1f17b1804b1-42108aba96bmr124150285e9.37.1717007934653; 
 Wed, 29 May 2024 11:38:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557dcf0871sm15839260f8f.110.2024.05.29.11.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 11:38:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 20:38:42 +0200
Message-ID: <20240529183842.1384707-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529183842.1384707-1-dario.binacchi@amarulasolutions.com>
References: <20240529183842.1384707-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717007934; x=1717612734;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7v76SS9uMNqGyduUH29jEe1rFZFrS2WFLea2BwtkuE=;
 b=Rq+fCIsJd3x14o9NB5SBgwKXXgn8BkYsI+KsIGatApuFmCjpQvEEM3Dylk40yxPSAo
 4ovR74OlKYmz12JfRiAIlzfIut1SuzZZZIfFUUDL93zm/c6DPcFipk+wwhpFNxxY8d/b
 JRbmNnFYGvYUeQQtOpf4/OpEXsGqmu+PsCBW0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Rq+fCIsJ
Subject: [Buildroot] [PATCH v2 2/2] configs/lego_ev3_defconfig: add hashes
 for Linux/headers/u-boot
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 David Lechner <david@lechnology.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop
the defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
- Update the sha256 for the new version of Linux.

 .checkpackageignore                                     | 1 -
 board/lego/ev3/patches/linux-headers/linux-headers.hash | 1 +
 board/lego/ev3/patches/linux/linux.hash                 | 2 ++
 board/lego/ev3/patches/uboot/uboot.hash                 | 2 ++
 configs/lego_ev3_defconfig                              | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)
 create mode 120000 board/lego/ev3/patches/linux-headers/linux-headers.hash
 create mode 100644 board/lego/ev3/patches/linux/linux.hash
 create mode 100644 board/lego/ev3/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index f6d54361bc10..bb27977d8c32 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -218,7 +218,6 @@ configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
-configs/lego_ev3_defconfig lib_defconfig.ForceCheckHash
 configs/linksprite_pcduino_defconfig lib_defconfig.ForceCheckHash
 configs/ls1028ardb_defconfig lib_defconfig.ForceCheckHash
 configs/ls1046a-frwy_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/lego/ev3/patches/linux-headers/linux-headers.hash b/board/lego/ev3/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/lego/ev3/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/lego/ev3/patches/linux/linux.hash b/board/lego/ev3/patches/linux/linux.hash
new file mode 100644
index 000000000000..81824a41ee4c
--- /dev/null
+++ b/board/lego/ev3/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
diff --git a/board/lego/ev3/patches/uboot/uboot.hash b/board/lego/ev3/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..c53d9ecc5cec
--- /dev/null
+++ b/board/lego/ev3/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  312b7eeae44581d1362c3a3f02c28d806647756c82ba8c72241c7cdbe68ba77e  u-boot-2021.07.tar.bz2
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 86b2aea65611..df80bb3f1098 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -5,6 +5,8 @@ BR2_arm926t=y
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
 # Linux headers same as kernel, a 4.19 series
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
