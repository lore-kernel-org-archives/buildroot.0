Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EF7C5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 20:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B91D540145;
	Sun, 18 Aug 2024 20:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWqURbLa282Q; Sun, 18 Aug 2024 20:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B30D640202
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B30D640202;
	Sun, 18 Aug 2024 20:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8412F1BF41C
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 20:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7231360602
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 20:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_hYBLhI_3J3 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 20:31:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A261605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A261605D1
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A261605D1
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 20:31:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f15790b472so46599421fa.0
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 13:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724013099; x=1724617899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mhx6606pJO8n8FmTcH/7+Os9zHkguXL1fswNWz91vf0=;
 b=eERsODDsc3ZhSGmu3j7uwCXNbgwQ2CUMznyfTN5Qkjq9Khwjh8ul3WoMBDnuK8tON6
 v292k71VW6uqokC37VQOlPuEsBrahCSOsMb504K8mmVZFfDyp2HyFvpo0zH5lurLzYXb
 tK0ERbhay+99hNFnGzDxHomIS7D7j2Re0unsa+OkSZcAJnbYQkgpD/46rwx8QA7NMeCv
 BkSh18bm3TCx2GCDrQAzobP2tQAyX0Tee3ssMhAP+31jH8VovZPfQ6A3OKzbTX3V5HbJ
 wEjLX0O/kzrZAYIfhOE8kfAuraypj6SPxgI8ejIIOBdkT4RVdWAIVBuz7MV1u8P3J7Bx
 U5DA==
X-Gm-Message-State: AOJu0Yz9c2L7oiq1pKPlrEj0w1dMu9dxOA6XO1I8/2Z0pXb0AtjUuwXf
 x2sZnXwjcc33EOosDrtCV4ZwagkbBMFwr2IGnKHZLLORNMn4f0YU+QptwQqGdSQ=
X-Google-Smtp-Source: AGHT+IHD3qlV4q6X6+1Ie13maCT6VtPeicTEMxoOa/3FI1B1+FBMEfaWFoUYWFohwrjyI2qucA3rPQ==
X-Received: by 2002:a2e:a988:0:b0:2ef:2df7:3d9a with SMTP id
 38308e7fff4ca-2f3be578565mr58925841fa.9.1724013098796; 
 Sun, 18 Aug 2024 13:31:38 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-2f3b746cd4bsm13023451fa.11.2024.08.18.13.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 13:31:38 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 23:31:29 +0300
Message-ID: <20240818203134.1512793-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240818203134.1512793-1-geomatsi@gmail.com>
References: <20240818203134.1512793-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724013099; x=1724617899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mhx6606pJO8n8FmTcH/7+Os9zHkguXL1fswNWz91vf0=;
 b=PWitSMnzNYjv7fIZBeJrpFQGF7aHKbup2274gMr1IVch1bq30bZ+f0IH00uABqccui
 d0ZMQOn2htb/6KqB8ugtey27E/3iRQCSCrOybCFF64FFXxdTy/kXKty833h0gm6xNJoU
 U/zLIcFetZnWjY5DzwwV0/B9eUChpfWzFK4M33pzZZjA+ejhZ1t0+6VYHimTWvge291P
 +XupY7B4e//1XkdR8Kuns+WrNWq/SteWBCHgbSI0bMzzaRKcnjfJxVB4e3p1Cj5rNEmT
 FK3tJAm7Cdg4FtPlV6AVNy9RG8tdHp3dTCRjoGkNn/w+CiN4y9FNSxq3Efz35lSWmDIU
 LAEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PWitSMnz
Subject: [Buildroot] [PATCH 1/2] package/wpa_supplicant: wired driver needs
 headers >= 5.7
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In wpa_supplicant v2.11 macsec support in wired driver requires enum
'macsec_offload' if libnl version is >= v3.6, see the commit:
- https://w1.fi/cgit/hostap/commit/?id=40c139664439b2576e1506fbca14a7b79425a9dd

Buildroot provides libnl version v3.9.0, so enum 'macsec_offload' shall
be available in order to successfully build wpa_supplicant wired driver
with macsec support. However that enum has only been added to Linux header
if_link.h since kernel v5.7, see commits:
- https://github.com/torvalds/linux/commit/21114b7feec29e4425a3ac48a037569c016a46c8
- https://github.com/torvalds/linux/commit/76564261a7db80c5f5c624e0122a28787f266bdf

That is why we have to tighten restriction on Linux headers for wired
driver from v4.6 to v5.7.

Fixes:
- http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/wpa_supplicant/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 92953f69f0..e013f5a9c1 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -42,7 +42,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
 config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
 	bool "Enable wired support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	help
@@ -50,8 +50,8 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
 	  supplicant can be used with Ethernet.  This also enables
 	  support for MACSEC.
 
-comment "wired macsec support needs a toolchain w/ headers >= 4.6"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+comment "wired macsec support needs a toolchain w/ headers >= 5.7"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
 
 comment "wired support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
