Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088C8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A12040278;
	Sat, 22 Jan 2022 19:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsAX_xnAgk02; Sat, 22 Jan 2022 19:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADB8F404BD;
	Sat, 22 Jan 2022 19:10:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 416621BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 828C3408E1
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9GgGY1BDO-s for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF03E408D8
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 880C382972; Sat, 22 Jan 2022 19:02:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 20:08:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 829bf508bba7df9aee3f86bcd70394ee487b19a6
X-Git-Newrev: 24307955a2edf9e112ab815c139ceab83b3d4072
X-Patchwork-Hint: ignore
Message-Id: <20220122190259.880C382972@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_aarch64_virt_defconfig: don't
 hard code getty port
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

commit: https://git.buildroot.net/buildroot/commit/?id=24307955a2edf9e112ab815c139ceab83b3d4072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux defconfig both has VT and serial port support, so it makes more
sense to run getty on /dev/console instead of hard coding the serial port.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/qemu_aarch64_virt_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index e6b72d8838..0caf38112d 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -4,7 +4,6 @@ BR2_cortex_a53=y
 
 # System
 BR2_SYSTEM_DHCP="eth0"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
