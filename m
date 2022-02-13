Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE62C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73BFE401B7;
	Sun, 13 Feb 2022 22:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4y_bGEt5E2HW; Sun, 13 Feb 2022 22:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7A69401A0;
	Sun, 13 Feb 2022 22:58:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81E901BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 703DB606F9
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QKWed6Vwwbh for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:54:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EEF0606EC
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:54:26 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNl9nWlaeNVvLJNlAnnPCS; Sun, 13 Feb 2022 23:54:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792865; bh=F3EQUKheTCiS4i6aIff11Z9Gv8s3NG0P6B+U2HsVSd4=;
 h=From:To:Subject:Date:MIME-Version;
 b=Zz9Qi1uaTDP6r8Oj/BQ0bIKtNWaYDzKUKX6/MzLylWAxrHM8nUuQ9Rs3yRdPJg7gc
 y4Ue4zc0fngMkUARZkfkrhGIISQDbb9trQlr5DKIoTQnOSKXeTWx+W/HUnVNNggdeh
 yxCiGVJWdnMMTqxVmmeaVPjkbSIiZZ4Mup/wX7cL73fdJzhacyN00uwnszZDylLgZO
 yFSkw3JzoWOujVnjtmIxlW4ScYeQ/HJLWzKRsZwf2DxOhF1kR1AOIS8I9I3PkKQSlM
 uQ+sIBo15+mU/nlZ1T6GZOU5LpFWCvpD3jh4kCqfZgwpQHlpa4c6KYeuAFFKQSAOSx
 fhtwCelsdb4/w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:54:22 +0100
Message-Id: <20220213225423.3466840-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213225423.3466840-1-giulio.benetti@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
 <20220213225423.3466840-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfP2tfCoBtpWdQYDTMyffUory+P3F4giY1PKeS3WWRqQVFC5L6UwPDrYHEPOsrHV7kA04fNg5WFp15/O0wVcC9KKyS8H/iQv5/+PVvz0F0mNE5HGJzr8/
 C71iWcCxD5FTM0hFFsOlWFg5ccN2QaVW62hOzvkXL98I3RqVxwpBh8CLnSqBycx4x1MldIs/8XLSL39vyOSXnfCOIDTCtL6ze2qqY9ykD78IUKDBp7Ia+9CQ
 qPVDBnQTApd4Js0N3NvrJDljQ35dHxGvsQAOZGZl0K2ihjkk1k1gt/ZDV3xE0aBp/Z4pjOfA+7BOPuiE4e6gnYX33aWowm/3NR3ej3Kib/cKBRvtPhVt+ESF
 B0kGgSMEMURXqVfgpv9QGQ4py84nuFTLjDYIHjRE2cdRbdFBFgKTxyvlTdSiD2syHuioXSdyw0luyZ4xSjCVOd2rb5G4klC0wfZrrY0rEjEz0ngfVAMORz/K
 icZBA6eMLdxJdj4sFcVfA3Yt9CJTIltMMX3deq+XidUPZRWwxkaD6G9nV1/EZRculml8fCx8QLuBmDQB03oyVL8FqiSkIdH632F6vFBJ4auyH/Vrem8CZ6v+
 FgDVW+1flVn+CcV1EraLoXnFyh+NLMYEB9VTVzV79StuEfHOkiHPxiCP2v13Hd73yJTxlLwYKqDvRaH3vB7oaX0W
Subject: [Buildroot] [PATCH v2 15/16]
 board/sifive/hifive-unleashed/genimage_sdcard: add comments to particular
 partition-type-uuid parameters
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/sifive/hifive-unleashed/genimage_sdcard.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
index 1e0c800153..e5618fa4c1 100644
--- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
+++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
@@ -6,12 +6,14 @@ image sdcard.img {
 	partition u-boot-spl {
 		image = "u-boot-spl.bin"
 		offset = 17K
+		# ZSBL only loads from this type of partition type uuid
 		partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
 	}
 
 	partition u-boot {
 		image = "u-boot.itb"
 		offset = 1041K
+		# U-Boot expects exactly this partition type uuid
 		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
 	}
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
