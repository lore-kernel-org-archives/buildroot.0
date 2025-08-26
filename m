Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9810CA0FE7
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 20:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A292404C8;
	Tue, 26 Aug 2025 20:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVc4lPKq_tYh; Tue, 26 Aug 2025 20:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D151F404B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D151F404B5;
	Tue, 26 Aug 2025 20:06:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63AF2B8C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 20:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54ACD40118
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 20:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zj5gi1qublyC for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 20:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78897400A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78897400A0
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 20:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6689F87AFC; Tue, 26 Aug 2025 20:06:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Aug 2025 22:00:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30bc19f730a3897c51fbd43881407dcfc6fe36ad
X-Git-Newrev: 36eed021b6cb291e4892e4749e8b123aed328ba4
X-Patchwork-Hint: ignore
Message-Id: <20250826200608.6689F87AFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.arm: fix typo in help text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=36eed021b6cb291e4892e4749e8b123aed328ba4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index c5695c1eba..a0bf6c3386 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -785,7 +785,7 @@ config BR2_ARM_INSTRUCTIONS_THUMB
 	# Thumb-1 and VFP are not compatible
 	depends on BR2_ARM_SOFT_FLOAT
 	help
-	  This option instructions the compiler to generate Thumb
+	  This option instructs the compiler to generate Thumb
 	  instructions, which allows to mix 16 bits instructions and
 	  32 bits instructions. This generally provides a much smaller
 	  compiled binary size.
@@ -798,7 +798,7 @@ config BR2_ARM_INSTRUCTIONS_THUMB2
 	bool "Thumb2"
 	depends on BR2_ARM_CPU_HAS_THUMB2
 	help
-	  This option instructions the compiler to generate Thumb2
+	  This option instructs the compiler to generate Thumb2
 	  instructions, which allows to mix 16 bits instructions and
 	  32 bits instructions. This generally provides a much smaller
 	  compiled binary size.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
