Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB80C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 268A881322;
	Tue, 25 Jan 2022 07:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78bOvY2QBt6d; Tue, 25 Jan 2022 07:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7F4812E7;
	Tue, 25 Jan 2022 07:58:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83DEF1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 469A160BB5
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yisKnQzXz4-7 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69C9660DE5
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7630C82774; Tue, 25 Jan 2022 07:49:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 08:41:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c0088718ebca4166f87606d5fd811a4190750e6
X-Git-Newrev: 4fa073c65fce21e5f8ad0baf74e431f4cb598458
X-Patchwork-Hint: ignore
Message-Id: <20220125074920.7630C82774@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: x86-64-v4 implies
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4fa073c65fce21e5f8ad0baf74e431f4cb598458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have BR2_X86_CPU_HAS_AVX512, we can use it to fix the
x86-64-v4 definition, which implies AVX512 support according to
https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
