Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09D2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 23:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B0254063A;
	Mon, 24 Jan 2022 23:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6zZ4EXdz1Ds; Mon, 24 Jan 2022 23:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 991AB4029F;
	Mon, 24 Jan 2022 23:04:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D81ED1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D544F84C31
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Th--QJX23aoM for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 23:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFDB384BA2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 23:01:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8CD291C0005;
 Mon, 24 Jan 2022 23:01:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 00:01:14 +0100
Message-Id: <20220124230116.203218-17-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 16/16] arch/Config.in.x86: indicate how the CPU
 variants are ordered
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

They are loosely ordered according to the ordering of the gcc
documentation. It is not entirely correct as the generic x86-64,
x86-64-v2, x86-64-v3 and x86-64-v4 are listed before i386 in the gcc
documentation, but this nevertheless gives a good explanation for the
overall ordering of the list.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index cae5502051..27f2bfcd4c 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -22,6 +22,9 @@ config BR2_X86_CPU_HAS_AVX2
 config BR2_X86_CPU_HAS_AVX512
 	bool
 
+# This list of CPU architecture variant is (loosely) ordered according
+# to the gcc documentation at
+# https://gcc.gnu.org/onlinedocs/gcc-11.2.0/gcc/x86-Options.html
 choice
 	prompt "Target Architecture Variant"
 	default BR2_x86_i586 if BR2_i386
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
