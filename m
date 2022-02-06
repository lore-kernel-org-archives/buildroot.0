Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C833FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF9681372;
	Sun,  6 Feb 2022 20:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JfK3BSfY-v77; Sun,  6 Feb 2022 20:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A908137B;
	Sun,  6 Feb 2022 20:13:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6FA1BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 192E54029F
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHbXbzidGD4j for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04135.aruba.it (smtpcmd04135.aruba.it [62.149.158.135])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44B9A402B8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnn1nXOAU; Sun, 06 Feb 2022 21:05:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177940; bh=SwGTPJ33CEpev+hsZWaGhD0QvKR6YxCWAsJNJzc9ShA=;
 h=From:To:Subject:Date:MIME-Version;
 b=e2jd+0/YfPPnLNHV/zDjBpDy/jaaRy7YEgpPx/VveY99KF1abFTn8qeQM06o3PTeE
 OfguTnqIEzC4w34Y2rjKka2al927NoHStMDPeFmA+zjVJAav3lnjDfXTpiu0vWlgrE
 Ca0WNbdOvVC3uskjlrBE6h7eq8NzhIpKpHwaUnOZYMEpetVD08lZ68XB3wZEoBp67i
 GQD7uGhmchiCGeUUBXowUkrLIPagxWke+LGFI2JrrDMm+MU51cx2P9MLOTNrz9esbd
 L0ePRLMxDzU7TTpoaCTK3EnT4bcMeW841MiZOynkQkDtK4eiR7zirnAMj4IqD9p9vf
 +W8nUsDcRBdRg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:28 +0100
Message-Id: <20220206200532.2758493-13-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIeqW4tLXAqn9HKE4MjvjL31/djGkOuMuJM+dVr7eEKFgdDCHWx15Ouf0qsck2ZjPvGXnMUx3BIoOQFSpUDv4Q8CT2D7EvzZwZ4KHPO7J+AH0jwNs8Io
 w+Avs9PKQwtVL1Wsp73SWoPQ1JjUWkblksO0Fcwq8Uxvx435ay+VIuB28crj+CzIy20o2+Ir7w67EAzalufCboX7d51kLv+XArnQ9yO92oVe70SzzCXLfD75
 AMfNT+oETrpucIv0bfMtaPZGw3PBgEEs6/aJuG6W9aVMkmlcCVT77owbpxUtCFwIYqaN+sanGOqLZiOgVqagSMCzheB5+RXIzDaqKl7aqE4XUYyuOIvq29z1
 pT0us37gSyvtJoyEiP8hheHIjjqU9jyGgFto9LUCBaNG5XrPiyDm7D80JYpNmoskhOREbHzc0c6BMwrJkUzAlaV9RetGq1F+o02bPskaCQhd8Est1QCtbOxv
 ZGLHrxSak+5SXLhpIXno58QW9YZB6yIx5vm2gbI6JAKJ8gn8s+ZbmFLw5MgoayPT8cMDvBLd98L/3l7/3WM2XhKSFyelFl86gzXilzsm/n+HJWx6MKe9eZDO
 rKFv8BgrzH0oB2VIzQh2yXEC
Subject: [Buildroot] [PATCH 12/16] board/radxa/rockpi-n10/genimage: convert
 partition-type-uuid to single letter notation
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/radxa/rockpi-n10/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rockpi-n10/genimage.cfg b/board/radxa/rockpi-n10/genimage.cfg
index 7f4b639bbc..2773658330 100644
--- a/board/radxa/rockpi-n10/genimage.cfg
+++ b/board/radxa/rockpi-n10/genimage.cfg
@@ -26,14 +26,14 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
