Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF62C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18AB560A7B;
	Wed,  2 Nov 2022 20:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18AB560A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rWWZjZfw63We; Wed,  2 Nov 2022 20:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41621607D1;
	Wed,  2 Nov 2022 20:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41621607D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE8B11BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9C15408E3
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9C15408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmQFG5nUfHfH for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:19:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94692400D0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94692400D0
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:19:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 3E7C320007;
 Wed,  2 Nov 2022 20:19:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 21:18:54 +0100
Message-Id: <20221102201858.555294-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667420343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SSgkBZSTDtRwHhVh7ZULvzb8CuWb9qQP4EJpiJ2Zl9E=;
 b=fB3X2t9Qh77BH12caH48LVru2Jmnsf88n8WaMg3tzxZ6gsgI2iDgC74K43c6kjq6O9e3jP
 J1M2cLC3eScZiDE4dp7ZoDaAmJJtFt9MmE0Yb7AiXy5u9SZ/KzBcYRmq/tHdo7yo8V3X1d
 SC/vgOvhvucIQrS41RsSyNzRK8nuXVpETuOflCuU7H3Aeb8cFWBLaLcmFD3arPX+WsRXhl
 uq3XeogHrZCVwEDneSF6+jZpuGnvRCnDch5iYqKECS6afoF5FwEfunRIttXhVKYEt562x5
 UUkkLkojmoOwNHR/A5X1uiZrVPCC0r1oa4LfhGNFHq72Pff+3eJLsCyaqkF4gA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fB3X2t9Q
Subject: [Buildroot] [PATCH 0/3] Another small set of defconfig removals
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Here is another 3 defconfigs that have failed to build, and for which
the build failures were already reported on August 6, 2022 with no
feedback from the maintainer for those platforms.

If there is no feedback, I propose to remove those defconfigs in one
week, i.e on November 9, 2022.

Thomas

Thomas Petazzoni (3):
  configs/roc_pc_rk3399: remove defconfig
  configs/rock_pi_4: remove defconfig
  configs/rock_pi_n10: remove defconfig

 DEVELOPERS                                |  6 ---
 board/firefly/roc-rk3399-pc/extlinux.conf |  4 --
 board/firefly/roc-rk3399-pc/genimage.cfg  | 22 --------
 board/firefly/roc-rk3399-pc/post-build.sh |  5 --
 board/firefly/roc-rk3399-pc/readme.txt    | 40 ---------------
 board/radxa/rockpi-4/extlinux.conf        |  4 --
 board/radxa/rockpi-4/genimage.cfg         | 39 ---------------
 board/radxa/rockpi-4/post-build.sh        |  5 --
 board/radxa/rockpi-4/readme.txt           | 61 -----------------------
 board/radxa/rockpi-n10/extlinux.conf      |  4 --
 board/radxa/rockpi-n10/genimage.cfg       | 39 ---------------
 board/radxa/rockpi-n10/post-build.sh      |  5 --
 board/radxa/rockpi-n10/readme.txt         | 61 -----------------------
 configs/rock_pi_4_defconfig               | 55 --------------------
 configs/rock_pi_n10_defconfig             | 55 --------------------
 15 files changed, 405 deletions(-)
 delete mode 100644 board/firefly/roc-rk3399-pc/extlinux.conf
 delete mode 100644 board/firefly/roc-rk3399-pc/genimage.cfg
 delete mode 100755 board/firefly/roc-rk3399-pc/post-build.sh
 delete mode 100644 board/firefly/roc-rk3399-pc/readme.txt
 delete mode 100644 board/radxa/rockpi-4/extlinux.conf
 delete mode 100644 board/radxa/rockpi-4/genimage.cfg
 delete mode 100755 board/radxa/rockpi-4/post-build.sh
 delete mode 100644 board/radxa/rockpi-4/readme.txt
 delete mode 100644 board/radxa/rockpi-n10/extlinux.conf
 delete mode 100644 board/radxa/rockpi-n10/genimage.cfg
 delete mode 100755 board/radxa/rockpi-n10/post-build.sh
 delete mode 100644 board/radxa/rockpi-n10/readme.txt
 delete mode 100644 configs/rock_pi_4_defconfig
 delete mode 100644 configs/rock_pi_n10_defconfig

-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
