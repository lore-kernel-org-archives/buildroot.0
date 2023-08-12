Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F46EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3CA941181;
	Mon, 21 Aug 2023 20:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3CA941181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TsNtzAwe7jW; Mon, 21 Aug 2023 20:19:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B82840BB3;
	Mon, 21 Aug 2023 20:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B82840BB3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 516321BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC0ED4136B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC0ED4136B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w9RQ_Ztc2dJU for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FC9A41610
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FC9A41610
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BC0E86024; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:52:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2bd93a30a60ad224f0ee974878d9d9b5dd1206af
X-Git-Newrev: 0a5bb69982f759e64251e61dd29ec28ee3771fd4
X-Patchwork-Hint: ignore
Message-Id: <20230821200126.9BC0E86024@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/qemu/ppc64le-powernv8:
 fixup paths to images in qemu command line
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a5bb69982f759e64251e61dd29ec28ee3771fd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use full relative pathes for rootfs and kernel, like in other
readme's.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/ppc64le-powernv8/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc64le-powernv8/readme.txt b/board/qemu/ppc64le-powernv8/readme.txt
index 059f55fbc9..b57c97464a 100644
--- a/board/qemu/ppc64le-powernv8/readme.txt
+++ b/board/qemu/ppc64le-powernv8/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-qemu-system-ppc64 -M powernv9 -kernel vmlinux -append "console=hvc0 rootwait root=/dev/nvme0n1" -device nvme,bus=pcie.3,addr=0x0,drive=drive0,serial=1234 -drive file=./rootfs.ext2,if=none,id=drive0,format=raw,cache=none -device e1000e,netdev=net0,mac=C0:FF:EE:00:01:03,bus=pcie.1,addr=0x0  -netdev user,id=net0 -serial mon:stdio -nographic # qemu_ppc64le_powernv8_defconfig
+qemu-system-ppc64 -M powernv9 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/nvme0n1" -device nvme,bus=pcie.3,addr=0x0,drive=drive0,serial=1234 -drive file=output/images/rootfs.ext2,if=none,id=drive0,format=raw,cache=none -device e1000e,netdev=net0,mac=C0:FF:EE:00:01:03,bus=pcie.1,addr=0x0  -netdev user,id=net0 -serial mon:stdio -nographic # qemu_ppc64le_powernv8_defconfig
 
 The login prompt will appear in the terminal window.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
