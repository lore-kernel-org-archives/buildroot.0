Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16403C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4189416CE;
	Fri, 28 Feb 2025 16:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rH5dNhXFo22o; Fri, 28 Feb 2025 16:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A34DC406FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A34DC406FE;
	Fri, 28 Feb 2025 16:11:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB1DC1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9723C8472D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1MrKCVBFIvs for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 635EB80E54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 635EB80E54
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:11:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E80487BA2; Fri, 28 Feb 2025 16:11:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 17:09:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eec0f25734f352d84cb9b18f65c5490cd79b94c1
X-Git-Newrev: 89d63110f917fad22b9c2a01549ee77cd4c61dfa
X-Patchwork-Hint: ignore
Message-Id: <20250228161115.4E80487BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: drop hash ignore for
 octavo defconfigs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=89d63110f917fad22b9c2a01549ee77cd4c61dfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/9276194113

Commit b71d7eae59 ("board/octavo: Add FORCE_CHECK_HASHES config and custom
hashes") added download hashes for the octavo defconfigs but forgot to
update .checkpackageconfig.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7395389adb..66b3e100bb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -185,8 +185,6 @@ configs/nitrogen8m_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
-configs/octavo_osd32mp1_brk_defconfig lib_defconfig.ForceCheckHash
-configs/octavo_osd32mp1_red_defconfig lib_defconfig.ForceCheckHash
 configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
 configs/odroidxu4_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a10_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
