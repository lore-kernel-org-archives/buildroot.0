Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8973C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 12:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E564812AF;
	Tue, 13 Sep 2022 12:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E564812AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETPYhRFvGI-U; Tue, 13 Sep 2022 12:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA0A6812A7;
	Tue, 13 Sep 2022 12:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA0A6812A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96C881BF9B5
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 719CD41519
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 719CD41519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvenlQ1RonRw for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 12:38:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B587410DC
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 12:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B587410DC
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5618F8376F; Tue, 13 Sep 2022 12:38:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 13:54:12 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 43c434f69125e212aa386f59fca46ce34d1cecba
X-Git-Newrev: 302923216e9d31a918994a8e90dc3e9b1e70eb7b
X-Patchwork-Hint: ignore
Message-Id: <20220913123800.5618F8376F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 configs/galileo_defconfig: add missing double quotes around
 BR2_GLOBAL_PATCH_DIR value
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

commit: https://git.buildroot.net/buildroot/commit/?id=302923216e9d31a918994a8e90dc3e9b1e70eb7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

This bogus BR2_GLOBAL_PATCH_DIR value was added in commit
9dd5382d791c3d5197b9ef401a0d103ad1457d5d ("board/intel/galileo: fix
build failure with host gcc 10") back in February.

This should help fixing
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800667, as it
complains with:

WARN: defconfig ./configs/galileo_defconfig can't be used:
      Missing: BR2_GLOBAL_PATCH_DIR=board/intel/galileo/patches

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0005048ec6be44f1bf7b2458beb698f7acf23ccf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/galileo_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index a8fd0a6dcc..312162b7a8 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -1,5 +1,5 @@
 BR2_x86_x1000=y
-BR2_GLOBAL_PATCH_DIR=board/intel/galileo/patches
+BR2_GLOBAL_PATCH_DIR="board/intel/galileo/patches"
 # Needed for TARGET_GRUB2
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Linux headers same as kernel, a 3.14 series
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
