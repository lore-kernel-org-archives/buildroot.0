Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AA9EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C8F48382F;
	Wed, 14 Jun 2023 13:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C8F48382F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jpm5UTqFM8mQ; Wed, 14 Jun 2023 13:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91CAE83A0A;
	Wed, 14 Jun 2023 13:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91CAE83A0A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 105221BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA875837B9
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA875837B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmHHDO0Ii6aJ for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E16E839C0
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E16E839C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFC51836C1; Wed, 14 Jun 2023 13:52:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 15:46:24 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d934ce827caa3e1696acdd56277cca347cd73fbd
X-Git-Newrev: ac08c880a57423ea5eb7301ee1311d5e1ca4e751
X-Patchwork-Hint: ignore
Message-Id: <20230614135234.EFC51836C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] configs/qemu s390x:
 increase image size to 120M
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac08c880a57423ea5eb7301ee1311d5e1ca4e751
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The default kernel configuration for s390x enable a lot of
drivers by default so increase the image site to 120M.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4364600444

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 757251a0deeb28cf4a682bb9db5a438be4c0f925)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_s390x_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index 6bbcca0896..591e6e3369 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -9,6 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Linux headers same as kernel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
