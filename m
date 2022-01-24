Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B270C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 23:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEE4060F6E;
	Mon, 24 Jan 2022 23:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-LOoVZDnpHa; Mon, 24 Jan 2022 23:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B2560EED;
	Mon, 24 Jan 2022 23:03:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F99C1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 171DD414C3
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nG3FDhcJGso6 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 23:01:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A24B414C2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 23:01:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 754F0E000A;
 Mon, 24 Jan 2022 23:01:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 00:01:07 +0100
Message-Id: <20220124230116.203218-10-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/16] arch/Config.in.x86: x86-64-v4 implies
 AVX512
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

Now that we have BR2_X86_CPU_HAS_AVX512, we can use it to fix the
x86-64-v4 definition, which implies AVX512 support according to
https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 6b18580ae4..2034fb3bb7 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -146,6 +146,7 @@ config BR2_x86_x86_64_v4
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 	help
 	  This option corresponds to the x86-64-v4 micro-architecture
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
