Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAEACD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A680740A75;
	Tue,  3 Sep 2024 19:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5LCuF0nPp3B; Tue,  3 Sep 2024 19:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 144FF40A22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 144FF40A22;
	Tue,  3 Sep 2024 19:23:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7666C1BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FBEC80F09
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CW_mGxt2-ky for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C73B880F27
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C73B880F27
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:23:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1E9886B44; Tue,  3 Sep 2024 19:23:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:21:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2245396b20db0c658323e16886a65ba2215dc9a7
X-Git-Newrev: ee95c4c3f8a8b1af869737ae14508fb80fdf27cc
X-Patchwork-Hint: ignore
Message-Id: <20240903192326.B1E9886B44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/radxa/rock5b: use
 PARTLABEL to specify rootfs
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee95c4c3f8a8b1af869737ae14508fb80fdf27cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This board has an optional eMMC module.

Use PARTLABEL to specify the rootfs, as this works regardless of the mmc
device probe order.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/radxa/rock5b/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rock5b/extlinux.conf b/board/radxa/rock5b/extlinux.conf
index 9832255992..c4198deaa0 100644
--- a/board/radxa/rock5b/extlinux.conf
+++ b/board/radxa/rock5b/extlinux.conf
@@ -1,4 +1,4 @@
 label Radxa Rock 5b Linux
   kernel /boot/Image
   devicetree /boot/rk3588-rock-5b.dtb
-  append root=/dev/mmcblk1p1 earlycon rootwait
+  append root=PARTLABEL=rootfs earlycon rootwait
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
