Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D81DC54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 08:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03F5740102;
	Tue,  5 Mar 2024 08:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9Sqiwyw3Sou; Tue,  5 Mar 2024 08:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2230F41522
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2230F41522;
	Tue,  5 Mar 2024 08:56:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CB3D1BF2E5
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 08:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39DBA608CC
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 08:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3LJAzVrZGHO for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 08:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F374606A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F374606A6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F374606A6
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 08:56:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-412ebda8772so3464735e9.3
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 00:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709628979; x=1710233779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HBg0wCvlmf3CmqEnaVczEiFJUNKhEzcAEQhOkoA+qDY=;
 b=LSsv0cPaSWxFpDPEeoK1pxkCYWj6bvxyoDhJOYLmvpM0pUA7ZvrYRYHk8YRgVF+k0u
 OwGCYZzluYRQyM3s1rSZMA/tJpHYrGlSf9yh+m/0aCcRHgOdLVWkHchTFtoVHoaB3L9U
 16CJFQAXQle9wJya5qnw9YZvyVktGbYJ1d1x/KUbtyT6+pTL3ivMET9YmdMr5HZVM4A4
 egcG0qDPSBcUmi+VlAEPrrXaV3YhIuUJW+kGPhww3unrVN6wo3KotFPIogpcVy2NpDar
 GhMzSGg8UfMpNBu29gZEMNxGZe4WTgxLYIOoZXDHBPs0e6pYeNRoAUBHwxbVzaBHEyk6
 CxwA==
X-Gm-Message-State: AOJu0YyF0GCe4qV5yPqjbWi33uzdo6h7m1Ylws2MY0YtrIfbe2xed2Zj
 1yHe3MxsYmznlcUQLQjgJaG4UMBDvRw2PvC9+bIPGZ1eXPad/DG4HWmpD58c
X-Google-Smtp-Source: AGHT+IGWWRmwgJ3NE2x/YaZjHitR3ZLRJV7/n8ikDP9MMPBmpXoMoZlf89E8CB/S5upTBNYVftnCJQ==
X-Received: by 2002:a05:600c:a018:b0:412:dd51:19b0 with SMTP id
 jg24-20020a05600ca01800b00412dd5119b0mr4472512wmb.16.1709628978901; 
 Tue, 05 Mar 2024 00:56:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l1-20020a05600c1d0100b00412ea52b102sm2170488wms.34.2024.03.05.00.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 00:56:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 09:56:16 +0100
Message-ID: <20240305085616.7718-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709628979; x=1710233779; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HBg0wCvlmf3CmqEnaVczEiFJUNKhEzcAEQhOkoA+qDY=;
 b=BXjjDZzyNQ/9G7yZhU3gqrW+Hc9ZHSZ4dUY5TcxLW5Mb7rixxjY5kxAmW7BqcxOl3q
 EnkTiGAfgLD50L0+Bf+9ip9WT8laLphumTey4c52PLq4Q6RRIHj0X27OcUZxRuwOiLke
 pCq4Zo5QylDc0JB7z3p96P+iBnBwOtuQF/K2uP8vwSX01LcRfgeGWnbfTVkG/zdIYrRb
 CBXFonr+L1ky0bT4KsBG9of4Al3Ca60Xg8uNrMnBf2BoBnDuTr9bamDvswWBTgTKTC0D
 LrNJRvulKRU90opCLW/ZipzHEF0BO3UGlxlvO8cU9jDItKuYZCpvQ9b9LSAa3yEpMn+t
 dxWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BXjjDZzy
Subject: [Buildroot] [PATCH 1/1] package/openblas: fix mips64 build
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use MIPS64_GENERIC instead of SICORTEX with mips64 to avoid the
following build failure raised at least since bump to version 0.3.25 in
commit 6a172ffe6b2aa5c59427696775cfa4c189f99c19:

../kernel/mips64/amax.S:76: Error: opcode not supported on this processor: mips64 (mips64) `mtc1 $0,$f0'

MIPS64_GENERIC is available since version 0.3.22 and
https://github.com/OpenMathLib/OpenBLAS/commit/a50b29c540c25baf8f788131cc905ebe0575f253

Fixes:
 - http://autobuild.buildroot.org/results/b8da10aeb16343540ce3672faabdaa4d3bffb020
 - http://autobuild.buildroot.org/results/32702ccaa2384252058840960d8998abca294fad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openblas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 26a76d29fb..74c4a3aa5c 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -28,7 +28,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "PPC440FP2"       if BR2_powerpc_440fp
 	# P5600 is built with MSA support which is only available in Codescape toolchains
 	default "P5600"           if BR2_mips_p5600 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	default "SICORTEX"        if BR2_MIPS_CPU_MIPS64
+	default "MIPS64_GENERIC"  if BR2_MIPS_CPU_MIPS64
 	# I6400 is built with MSA support which is only available in Codescape toolchains
 	default "I6400"           if BR2_mips_i6400 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	# OpenBLAS assumes SPARC=Sparc v9
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
