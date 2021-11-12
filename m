Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A718AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:12:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314B260ED4
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 314B260ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9C0060750;
	Fri, 12 Nov 2021 22:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HbEC-m3NBKCK; Fri, 12 Nov 2021 22:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4167360747;
	Fri, 12 Nov 2021 22:12:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B34641C1148
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A210A827BA
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuAywDz2NcAU for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:12:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F989827AF
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:12:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8F5DF8854A; Fri, 12 Nov 2021 22:08:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 23:09:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b88c545efd79ea6e287884213ed6cdab1f670e7a
X-Git-Newrev: 6983c511f9e0ddbefc9d46bdef09f0d4d1a6bb52
X-Patchwork-Hint: ignore
Message-Id: <20211112220833.8F5DF8854A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/raspberrypi/readme.txt:
 add missing dtb files
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

commit: https://git.buildroot.net/buildroot/commit/?id=6983c511f9e0ddbefc9d46bdef09f0d4d1a6bb52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add missing dtb files:
 - bcm2708-rpi-cm.dtb from genimage-raspberrypi.cfg
 - bcm2708-rpi-zero.dtb from genimage-raspberrypi0.cfg:
 - bcm2708-rpi-zero-w.dtb from genimage-raspberrypi0w.cfg
 - bcm2710-rpi-cm3.dtb from genimage-raspberrypi3.cfg
 - bcm2837-rpi-3-b.dtb from genimage-raspberrypi3-64.cfg

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/raspberrypi/readme.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 98c44d80a1..d20096b5e6 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -76,11 +76,16 @@ After building, you should obtain this tree:
     output/images/
     +-- bcm2708-rpi-b.dtb           [1]
     +-- bcm2708-rpi-b-plus.dtb      [1]
+    +-- bcm2708-rpi-cm.dtb          [1]
+    +-- bcm2708-rpi-zero.dtb        [1]
+    +-- bcm2708-rpi-zero-w.dtb      [1]
     +-- bcm2709-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-3-b.dtb         [1]
     +-- bcm2710-rpi-3-b-plus.dtb    [1]
+    +-- bcm2710-rpi-cm3.dtb         [1]
     +-- bcm2711-rpi-4-b.dtb         [1]
     +-- bcm2711-rpi-cm4.dtb         [1]
+    +-- bcm2837-rpi-3-b.dtb         [1]
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
