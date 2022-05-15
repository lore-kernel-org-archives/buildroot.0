Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3986C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 18:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 739AA40AD9;
	Sun, 15 May 2022 18:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Upss6x0kSD4S; Sun, 15 May 2022 18:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7890340AEC;
	Sun, 15 May 2022 18:18:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 413D21BF424
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 18:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EE6F40AD3
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 18:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MV45_nQyhCtQ for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 18:18:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B8DD40022
 for <buildroot@buildroot.org>; Sun, 15 May 2022 18:18:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2343485E8C; Sun, 15 May 2022 18:07:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 20:10:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b6d07c0b88f9f9219014075e798613d9528a94d
X-Git-Newrev: 92357f4cbe96288b981e4835c15640405ee83139
X-Patchwork-Hint: ignore
Message-Id: <20220515180747.2343485E8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: fix bonnell typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=92357f4cbe96288b981e4835c15640405ee83139
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] added several x86 cpu variant and introduced a typo
(bonnel) on bonnell cpu.

Rename BR2_x86_bonnel to BR2_x86_bonnell without legacy
handling since it never worked.

Fixes:
http://autobuild.buildroot.net/results/2418106d30e07cf09834941e610c75dde78816d2/

[1] 653fa001f30414165cb54dde577688d78cca6b42

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 2560da922b..c770ae3ffe 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -286,9 +286,9 @@ config BR2_x86_atom
 	select BR2_X86_CPU_HAS_SSSE3
 	help
 	  This option is deprecated. Since gcc 4.9, the gcc option
-	  "bonnel" is preferred. Use BR2_x86_bonnel instead.
-config BR2_x86_bonnel
-	bool "bonnel"
+	  "bonnell" is preferred. Use BR2_x86_bonnell instead.
+config BR2_x86_bonnell
+	bool "bonnell"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
@@ -598,7 +598,7 @@ config BR2_GCC_TARGET_ARCH
 	default "broadwell"	if BR2_x86_broadwell
 	default "skylake"	if BR2_x86_skylake
 	default "atom"		if BR2_x86_atom
-	default "bonnel"	if BR2_x86_bonnel
+	default "bonnell"	if BR2_x86_bonnell
 	default "westmere"	if BR2_x86_westmere
 	default "silvermont"	if BR2_x86_silvermont
 	default "goldmont"	if BR2_x86_goldmont
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
