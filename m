Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34725EE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D28B8415F5;
	Sun, 20 Aug 2023 21:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D28B8415F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZJ-vX7pIN3u; Sun, 20 Aug 2023 21:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F4D415F1;
	Sun, 20 Aug 2023 21:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F4D415F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DF821BF86C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBD5360F14
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBD5360F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n__xOedWifTz for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CAF360EE5
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CAF360EE5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B1A385EF6; Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:38:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b661f635b5cc08ded6ab14c19f2370c9f478e52e
X-Git-Newrev: 486a3ba4c3a78668eee1dd4f4b312a75a1b029c5
X-Patchwork-Hint: ignore
Message-Id: <20230820214028.0B1A385EF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ci20_defconfig: bump to kernel
 5.4.254
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

commit: https://git.buildroot.net/buildroot/commit/?id=486a3ba4c3a78668eee1dd4f4b312a75a1b029c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the kernel to the latest release of 5.4 kernel series
to fix an issue with gcc 12.

arch/mips/jz4740/setup.c: In function 'plat_mem_setup':
arch/mips/jz4740/setup.c:64:25: error: comparison between two arrays [-Werror=array-compare]
   64 |         if (__dtb_start != __dtb_end)
      |                         ^~
arch/mips/jz4740/setup.c:64:25: note: use '&__dtb_start[0] != &__dtb_end[0]' to compare the addresses
  CC      fs/debugfs/file.o
cc1: all warnings being treated as errors

Fixed in v5.4.195:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a60def7568216684f62b117c199429c4a9a89570

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436573

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/ci20_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 09eddc4e68..7e119376e1 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci20/genimage.cfg"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.254"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
