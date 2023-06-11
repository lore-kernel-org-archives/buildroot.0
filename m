Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD49C77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 11:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9795F4028C;
	Sun, 11 Jun 2023 11:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9795F4028C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xt-SebhBybN5; Sun, 11 Jun 2023 11:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B92140286;
	Sun, 11 Jun 2023 11:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B92140286
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4803F1BF5DC
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 11:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2049D41745
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 11:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2049D41745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkLZDJNyrwXi for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 11:58:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6DD74174A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6DD74174A
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 11:57:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f739ec88b2so23866885e9.1
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 04:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686484678; x=1689076678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/+sCl88AtfCUpaTbghOKGEmqW8S3QS1sl8/X5UH2aA=;
 b=ZgZLijaK+ycQIk+rAHlqd8vXNi9ebWXxeEB9XK/GEjMaAhSyhKkVmaYHHjuNMMt6Jf
 PnCf5Py0DryUAvwrrFxfgLyzyiP8A7H9fp7Dkywg/QVLItimAOFbfvuKHPMsz1pnoBtZ
 WnyeGJpaDzuRkdS202YCbW2Pl99DLaredAKBNBFW1ETDpFRAOKjTry99dqJ7ILwf8CPs
 2kIxNd9n2Qu0jTIxmwKUA0li91uUVDBliCYrtX7BngvHI9Jvqf30KB3amRQ8aOOsnTJT
 M06VKAxJmPFMkPn+28h5T/DdjJesB8LZYxbTEC+b2Pa+WTNnTiLAahppSfLzhwYAXq4Y
 lGLg==
X-Gm-Message-State: AC+VfDybcwwDFGud+7k/JP4gWG7yE1r3xZurEYFRW9jYcdwPlcgnJ2R3
 7kbzGRhwymnGadrlCtQIpv1aapUJTD8=
X-Google-Smtp-Source: ACHHUZ5J3kL8n90EDOoCji2PpmhWpgd4HHBvUjxjkrusLiexWrt0X0Mt55y1RxT/poDuQsIXO5FG0g==
X-Received: by 2002:a7b:ce93:0:b0:3f7:678c:74b0 with SMTP id
 q19-20020a7bce93000000b003f7678c74b0mr3978936wmj.12.1686484677718; 
 Sun, 11 Jun 2023 04:57:57 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 b10-20020adfe30a000000b00300aee6c9cesm9499085wrj.20.2023.06.11.04.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 04:57:57 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 13:57:48 +0200
Message-Id: <20230611115748.801929-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611115748.801929-1-romain.naour@gmail.com>
References: <20230611115748.801929-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686484678; x=1689076678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/+sCl88AtfCUpaTbghOKGEmqW8S3QS1sl8/X5UH2aA=;
 b=Vv64F+cqmAwHfbw/tKV3Vg1X8x+477dU7MQyotrOg5+a258kaTOhkv3epT+/OKtjdb
 APg0z8I/xXr1KM0ygIA3L9aYTPU1cEqPZnBvRiWJB/oXL5CF7JmgFJ4Ureu4YcdJL2w3
 h0W35sXGXblzUr1mT2Zq7p9SvCAUsK2f+yJKGCYgLsYAvCzj50xTjp1+1Viv6i+NPe/7
 /yZoAE7qgd6qxWeMIImYSlK7FMcuaIrHncvZK3NKNs8T8R1dsJIeBHXvnoQ1qSAb4jx1
 KXtlgM+b2Y0TTJ1DPBsRnVGfUsQf7p4mYVm6gkXh/6QjFmBkQ4oViUqqErEcFrToN/bm
 EJ8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Vv64F+cq
Subject: [Buildroot] [PATCH 2/2] support/testing: TestGlxinfo: bump the
 toolchain to x86 core2 Bootlin toolchain stable 2022.08-1
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

This new Bootlin toolchain stable 2022.08-1 is based on gcc 11.3.0,
linux headers 4.9.327, glibc 2.35 and binutils 2.38.

Nowadays Bootlin toolchains are packaged in Buildroot and we can
directly select them from BASIC_TOOLCHAIN_CONFIG and avoid
setting the toolchain parameters (BR2_TOOLCHAIN_EXTERNAL_CUSTOM...).

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_glxinfo.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index c7d62a690b..6bedee5298 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -10,14 +10,8 @@ class TestGlxinfo(infra.basetest.BRTest):
         """
         BR2_x86_core2=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2018.11-1.tar.bz2"
-        BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-        BR2_TOOLCHAIN_EXTERNAL_CXX=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
