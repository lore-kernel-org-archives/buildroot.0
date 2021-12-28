Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD93C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 20:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D36AF82433;
	Tue, 28 Dec 2021 20:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7OU8QVKnlpx; Tue, 28 Dec 2021 20:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E5EB82416;
	Tue, 28 Dec 2021 20:43:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACE931BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8A228239A
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCLP3c6lWjzX for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 20:42:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9D748136B
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 20:42:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DA37482977; Tue, 28 Dec 2021 20:36:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 21:42:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4807a398e27860ea687c598d06494bec9d6286c
X-Git-Newrev: 81662cf228290f4abd72243730156baabb8b91c9
X-Patchwork-Hint: ignore
Message-Id: <20211228203637.DA37482977@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc/Config.in.host: fix
 BR2_GCC_VERSION_ARC select of BR2_TOOLCHAIN_GCC_AT_LEAST_xyz
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

commit: https://git.buildroot.net/buildroot/commit/?id=81662cf228290f4abd72243730156baabb8b91c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the gcc arc version was bumped to a version using gcc
10.x (arc-2020.09-release) in commit 0791abfba022 (toolchain: update ARC
tools to arc-2020.09-release), the select of BR2_GCC_VERSION_ARC on the
appropriate BR2_TOOLCHAIN_GCC_AT_LEAST_xyz was not updated.

Commit 0b4c7ba01cfe (toolchain: update option descriptions for ARC tools
arc-2020.09-release) fixed the prompt, but still forgot to update the
appropriate BR2_TOOLCHAIN_GCC_AT_LEAST_xyz.

This commit eventually fixes this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index aa2665cbee..a1fe192d3a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -12,7 +12,7 @@ config BR2_GCC_VERSION_ARC
 	bool "gcc arc (10.x)"
 	# Only supported architecture
 	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
