Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D3BC48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 12:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44A14826FF;
	Thu,  7 Mar 2024 12:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iSChQZtTTCj3; Thu,  7 Mar 2024 12:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 500F182307
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 500F182307;
	Thu,  7 Mar 2024 12:28:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33AF71BF364
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 12:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F744418D9
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 12:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_nLA4FBKqek for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 12:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90EBF418D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90EBF418D8
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90EBF418D8
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 12:28:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-412f62edf25so6105765e9.3
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 04:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709814490; x=1710419290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aWa6LBS6AHBvVvO0PDMpr970jcFUhA/9QbTcl+6499w=;
 b=nAcPgWSqantc3ybWKoWLER3XXgzXvMVPVuqJ6mPHLsULcn8iRbymuR0r0zplPxeM1H
 20zKCYZPkwosaMq+IZ3HUnJzxIn0G6qCeQ0kbDgaJfmBDT65toxesH+UvpK/VGacCZc/
 U5RRxvEChRwZ+Pr0D0eFhHJilf9xjGW9J8Yz2Fu+DU/sw9z99HK2GlYJJDiC/gFh3Ebu
 7tqHpMz8ozpGY/gBEDSeIuvqSk5LC5tPbh3TmGPAiG+KCeVCO7G270hin/74vl8VxrMK
 gH1ggru5t10MOQhRlOSx4MMrwTE1mmwnJG3dYXFZoLFHryRq3q4mqOHPpeXlKYgNmz47
 oXhA==
X-Gm-Message-State: AOJu0Yw4t3mDmm3IJi5M5wUrci/iV2gcA7LzSgYGVCC83Um1Fqkxn85B
 5g9p73eGa9EPSDj1hUuQs+JvAZ0kvdxi+Q1BSuSTLV72aguZ5NddeEZBhWgk
X-Google-Smtp-Source: AGHT+IFALEBOjbl4GdhoJOD5tdwXmDlXx9BrP/6gvA+bqVQvZItwkjvS/LlPBed8Hjw348CyeO9DTA==
X-Received: by 2002:a05:600c:3555:b0:412:f015:6fa6 with SMTP id
 i21-20020a05600c355500b00412f0156fa6mr4809804wmq.28.1709814489528; 
 Thu, 07 Mar 2024 04:28:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l14-20020a7bc44e000000b00412f6c695d1sm2452264wmi.43.2024.03.07.04.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 04:28:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 13:28:06 +0100
Message-ID: <20240307122806.102726-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709814490; x=1710419290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aWa6LBS6AHBvVvO0PDMpr970jcFUhA/9QbTcl+6499w=;
 b=jpYsT/s0w379xRQuYTwWWSYrJ5S5OO+n1O/lKndam7PcJ3UcrQk7WY9CQGZeo18j5a
 y8cD6S7XI3d6HLzy2x4a/uqGmBYAgLVaO6l55RAMUwhO0xaUKH+OQxRndG6puSKiUabY
 e3ja3nt6to72WEcZXqWV+MoOruzqDJEDJfCU9IKl1K2PbrekG4i78RZ3RsuJXhtz4/CX
 GmgUu4eoaTubL8q9zL3PHgjWJDF9vr+XFlH+NKLjKfNao/rHk5fhxXUvgx7CSF4jbSlz
 P54AiX5KKkbfuNt8epW+ujZEKMsO6Fqc3038cPS3sXfaisWqsnqM5jYUBwlMchlUc4Lo
 sAig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jpYsT/s0
Subject: [Buildroot] [PATCH 1/1] toolchain/Config.in: enable libatomic with
 BR2_BINFMT_FLAT
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable libatomic with BR2_BINFMT_FLAT to avoid the following build
failure with libopenssl and
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./libcrypto.a(libcrypto-lib-threads_pthread.o): in function `CRYPTO_atomic_or':
threads_pthread.c:(.text+0xfa): undefined reference to `__atomic_is_lock_free'

Indeed, bootlin armv7m is an uclibc toolchain compiled with atomic
support through libatomic

This build failure is probably raised since activation of threads in
static builds by commit ea3e60229bc5647e587685023de475276e28584d

Fixes:
 - http://autobuild.buildroot.org/results/d25e898f9715bf6a21284807361a57735a7a2e1d
 - http://autobuild.buildroot.org/results/e37ed5ad6ba41d610bffe9c234f699e203ef5069

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/Config.in | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3dd6e83d35..13d1b94fe4 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -880,15 +880,12 @@ config BR2_TOOLCHAIN_HAS_SYNC_8
 	default y if BR2_TOOLCHAIN_X86_HAS_SYNC_8
 
 # libatomic is available since gcc 4.8, when thread support is
-# enabled. Also, libatomic doesn't recognize "uclinux" as a valid OS
-# part of the tuple, and is therefore not build on uclinux targets,
-# which is why BR2_BINFMT_FLAT configurations are excluded.
+# enabled.
 config BR2_TOOLCHAIN_HAS_LIBATOMIC
 	bool
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64 && \
-		BR2_TOOLCHAIN_HAS_THREADS && \
-		!BR2_BINFMT_FLAT
+		BR2_TOOLCHAIN_HAS_THREADS
 
 # __atomic intrinsics are available:
 # - with gcc 4.8, either through built-ins or libatomic, on all
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
