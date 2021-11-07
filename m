Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2E3C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:50:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0934F61884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0934F61884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE1BC823FF;
	Sun,  7 Nov 2021 02:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4E984swCd7Bp; Sun,  7 Nov 2021 02:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51DC3823E0;
	Sun,  7 Nov 2021 02:50:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7610D1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72E0660620
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncoEW18J4xtN for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id A23FC605F5
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:21 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBNmR7sh; Sun, 07 Nov 2021 03:45:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253121; bh=+i+uKV0SvOtTLsPiDGeno5ZwkXJPa87c7WrygUuyOws=;
 h=From:To:Subject:Date:MIME-Version;
 b=BjgmqWBQLgJAgqTWxlZjNULya2TaR45XNrH/x8Pdbo67GV9i5YpNy/QArys/lWlwp
 eyIAaIYSb3qXmt5sO6mUX8oOGHJWbFF4vEflg7wpuhhuxzMC0C2qxfVAebtEHCn6c0
 uBRG0vCG497fWUamCDNUq/oN199Gmyff4t3jWTidKKhCYOW0QVAqy+S2fn/yWuUkAF
 zJt+UVPjs12iaffVAlQCLSBv4opuhQvdKo5ZAeIIwI799S0dtgjItcYI4/MSRbHBbE
 FDfrRDhYg1WneTuctztNGTrdYPLRk7TpXpugI3/G5ibp7vV116llNqcBjEF71+UEW5
 IFxyoktQedB9Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:19 +0100
Message-Id: <20211107024330.3061378-32-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDOIyK4P7bEpd5wyOIb8iT2X69fCtJ5cX0jhuF7qwwvsBMcJUl4bS+JcscQe8WtaRcnpZnNX/OV0KI2k28KF6Cd1u22gnk1SGPBni2oZFl/yylKdD0q+
 rGlFb+V5WNPkJwW3r5LrU21ca46Y6s1vphMeVaAq4IstakkVZQ72zhr4jyT6ojBn0hXnbkpZdl7ibEipXSKCfUUazPXW0fsY2V6zA/ttJf8Ycp/cMUZ5Pr12
 d1tDCiq+okixh/LmUxlY8jYFydjHFJmRJe9tSJN7y3k=
Subject: [Buildroot] [PATCH 091/102] board/roseapplepi/genimage.cfg:
 beautify file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/roseapplepi/genimage.cfg | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/board/roseapplepi/genimage.cfg b/board/roseapplepi/genimage.cfg
index f4a353e823..f1bceb0ede 100644
--- a/board/roseapplepi/genimage.cfg
+++ b/board/roseapplepi/genimage.cfg
@@ -3,13 +3,15 @@
 image boot.vfat {
 	vfat {
 		files = {
-		     "uEnv.txt",
-		     "uImage"
+			"uEnv.txt",
+			"uImage"
 		}
+
 		file kernel.dtb {
-		     image = "owl-s500-roseapplepi.dtb"
+			image = "owl-s500-roseapplepi.dtb"
 		}
 	}
+
 	size = 128M
 }
 
@@ -20,13 +22,13 @@ image sdcard.img {
 	partition s500-bootloader {
 		in-partition-table = "no"
 		image = "s500-bootloader.bin"
-		offset = 0x200200
+		offset = 0x200200 # 2MB + 512B
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-dtb.img"
-		offset = 0x300000
+		offset = 3M
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
