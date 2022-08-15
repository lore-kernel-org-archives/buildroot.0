Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39876C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 15:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E66840B42;
	Mon, 15 Aug 2022 15:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E66840B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tb6EgNiGpibu; Mon, 15 Aug 2022 15:49:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B78F940B2E;
	Mon, 15 Aug 2022 15:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B78F940B2E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 622971BF3C9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 15:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48B16417AE
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 15:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48B16417AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKKUimIxc4q3 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 15:49:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2766041775
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2766041775
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 15:49:00 +0000 (UTC)
Received: from localhost.localdomain ([151.34.232.41])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NcKloknb6TCpUNcKpowBre; Mon, 15 Aug 2022 17:49:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 17:48:53 +0200
Message-Id: <20220815154854.17628-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815154854.17628-1-giulio.benetti@benettiengineering.com>
References: <20220815154854.17628-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMGw3Jv625cWcr9pGpONkqZ5DURCRaA6Rc7lmT8EIivZuDSrkNcnFaZfVMrCqgShqTtQ2Ms8rO5ILJMYLspZXIRbJJVlXErGkoyydjkJC1zXslbTB5Gj
 fBLRDgCFiDKohprN/l8qI8UNQRd9SPa/bmHatz1vHijsn4grOC5HbNpqFKwMZII7Alr0R4jAgVO76fwngScT6i29WhgU1x7LLspiBR2tEboNq8xns4oQMaij
 HxEJIUwVO27byjIMIij/xKYwZdtxw1dqrm1fXg7SbasLZQvX92fT07XnwDIinJy25QvpYg+aHYfT/oN7l800y0iUgS96ybCIA4D9GuoZ8xqfeoHupLgprtO4
 abQHa4/yIdydfG2+qzHmTfB8IcmQl0AT3Vj4qfLA+NGy8k/0u+BbArv+GyTBgEXT0GlkhFXN/Rj1yiYxWbnwf1hGG19R9w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660578540; bh=6sPzAexxi/bRo+O+jXiSWdk6ALgT2IISztIe/IsYA7U=;
 h=From:To:Subject:Date:MIME-Version;
 b=L8dqcF1/uDGl/rddE7QI3msyKOX9E8JI5g5eGK+Az0Y+UCQhrTDrK6OBE+beP0jjV
 Xc9hU2HGxF7YgFKhwuP9tKZM/sb9sc+9ymNrk/erDPBZljyNh4LuvH0xjQNsshbNlv
 fIdquXIgDLuhVKg/5BnZH9nKMyelEWmV7pUmsDLYo5eXBMvHiKcZeHDFNjeO3uJSfR
 Gk40l87nsLJ6s59J2bh1GlbmJsYnTYSGfTs7NTWkR/pFXWz98WjMm3HUJ5ImpaNetc
 0V5rbEPJGdZ15Ie3pe7dVAjprLlUg5ss9D4mK0/TIuguOmfanx4LexBFeMFtP0B70a
 8Ec0vzh1cDlWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=L8dqcF1/
Subject: [Buildroot] [PATCH 3/4] Revert "configs/olimex_a20_olinuxino_lime:
 use NEON+VFPv4 as FPU strategy"
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

This reverts commit 115ee0521430d89db8be1a79457b0721ceafc484.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_lime_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index b2364ca59a..ba814b98b8 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -2,7 +2,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
-BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.15 LTS series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
