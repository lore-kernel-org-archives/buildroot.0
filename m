Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586DDE732C7
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 12:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 007B983180;
	Thu, 28 Sep 2023 12:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 007B983180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKWfMjfrz2iT; Thu, 28 Sep 2023 12:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CD33833CA;
	Thu, 28 Sep 2023 12:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CD33833CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24E101BF82F
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 12:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B2D841B68
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 12:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B2D841B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWoPc1BFMlDd for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 12:41:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD64741B3D
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 12:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD64741B3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8DAD82AD1; Thu, 28 Sep 2023 12:41:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 14:36:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ede7d0bd77ce6110f20c83b3f32462e247b6fc49
X-Git-Newrev: d15bc66b9a809427b6bc1c7f5d6d3e661acb4b3f
X-Patchwork-Hint: ignore
Message-Id: <20230928124109.C8DAD82AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/visionfive2_defconfig: bump custom
 kernel version to 05533e9c31
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

commit: https://git.buildroot.net/buildroot/commit/?id=d15bc66b9a809427b6bc1c7f5d6d3e661acb4b3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current kernel fails to build with GCC>=12:
  AS      arch/riscv/kernel/vdso/note.o
./arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
./arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01', extension `zicsr' required
./arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01', extension `zicsr' required

So use latest kernel from starfive repo.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/visionfive2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 5b07a8efbc..dc086953a0 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,7b7b4eddd8d5ae55f6e0ee09b93e16e23ab4f97b)/linux-7b7b4eddd8d5ae55f6e0ee09b93e16e23ab4f97b.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,05533e9c31d6f0da20efc2d436a3b0f6d516ed4b)/linux-05533e9c31d6f0da20efc2d436a3b0f6d516ed4b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="starfive_visionfive2"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-visionfive-v2"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
