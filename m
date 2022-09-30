Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D05C433F5
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79D9B41DAA;
	Fri, 30 Sep 2022 15:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79D9B41DAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05bDczFGwxpZ; Fri, 30 Sep 2022 15:24:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39DA141DA3;
	Fri, 30 Sep 2022 15:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39DA141DA3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88A611BF3DE
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FF9960BE8
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FF9960BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDIRF87g4ar0 for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:24:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93BF860E80
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93BF860E80
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28693866A4; Fri, 30 Sep 2022 15:24:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:22:03 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 69c50f1f26966434c0aff5a873f7f950ac639831
X-Git-Newrev: 838b6fd5081844b27d2fbe6b47660b306fedd59b
X-Patchwork-Hint: ignore
Message-Id: <20220930152400.28693866A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 board/powerpc/ppc64le-pseries: set x-vof on qemu command line
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
Content-Type: multipart/mixed; boundary="===============4276409827411252178=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4276409827411252178==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=838b6fd5081844b27d2fbe6b47660b306fedd59b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This uses a newer firmware implementation that is much faster at
booting. It is supported as of Qemu 7.0.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1fca098295bcae0c277a2a89873afdedb1145026)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/ppc64le-pseries/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc64le-pseries/readme.txt b/board/qemu/ppc64le-pseries/readme.txt
index 8ee72ea6cf..3d5577aa32 100644
--- a/board/qemu/ppc64le-pseries/readme.txt
+++ b/board/qemu/ppc64le-pseries/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-qemu-system-ppc64 -M pseries -cpu POWER8 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses # qemu_ppc64le_pseries_defconfig
+qemu-system-ppc64 -M pseries,x-vof=on -cpu POWER8 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses # qemu_ppc64le_pseries_defconfig
 
 The login prompt will appear in the terminal window.

--===============4276409827411252178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4276409827411252178==--
