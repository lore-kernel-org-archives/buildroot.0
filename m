Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA2AEE3F09
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 18:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 805548133B;
	Tue, 12 Sep 2023 18:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 805548133B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZjJk2cbS1_A; Tue, 12 Sep 2023 18:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC9A581331;
	Tue, 12 Sep 2023 18:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC9A581331
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FAF41BF2A5
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74FCF415C8
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74FCF415C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-KOdNwqtOLs for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE90D4042B
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE90D4042B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AADA86701; Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 20:00:12 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: e8eecbff45e99720a908ff7870724b9ec09ce871
X-Git-Newrev: ca84d11e2fe2bd8888d5e1020af4e957730d4098
X-Patchwork-Hint: ignore
Message-Id: <20230912182931.9AADA86701@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x]
 board/qemu/ppc64le-powernv8: fixup paths to images in qemu command line
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca84d11e2fe2bd8888d5e1020af4e957730d4098
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Use full relative pathes for rootfs and kernel, like in other
readme's.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0a5bb69982f759e64251e61dd29ec28ee3771fd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
