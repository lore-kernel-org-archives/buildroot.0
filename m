Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F94C433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C74E60BE8;
	Fri, 30 Sep 2022 15:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C74E60BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFnJYl3dA0DU; Fri, 30 Sep 2022 15:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A3016112D;
	Fri, 30 Sep 2022 15:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A3016112D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9055A1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C45A40B9D
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C45A40B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hkv1sSpOEhfT for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:22:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1B3B40157
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1B3B40157
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F8588669E; Fri, 30 Sep 2022 15:22:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:22:16 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 5ffccb1ec51c20a4abadd06795dc66334580be63
X-Git-Newrev: 95ed78ab7d26f45af09485b57a8ec0e33d70a4cb
X-Patchwork-Hint: ignore
Message-Id: <20220930152251.8F8588669E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
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
Content-Type: multipart/mixed; boundary="===============1100494613150866863=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1100494613150866863==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=95ed78ab7d26f45af09485b57a8ec0e33d70a4cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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

--===============1100494613150866863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1100494613150866863==--
