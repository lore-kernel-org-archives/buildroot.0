Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6D6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F4BD402D1;
	Sun, 13 Feb 2022 22:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id APEMvZoIEfhD; Sun, 13 Feb 2022 22:54:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50B5A40332;
	Sun, 13 Feb 2022 22:54:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18A461BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14011606F9
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwgsCodACq4e for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46086606EC
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:55 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkfnv7yS; Sun, 13 Feb 2022 23:53:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792834; bh=cLjlKFsvm6VqmsJ4fHY775Mc4tP0IH0MD33tcB0oDlc=;
 h=From:To:Subject:Date:MIME-Version;
 b=M1Bn8VFxTDayKO8hIZUs8SJNb3KRQ4ST/SvdvMZiJMrnmbRGQTpCRexkQ6hZS5pb6
 4IwmysI+Md1YL6gy89rQJhbt1TWBZu9hLfB0kYfeQ8hC9YAA98P9i57szTgKlUhtIY
 wFRF8nkrnziSxTLcZjDLfuaegYLs/wIkS+sxF4MCUOIhs4TEADt3/kHQ/6Q1VvXaXI
 pzNrYqUEjBS+RKplCFcNDpiVq3zalJtcbMXmY5impiEgDuliEfeXute+iU4UTKhf7t
 BnE0n8cuHwrWb1+nIo9lPQetY+cbyl5kPcXF/OOMSBMmMAN0KbJ8w7RHXFcDW+zuKq
 zDJ+kMLYeuSiw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:37 +0100
Message-Id: <20220213225350.3466696-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
 <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKPsj5rOrRG6QrlTBrkCBFe/9mVCOwF48NZmkWqzKVYpDsUn4/bFw+2v8c+cuuDQp3GqKeyh1hwlOH3T0dFroWnH5cAcJBD++Qo14HKkfvVRM5wKswq+
 /zGt6+JUM4lqR9ndxrIGB7w3+A7pQHSBCqKX6lB8Zqma+Y3vBHD8UICLYwaEA/S1MOAqj4qka0EMxr6DHYropUllbdoK/tKtpTuJcDJuFFFOYufrarPQd84j
 Gp5uN4QIgkaRZVHe3xUbE5w2Uhq6qx9YGd7icuL0WZGIi3W2yIYAdKHI3mmoTEkJU5zy0UL1UViKCkHqrXat//BkUUGt52NV0/5Jtwxq02bplI3BY6hIALjA
 uPM8YXB5qxknYB12ef5q3KhWdjgrOWgukzuHdZJLy7666Ugqa5l+yVqW0lYmcKaIWw/CEQw7Ba7wOq8hX/+KHQ8RaxMv9gaI6ZXgI/9AzL0TeXsbU+kWlZiO
 XmzuqlkMTlu4iCHznn7UneL7HixFCI4Y7IyzEO10bDUJTELMcjO0bBWAVKfCaCVWj64Z+pI+z8+5Uc8Dgctr/zlljzSB8EZdRZJnGKY2NDXL3mzdirFvTKsJ
 IaPVhVl/eDS/Xd6iYh52jOpEVNgXLAEDlR1AHgV7XUegIYg7iBBhV4jpecNArp+d16sOqcSjcVgL/zvULlGFRK5Z
Subject: [Buildroot] [PATCH v2 03/16] board/friendlyarm/nanopc-t4/genimage:
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
 board/friendlyarm/nanopc-t4/genimage.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopc-t4/genimage.cfg b/board/friendlyarm/nanopc-t4/genimage.cfg
index 98dc2f3892..f966d48f3f 100644
--- a/board/friendlyarm/nanopc-t4/genimage.cfg
+++ b/board/friendlyarm/nanopc-t4/genimage.cfg
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
