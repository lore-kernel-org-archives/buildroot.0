Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F837C4708E
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 00:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC9781F0E;
	Wed,  4 Jan 2023 00:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC9781F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t5gUOLdVlxTH; Wed,  4 Jan 2023 00:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8225581F10;
	Wed,  4 Jan 2023 00:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8225581F10
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BAF21BF962
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 00:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAC6A417C7
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 00:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAC6A417C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tast0szL2dMP for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 00:21:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A0E4417C3
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A0E4417C3
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 00:21:19 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CrWtpAYj2eo8HCrWup7N9C; Wed, 04 Jan 2023 01:21:16 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  4 Jan 2023 01:21:09 +0100
Message-Id: <20230104002113.1038775-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAatUBph3vkZy8UUv1X1mx1FWTdn1pfYKe39KoN1Mv/62lhUe6guenYbpRDTo/6smltP1FEy4DgUsEwa2gLBWpZsGDRUEmbTQS0szol69J6enJJ3yS5G
 YkKTq3lFUo+DViaLND79G4su99eqlErRzYVz7YoNCnr66MmnvcZ29ecX5G23cxhfwkDSwcmwb3eOQtaDkxRN6rOoNsycA622+QKzYFf6nsHqUdX8+l9rfdEi
 bWmcxs4HUwHrdsgYLqoIr3DIiuZdxhnEnZL3f3fWXUHuPUGbpvttgBSl4GKqL4VEgvHMlbRg90YtRBmL06Vu7A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672791676; bh=1sLZKdYImzcg4thDk33oyVu8fEQ/bHdbZsvdydzv7u4=;
 h=From:To:Subject:Date:MIME-Version;
 b=TQ2E3NwnbMO4EDYNC0isquojBFOplJ30svOrp7hR1GNn8lDi4KF5M5X2W/DRIP+s0
 aE+wuWyJewdxCFeMFz4+fLPXgQvyh4+qymN3d1KRYjXCWqDqsVMPIPEcrDpeBJbnF5
 vWflfOmvKCsPjJHRRUI9VORBn/y+7VMozOk/FlsqFot6ZY2rIdHgW/TtFStu1giLbF
 SI93CXGb7FbXfLzeVRY8tqO32aKzso6vreTfSfFNKkbjvVSSLheehQH9RCCJ/UxtKI
 k/jG3GfY98vimvGCCPWYtTHzlqtoe16Md5wO4HvmXxbVe96ZFTcGdOtwq7/xPM6XGn
 ta3iZ/KbN3bVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TQ2E3Nwn
Subject: [Buildroot] [PATCH 0/4] Tinker board boot fix and Linux/U-Boot
 update
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All,

here is a patchset to fix boot of Tinker board and bump Linux/U-boot
versions.
I don't know how it happened to have this board not booting up, probably
while testing in parallel with vyasa I've skipped the last test before
sending the previous patch that bumped Linux to 5.15 and U-Boot to
2022.10. So note that even with Linux 5.15 and U-Boot 2022.10 the board
doesn't boot up and [Patch 1/3] should be backported.
Probably [Patch 4/4] should be backported too to avoid spending hours
on power supply issues. After ~1 year I've totally forgotten that 500mA
Usb port is not enough to power this board.

Best regards
Giulio

Giulio Benetti (4):
  configs/asus_tinker_rk3288_defconfig: fix boot by prepending tpl to
    spl+u-boot
  board/asus/tinker: rename label linux-next to linux in extlinux.conf
  configs/asus_tinker_rk3288_defconfig: bump Linux to 6.1.2 and U-boot
    to 2022.10
  board/asus/tinker: add a note to readme.txt for power supply

 board/asus/tinker/extlinux.conf      |  2 +-
 board/asus/tinker/genimage.cfg       | 11 +++++++++--
 board/asus/tinker/post-build.sh      |  4 ++--
 board/asus/tinker/readme.txt         |  5 +++++
 configs/asus_tinker_rk3288_defconfig | 11 +++++------
 5 files changed, 22 insertions(+), 11 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
