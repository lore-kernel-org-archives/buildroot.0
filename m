Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331A8C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B086F40CC3;
	Mon, 31 Jul 2023 22:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B086F40CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M10KutEtxT_4; Mon, 31 Jul 2023 22:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9782D40147;
	Mon, 31 Jul 2023 22:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9782D40147
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB511BF378
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F7F740AFF
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F7F740AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pmow9HWeIpyH for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:47:07 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 886BB40147
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 886BB40147
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6bc93523162so2103741a34.2
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 15:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690843626; x=1691448426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gGZFXIuqRPB/A1DcPTqFOXZ2PnXlimmw8o8vMyuhehg=;
 b=j5jSZBn/3OmClS9z/+g87g96cIiQK2cAqf/4qn1pBK4mUGac3ZBZGptr99f3yILMin
 7JcmltT5bwW00n38SkiX3Jfl2KxzmNu3kq/b0w2f2E5i+S1WjYaIeGgV6XUxarHprzkz
 tMVfP3ZYvP/MOiHXGr0wpjfoxTtLQGA+ukVs0+tRlsElL26TfX3ByjzrMdKPvuLhy4W3
 J/8rCZYWrOrF+ek86+leeA2ip15//ip/g/GD2NDxzDvwFBPujktv7YxJ6Aq4uyRBgl+a
 c0rMlG2UyJiscul/JWogcR3/k5YOyOPnbuKh3OQ/f7kSMkNkTrIjqWyCHS9EJt3AO+vU
 Ndaw==
X-Gm-Message-State: ABy/qLaR5aFkLghwVpR2EC4a1vgOqnz5OMW/ORkRsSnZNQkLRKMmaIV7
 UePD9jEzEh8cmyJZ52BnwzWzbdj/63Y=
X-Google-Smtp-Source: APBJJlGx7NwOixX3dWmVV61EPL8dLhAIEvkITC2QdswJ2gb3Ugk8IH4O6XAHxW0Of7m6Dj2hqhMiCQ==
X-Received: by 2002:a05:6870:1495:b0:1bf:6ec:dd4d with SMTP id
 k21-20020a056870149500b001bf06ecdd4dmr1093559oab.28.1690843625902; 
 Mon, 31 Jul 2023 15:47:05 -0700 (PDT)
Received: from localhost.localdomain
 (76-250-43-185.lightspeed.mdsnwi.sbcglobal.net. [76.250.43.185])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a056870450100b001bb7a3ab484sm4866052oao.16.2023.07.31.15.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 15:47:05 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 17:47:03 -0500
Message-Id: <20230731224703.2923-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690843626; x=1691448426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gGZFXIuqRPB/A1DcPTqFOXZ2PnXlimmw8o8vMyuhehg=;
 b=cDXNo5HtP37MdF5DA2T7EBRXVC2ZIlybE3xPe+A2WuJimRSGcvfItIFLzL1W9QtTrd
 QyGZN3n3aehVPSVK0XummyUQwaUaatenzKTWX6PXn8WtmQrzI1WwSaM53ozINW1m2GLr
 3OWlDS7BDyaUQ4CO+1zqCJzqqz8skyYq3GjaBebXV2v7L+ic52cXwfpex+59pcddez4Q
 y89ZE07vGRLcoqQgkRlQx7DHt9N2ux5zVnWQOgv17t0bQGS3NOzIush2iDB6DJlvlAQq
 p3BOHrB4xJ9Ix+d84ufgEIghMqxhWyil8c0Zbd/fmT+qSZXIY3C5dAfkC6BW/VKY0Jk3
 J0dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cDXNo5Ht
Subject: [Buildroot] [PATCH 1/1] arch/Config.in.x86: consolidate AMD Geode
 CPU targets
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
Cc: Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since its introduction in 7d8a59b40, the BR2_x86_geode CPU target has
pointed to GCC -march=geode which targets AMD Geode processors [0].

This arch tuning enables MMX and 3DNow! extensions in GCC but these were
never reflected in the selected flags by BR2_x86_geode.

This is likely due to the confusing naming and history of "Geode".

The AMD Geode can trace its origins back to the Cyrix MediaGXm [1] and
then to the NSC Geode GXm/GXLV/GX1/GX2 [2]. All of these processors have
MMX instruction support listed in their datasheets. The GX2 was the
first in the series to enable 3DNow!.

When 7fed07d3a4a introduced BR2_X86_CPU_HAS_MMX, the Geode was skipped
presumably because Wikipedia documentation is incomplete [2] with regards
to supported instructions and wasn't aware the target was AMD Geode.

When f6cd56b9ce3 introduced BR2_X86_CPU_HAS_3DNOW, Geode was skipped
presumably for similar reasons.

The in-tree olpc_xo1_defconfig uses BR2_x86_geode as this hardware uses
the AMD Geode [3].

Clarify in the menu label that this is the AMD Geode and add both MMX
and 3DNow! flags.

[0]: https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/geode.md;;hb=HEAD
[1]: https://en.wikipedia.org/wiki/MediaGX#MediaGXm
[2]: https://en.wikipedia.org/wiki/Geode_%28processor%29
[3]: https://wiki.laptop.org/go/Hardware_specification

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 arch/Config.in.x86 | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 86e148dee6..49823fe885 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -705,22 +705,10 @@ config BR2_x86_zen4
 	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 config BR2_x86_geode
-	bool "geode (no mmx)"
-	depends on !BR2_x86_64
-	help
-	  For several variant of geode which have not MMX support.
-	  See https://en.wikipedia.org/wiki/Geode_%28processor%29 to
-	  determine if your particular Geode processor supports MMX or
-	  not.
-config BR2_x86_geode_mmx
-	bool "geode (with mmx)"
+	bool "AMD Geode"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
-	help
-	  For several variant of geode which have MMX support.
-	  See https://en.wikipedia.org/wiki/Geode_%28processor%29 to
-	  determine if your particular Geode processor supports MMX or
-	  not.
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	depends on !BR2_x86_64
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
