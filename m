Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1D3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D32EF408D9;
	Sat, 23 Apr 2022 20:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOqBZzNYR8te; Sat, 23 Apr 2022 20:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95696408BA;
	Sat, 23 Apr 2022 20:42:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A3641BF59E
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 180B560C08
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SykJqWnrnBNT for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 20:41:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D0EB60B83
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 20:41:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v12so8797992wrv.10
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 13:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ls1ozZQtN56obWr1eQ9ZMPEopTjRbnAO6oAgi7NXKzM=;
 b=i+WWf1QnGO0OyRS+viARXVro2OR6m7/hlMnAwPTDZ2nEzA0Dm/f/7iwQ2xJpxNOGGQ
 2E1eKkIpjQPbNPnnv08WCRC50OyEJZLRNaKOhes0FeBoYPfvmwDncrYfVcE5aITLiqnN
 +dQig2NN8ebxO/3yZdslnjiMP04oFuk4WjNrYfbl9OKLazbIxkLPV79psV/JJmQU3PB3
 9vM+CuvOt19FwI56UF0Gs+v+gqOtsR17typ3hOG25zpCyn0X+nAnF7f2pRjLxsMKGfxm
 zqh1r3oNZdAXtAZ7zOFFG0J07mx8isrhVCqSJTBtFGxksJ+ywMMyi/WzL7rukUQR9IE5
 8geQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ls1ozZQtN56obWr1eQ9ZMPEopTjRbnAO6oAgi7NXKzM=;
 b=6qDO08eBOgwtPQP5VyMXH0nXwuMb9hdZZWT6Ptz/M13SSte41qIgfgduN43EX7hq7N
 H56Mf2w8W1B4zZsktV+oekv+N2MULdeA4wEF2nq86YhbsfSq+roPQ1+ILViCKaRVZVVC
 AO+i+ARO/qUNVOU0g9FyBLsmbVcC0LupH2J+0DtbAy3Z2RGTdczRV7CB5QxunDjkD2P0
 GBv8tQtFEWzU/O+ZT6uUAEGBkUpN6CDKQY2+u4WLPNV00VBHQDl8Yc6rHkQhG2/VJ6tC
 taVxXJHSpGk2qWdzNz6wE3daRzMUokNDVwpZJny5GSRMY4w5EyaJLtlMpjiNSJeIdkX4
 Vg3A==
X-Gm-Message-State: AOAM531U8VEuzd2+JpjJro1jLZ3tbIybhR70t32Td79NXgELUBN0zUB4
 xPh0j5nKvBmlxpqhs34K620KmhqPYhQ=
X-Google-Smtp-Source: ABdhPJzyYsKaxA81y3eN3ajH25p7y9Pp4lWNgsgceb5+m2smLVbLRYCs6FBdDZdohCha3Ook94fooQ==
X-Received: by 2002:a05:6000:1a89:b0:20a:9e23:584b with SMTP id
 f9-20020a0560001a8900b0020a9e23584bmr8342554wry.359.1650746498599; 
 Sat, 23 Apr 2022 13:41:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b0038eb8171fa5sm4782312wme.1.2022.04.23.13.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 13:41:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 22:39:23 +0200
Message-Id: <20220423203924.1796541-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423203924.1796541-1-fontaine.fabrice@gmail.com>
References: <20220423203924.1796541-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,3/4] package/assimp: force libzlib
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Force libzlib instead of depending on it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/assimp/Config.in | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 833e559a6f..5ffb50cd79 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -2,8 +2,9 @@ config BR2_PACKAGE_ASSIMP
 	bool "assimp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_PACKAGE_LIBZLIB
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
 	  library to import various well-known 3D model formats in a
@@ -14,11 +15,7 @@ config BR2_PACKAGE_ASSIMP
 	  http://www.assimp.org
 
 comment "assimp needs a toolchain w/ C++, wchar"
-	depends on BR2_PACKAGE_LIBZLIB
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
-comment "assimp needs libzlib"
-	depends on !BR2_PACKAGE_LIBZLIB
-
 comment "assimp needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
