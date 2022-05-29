Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC275C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 13:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84D9A847B5;
	Sun, 29 May 2022 13:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1wcXrJtbMYGC; Sun, 29 May 2022 13:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCC1847B9;
	Sun, 29 May 2022 13:19:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FBDF1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C78E41BC1
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9E0dCrGDAujv for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 13:18:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75E4341BBE
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 c9-20020a7bc009000000b0039750ec5774so5089032wmb.5
 for <buildroot@buildroot.org>; Sun, 29 May 2022 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TGTuRYfEf59RocPa7y+fufmElx5FYDnB/XmpheSduIw=;
 b=RD1FhfQDjLm2xlf8lw0X3SaYfNMJVmgmJpSQdlJTTkaN13kvUnqbMDh3la2mHKa/lo
 63KWwAvHb1s5vwAVUMgKUJik75f+ZKXd+6FNRBnuEu4slyjuX83UcM1H9AH98Mi+NKdD
 x+JAgdOv7xmeR7Vz82WPfI/wxG+lAFAzWhS+tjGIsWNDoTVljKN3hRrBvfz1HmJ2NPSG
 6U1zR28cvSVtRW6bNuAJtTpY7SYGlfgHRzUl9wlETze2Qpv7RzcHmGdrxNbSpdOqBN+h
 vpsMJ0QYf+AiazNZYNWMYfExTVLhoHvgAvvXRNCC5n/fpJP0G4+p8SbJm4hTgdbxYSFF
 QM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGTuRYfEf59RocPa7y+fufmElx5FYDnB/XmpheSduIw=;
 b=TbkS0pj4cXcublz/XrUBZD/1iPFQv+eag4MDWfKMOGrAwdOtZIGSd8AVw5EYBNRdGJ
 GYxvKAOB5VOdPgKblS5jto45S+pSzAHVDVgtGPT0mMoS4ThCKNPEhcSsmDttgqh+W41H
 1Td3DSaCtoK02B4RR1gUz8Zvkz8ms8ntriZoGwYO6s5ZxTl3bYxwQtYKa4SfU70p37RH
 ArXLVS7AH5TPdEhB/V/Y7Ngs0kZmRFkOA5+fIdVLsGCu6L/CyceyzGtUEZ4D5gXnHvjQ
 YmTIT25ZLWDCigX1qaKLyhZsmgCNOr0xUmXvNfn9DICATIMp+4C2LndewevGpSoHrn2F
 N7IA==
X-Gm-Message-State: AOAM532JpfyWC6RMsNGXdEK5M1G1ER2LBT4thJkOmTb+t/KrIfkQO714
 RswcgX7DaPI3ayTqqhRb69FKj1FNrc0=
X-Google-Smtp-Source: ABdhPJwA9s6bOC+wQLJtGXEnoxn/skTMUefIB3O54ieuFHmqT38SxAz2gNp/089JZ91oLZtjAm2GMQ==
X-Received: by 2002:a7b:c957:0:b0:397:3f4d:555c with SMTP id
 i23-20020a7bc957000000b003973f4d555cmr15257296wml.101.1653830310582; 
 Sun, 29 May 2022 06:18:30 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b003949dbc3790sm7492562wmq.18.2022.05.29.06.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 06:18:29 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 15:18:08 +0200
Message-Id: <20220529131811.481017-8-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220529131811.481017-1-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next 08/11] package/gcc: add support for gcc
 12
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

https://gcc.gnu.org/gcc-12/changes.html
https://gcc.gnu.org/gcc-12/porting_to.html

Tested with toolchain-builder:
https://gitlab.com/kubu93/toolchains-builder/-/pipelines/550404957

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 14 ++++++++++++++
 package/gcc/gcc.hash       |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 06f83d8f87..bcf0743b23 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -62,6 +62,19 @@ config BR2_GCC_VERSION_11_X
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
+config BR2_GCC_VERSION_12_X
+	bool "gcc 12.x"
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_powerpc_SPE
+	# uClibc-ng broken on sparc due to recent gcc changes
+	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
+	depends on !BR2_sparc
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+
 endchoice
 
 # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
@@ -88,6 +101,7 @@ config BR2_GCC_VERSION
 	default "9.4.0"     if BR2_GCC_VERSION_9_X
 	default "10.3.0"    if BR2_GCC_VERSION_10_X
 	default "11.3.0"    if BR2_GCC_VERSION_11_X
+	default "12.1.0"    if BR2_GCC_VERSION_12_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index e364be0a06..dc19c282c2 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,6 +6,8 @@ sha512  dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b79
 sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
 sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.1.0/sha512.sum
+sha512  2121d295292814a6761edf1fba08c5f633ebe16f52b80e7b73a91050e71e1d2ed98bf17eebad263e191879561c02b48906c53faa4c4670c486a26fc75df23900  gcc-12.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
