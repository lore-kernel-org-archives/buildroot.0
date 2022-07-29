Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66727C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 08:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBC8D41B5A;
	Fri, 29 Jul 2022 08:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBC8D41B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAyOzfab34Rc; Fri, 29 Jul 2022 08:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C155A41B58;
	Fri, 29 Jul 2022 08:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C155A41B58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EDA31BF308
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 364F54183B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 364F54183B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTbNdOv8MqDO for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 08:40:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55EF141B58
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 08:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55EF141B58
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0B9F6868A8; Fri, 29 Jul 2022 08:26:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 10:39:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a4f76a604136b5877b12d069ea4955350d7b47a
X-Git-Newrev: 0005048ec6be44f1bf7b2458beb698f7acf23ccf
X-Patchwork-Hint: ignore
Message-Id: <20220729082646.0B9F6868A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/galileo_defconfig: add missing
 double quotes around BR2_GLOBAL_PATCH_DIR value
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0005048ec6be44f1bf7b2458beb698f7acf23ccf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bogus BR2_GLOBAL_PATCH_DIR value was added in commit
9dd5382d791c3d5197b9ef401a0d103ad1457d5d ("board/intel/galileo: fix
build failure with host gcc 10") back in February.

This should help fixing
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800667, as it
complains with:

WARN: defconfig ./configs/galileo_defconfig can't be used:
      Missing: BR2_GLOBAL_PATCH_DIR=board/intel/galileo/patches

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
