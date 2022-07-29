Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E9DC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15BBF82AED;
	Fri, 29 Jul 2022 20:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15BBF82AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1PwH1EBvfI1; Fri, 29 Jul 2022 20:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B64882AB9;
	Fri, 29 Jul 2022 20:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B64882AB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03F761BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3403606BF
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3403606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bek0pLMRIsDo for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:45:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B043605B7
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B043605B7
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 20:45:00 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HWqwoCSBJbMeiHWqxoSVQB; Fri, 29 Jul 2022 22:44:59 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 22:44:57 +0200
Message-Id: <20220729204457.7266-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220729204457.7266-1-giulio.benetti@benettiengineering.com>
References: <20220729204457.7266-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDUyl+SLTYi2B93uH5l4ZfoKWf2Fkw7+TM5HOPdRGSVahqOwCtgcuzh03yT55n4NShjSmUD0/vI6DLyNkrPGz8uKHWeZydXzw23r0lTJqBtQB8BufFRW
 /LEc2X1aIm/ONz8/E6H4JhTy78C8PYVDIKNav0OdAtx4HhFkAaxEpA9IpFD8Z6zll9k8zcpTzEmYyr9SlZpW5qT5KY7WAZMimkPLXVSbbzGbtHXg00ql6/jT
 wJ2lkYd29D1bFlnWBe8WnKzdWOP2lnBRhG1A1nMgeQs3NVHLlQRFTM088tyV33DziX62VBnAmW64I+WV7B8E5esO9BqF1igSVOCpuzcjdEaO0qvP17dL23wc
 41hhr1fFOEENlVoE8zwYbS/BO3JN5Ql1yygxSHKoQJoBNxeXmVx5LBVYxitj/4eV4dK1dp67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659127499; bh=Hvb3zF+afNE86U5IPwmykpYHpMdsOHudrVC4zDDIT4A=;
 h=From:To:Subject:Date:MIME-Version;
 b=EMF3lvtGUK0vnFyXEcTn1asZZMKk/rntygPRACvNkQNif6OnDf3glZMytax6ANhjo
 k7hkPUmxZLulF43qJjdFhC5My8M2b6ZDJGVRy3LTPiUexyBMx8fLgvO03VxnP6ZwAk
 xuxMr/A7SQt2N5DGzC77uAdKTQWyY/o++MCgwZk/2M1TC0uA6SDbjbeo/qa9SbjdW1
 DiIIaSSnEJCtO64hd+vplNOFxIsyUDqWc6zmcAKZuyRnOF8Ix8BE+8AGuXcrwZv9wb
 oUqE0VRsnsAJdaOuerGS93BazJtr9X9a1HYtSt1K+RGfm6MVfRA24h4UFFHkFGQaFX
 RyDNxInAbjU6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=EMF3lvtG
Subject: [Buildroot] [PATCH] toolchain/Config.in: improve gcc bug 83143
 condition
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This makes the condition easier to read and it's easier to maintain the
gcc bug too because we don't have to take care about new gcc versions.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index d2fc347d36..507075a351 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -147,9 +147,9 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 # it still not been fixed yet.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_83143
 	bool
-	default y if BR2_sh
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
-		   BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on BR2_sh
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
