Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46308C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D0D884CEA;
	Tue, 25 Jan 2022 07:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AD7Uu6h_E_7K; Tue, 25 Jan 2022 07:57:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50AFC84CCB;
	Tue, 25 Jan 2022 07:57:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3228D1BF990
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EBBB400FB
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVhicxTtlsvN for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FDAA40448
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5C7F88277A; Tue, 25 Jan 2022 07:49:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 08:41:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 653fa001f30414165cb54dde577688d78cca6b42
X-Git-Newrev: 1a21705e7314c856dd8f75a66c99913376f3fd0f
X-Patchwork-Hint: ignore
Message-Id: <20220125074920.5C7F88277A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: westmere and
 silvermont were added in gcc 4.9
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a21705e7314c856dd8f75a66c99913376f3fd0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These were added in gcc commit
d3c11974032e21121a051d423a1d71097edf752f ("Use proper Intel processor
names for -march=/-mtune=") which was merged in gcc 4.9.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.x86 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 4beb11662d..0aae26799c 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -196,6 +196,7 @@ config BR2_x86_westmere
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_corei7_avx
 	bool "corei7-avx"
 	select BR2_X86_CPU_HAS_MMX
@@ -273,6 +274,7 @@ config BR2_x86_silvermont
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_k6
 	bool "k6"
 	depends on !BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
