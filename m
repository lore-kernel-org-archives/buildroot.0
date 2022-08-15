Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244EEC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 15:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 996B741970;
	Mon, 15 Aug 2022 15:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 996B741970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_1VC6C8qoha; Mon, 15 Aug 2022 15:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 388CA41916;
	Mon, 15 Aug 2022 15:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 388CA41916
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5ADBD1BF3C9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 15:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33A304177E
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 15:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33A304177E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wxuoAHFz4HJw for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 15:49:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BAED417AC
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BAED417AC
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 15:49:01 +0000 (UTC)
Received: from localhost.localdomain ([151.34.232.41])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NcKloknb6TCpUNcKqowBsR; Mon, 15 Aug 2022 17:49:01 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 17:48:54 +0200
Message-Id: <20220815154854.17628-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815154854.17628-1-giulio.benetti@benettiengineering.com>
References: <20220815154854.17628-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNkLs3t+fjd+2LjEKnTb2lAyhbaWYMuqTkeHIsu7ceTt73Fj1OkWO+y8rmVpAhisAMet5Yl2i+gD6S8Xy1y6EoQp3zlC/cXDPjimjmNrwyDBeGx0Icn4
 iIiNVT+CDnKXGfCPfBuWBBhkVNb3uAGmnpUhxzyjn9C0giYf2MQNvq/NjrxEuXeSSfjHrsGstiT66Xdf7IVGq6aN4y4su0nE1M6ipZR1g6XvttclgFN9izHq
 wHa/SQr3TrCjVtdcLlZ6zgbgs08OV86TxQsmQmXBvYemmCVtxBG+1or8h5ZoYuxHzzjQsXNQqBhvN0OmTnUNDqMoQeL6ywu9wlSaxBybVichfa8yyabpLI8P
 NJEgAlwBn90vUygwtFOsr0+7Mem/vDzDMLYk7kfDrrK83HCtTOzjr3KqtlPDJ71HM5q9XOAKnTkrVhceHVxOeKxHRT3Wng==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660578541; bh=/jiHdcqaabSj+1Vio+eN+h1SHFVCczmfGik+eh1Vldg=;
 h=From:To:Subject:Date:MIME-Version;
 b=TDbTe0YA3zmuHKhjFzZbUkJpf2QAW22CuULHuqoecHNuL/nCzvjTtwWUINSfhFUg5
 JH1NOtnBrjm21ScN9IYJIhDkLIM3Z/cn9OJtMVpRHdAxD6/Lm+MMqOwW+Xsj/WPezK
 EvA4JD2/IermrSVdC8HiDdYBZKUdRyQqkzEKMFI3qTq/x2JO5gWHaYD7jqF9EFvXjC
 Ob9KT/MuModY7bLNHYVHd4r7+jQR4YIlRGuOHKYOYrWT6R15JruGF21Q2175UiEkiz
 CBRl/o5tRrFi8i0kWEjR3m8ONhc04DgeDInBaD88WjzHk0IPUdjnYMLjwu4uFcs5wI
 2dsXOewt0pSVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TDbTe0YA
Subject: [Buildroot] [PATCH 4/4] Revert "configs/bananapi_m1: use NEON+VFPv4
 as FPU strategy"
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gcc man page states that specifying Neon as part of the fpu setting
has no effect, unless the -funsafe-math-optimizations is also specified,
because Neon is not compliant with IEEE 754:
```
    If the selected floating-point hardware includes the NEON extension
    (e.g. -mfpu=neon), note that floating-point operations are not
    generated by GCC's auto-vectorization pass unless
    -funsafe-math-optimizations is also specified. This is because NEON
    hardware does not fully implement the IEEE 754 standard for
    floating-point arithmetic (in particular denormal values are treated
    as zero), so the use of NEON instructions may lead to a loss of
    precision.
```

-funsafe-math-optimizations must be explictly specified per package to
really use NEON as FPU, but it's something that is left to the user as
well as setting BR2_ARM_FPU_NEON_VFPV4. This way the default
BR2_ARM_FPU_VFPV4D16 is used as previously. So let's revert the
offending patch.

This reverts commit aaced92e8c69e3eb71c2cba4c5ae6a1770ae8972.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/bananapi_m1_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/bananapi_m1_defconfig b/configs/bananapi_m1_defconfig
index 2d948ec223..23da363345 100644
--- a/configs/bananapi_m1_defconfig
+++ b/configs/bananapi_m1_defconfig
@@ -1,6 +1,5 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
