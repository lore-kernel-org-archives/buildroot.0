Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B20C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 12:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7B3741503;
	Tue, 13 Sep 2022 12:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7B3741503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBYk-6kKaCkN; Tue, 13 Sep 2022 12:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68D1410DB;
	Tue, 13 Sep 2022 12:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B68D1410DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D7531BF3AD
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 269B060E46
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 269B060E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p25_jycaH_pW for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 12:36:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5778B60E44
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 12:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5778B60E44
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 44F0B83755; Tue, 13 Sep 2022 12:36:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 13:54:22 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f18d87065387e58df9b751aaa7f6df52695e7ca3
X-Git-Newrev: afd83944f679ea1ef4a0216db421eafeedeacd4e
X-Patchwork-Hint: ignore
Message-Id: <20220913123609.44F0B83755@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=afd83944f679ea1ef4a0216db421eafeedeacd4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
