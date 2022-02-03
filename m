Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F66CC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EF4B60EE1;
	Thu,  3 Feb 2022 23:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzUxDUXBsvFT; Thu,  3 Feb 2022 23:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DDF360AFD;
	Thu,  3 Feb 2022 23:00:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F23EA1BF34A
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E14C1606C0
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFXl-HRXLiFa for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:00:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3D5D60AFD
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:00:02 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fl55nOQm70FuyFl56nQUK2; Fri, 04 Feb 2022 00:00:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643929201; bh=kj098wmDxEPJlGjjs7OIVWgjAqHi6SYJRDd0SrAhomE=;
 h=From:To:Subject:Date:MIME-Version;
 b=nkyHZ4b/N3wKKfdMMTjy/b/vkwAlJtU1+suBuS9GZttnxN/wFa0RK3B2HIFh3qK5b
 QA99ZD3qH344PSZYAbt3c7kJssjF/lW/8MigbnzbYA6CZJ4NLAKk++Yds6tDPxtrGn
 ntitxyXX5v/p3lE4G4lDAhdNv6Km4+46Ky8ukJRuHXM+3AfBeAMM4BOMUwLqONPPKH
 vfGCkmLaVr010lshgQDsWFSUEqHk+qcepx9zeJsGxJ4h3DxdtO9nDXwZnCyhZ/Au+4
 ufw3+W5RG5f3R0VoUZ7P/q/3latHgzfPtD6Fzx68vj+QxvbHmAoG1mo6D4tTsZqkzJ
 nB5KQoOrjZGlw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:59:54 +0100
Message-Id: <20220203225957.3039320-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
References: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEZfW5PYRrLEgYFF0vd/BjSgTy9ISZOlY2x7qJU9qC1S4ZJXXFWAC97CqwbVQt5eRL3ii1RImkWo+4ojExjodBMRXyO6g3MEvjpNjYnA7GJ6ZJ3+1xG8
 wSTBlhkDJSVPCBu3qslO2EcdoqH2bmFFF5dc48VKwSP6N1QLW+kyF1Z5frUPul8hHRZHAI8PxADoXUipcmOe0opc9dZ+BdV9QpXgUNscr6nx09ZQq9Mjep8m
 qRfIjykzLvhvFbGwhV72PeFAiTO1VTbmdYQY20vyRpsJZIbnXA9Ra23Hm4dlGjhJoKcyRc/MLRRqy68x//ENiMFrfbopTega3J1iHyJigyeWIYch+/X6rEW8
 95+IgRQLOlsacI1QkpwXTszdg3tgAQ==
Subject: [Buildroot] [PATCH 2/5] board/friendlyarm/nanopi-m4:use
 partition-type-uuid for genimage-15
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
 Jagan Teki <jagan@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Genimage 15 restricted the partition-type option to mbr and hybrid
partition-table-type and now prints a warning when it is used [1]:

ERROR: hdimage(disk.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

[1] https://github.com/pengutronix/genimage/commit/1d72d8091f83790a0a35a1ea7dc25d46adba8876

So let's use for EFI System partition:
'partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
and for Root partition (64-bit ARM/AArch64):
'partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae'

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717059

FTR, the magic UUID are from:
    https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/friendlyarm/nanopi-m4/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopi-m4/genimage.cfg b/board/friendlyarm/nanopi-m4/genimage.cfg
index 35d056ae6e..8d0e6ad13b 100644
--- a/board/friendlyarm/nanopi-m4/genimage.cfg
+++ b/board/friendlyarm/nanopi-m4/genimage.cfg
@@ -26,14 +26,14 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
