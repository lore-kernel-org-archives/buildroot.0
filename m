Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F2BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05D3040463;
	Sun, 13 Feb 2022 22:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8zIjRtvlVXS; Sun, 13 Feb 2022 22:57:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CB174040D;
	Sun, 13 Feb 2022 22:57:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6270A1BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FC9C606F9
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e13tXedA2rGq for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb150.aruba.it (smtpweb150.aruba.it [62.149.158.150])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C0F5606EC
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkjnv817; Sun, 13 Feb 2022 23:53:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792838; bh=n0rKF7IahMuaEn0YVHxy8VSmvdpnXvO/caH5THu1Ug8=;
 h=From:To:Subject:Date:MIME-Version;
 b=kwgo1/yZK7FLqSWX4w9cjlFwiJKdagox2OxLxzOcYGJSo07NQzvjC9zQ16PMgVrhw
 F5eNGgPLAUdB0YUsOZfkmMjYdQtuWJ5Ixr9t4qxZczPOKwdWjhoXdj4krqOI3qBMLz
 +hC0X6mShmHDKIlKExSAATpXflm39uwMUgB1za/IDdXk/aXwyr3PNJpqMMbksTJgid
 YyY7JgmpFVjM+hNc1TRsyva8d3Fpu9mIfLfMpY/UDJzCWjYo0uWHFlFyipqZU7xt2i
 Y31x68gPe6hUIo87TrZ4DyQhDJ7M19MRwAIcXSniSH5/wkwNaTZkvnxq3nbt7AeZ86
 FzKDBpCmMu+NA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:45 +0100
Message-Id: <20220213225350.3466696-12-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
 <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFk7oWIJAjb24n65Q9cF8WlSaN+l+wyuSwe6x/XBcNweyWsJNvtOfoIa1rnRAc0wl5vbF+PUAYmv2Djapxqqv4Ko756NnTf3GDA7Wvxymgq8FZ/JeHfz
 Ce5vAAjNlva7/HvmtypTJHm4nmMe8DUiiHEMU4tZoJm5m+8GX8+opqwn6T7fW3TsTincolESOXZrzv+i0kOlPktxJrOtxhGBygDQeykr9SIkUm8BLhvGQz9m
 0kvduGer6O2dgtOPaDngUnB7N40SW6+ViaTAxNMkQgCWL/ORsMrousd0+oeUx6gUC0YHkaCDuQ1oDVXjPQNr7pBtFnwtchH9KyC81S7gNVnrB7eNzpTlW5Is
 8R6li5wCY1kfDndIBU9I/ATFWQKXHTelVVC1+1wlH2iz82f+vm9CktKGTMlpgjZf77dplUyRsR+bLquO6FAKS3ZwER3OqdyNH4JmQWssubu2m+Yg+AwBv9YW
 SWnOVjI2pZIE4yedaeZpzU6eeUaoI2YpDetqLMCixDo2UG7fXbAW17LBCrQWN1NABbQEn3nj3lksI4NhxJE69Mt+lhpOFcKnvgRWED2iYUhhb+ZU2T7GRdDt
 ptD1NSEZlvQkZrfMi2B8sr0HiTrnNXAs32UjRrNRxkdBLWJB8+OmIZYrfwfrNG/slcr/8nCgVwr9Jf0SERR4vbnN
Subject: [Buildroot] [PATCH v2 11/16] board/radxa/rockpi-n4/genimage:
 convert partition-type-uuid to single letter notation
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note that rootfs doesn't need partition-type-uuid = L since L(rootfs) is
the default value. So let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/radxa/rockpi-4/genimage.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/radxa/rockpi-4/genimage.cfg b/board/radxa/rockpi-4/genimage.cfg
index 68cc4d61a8..07bee5bf81 100644
--- a/board/radxa/rockpi-4/genimage.cfg
+++ b/board/radxa/rockpi-4/genimage.cfg
@@ -26,14 +26,13 @@ image sdcard.img {
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
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
