Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA72C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61162611C4
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61162611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D18D60755;
	Sun,  7 Nov 2021 02:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwCp4PjWIcWW; Sun,  7 Nov 2021 02:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A227F6070D;
	Sun,  7 Nov 2021 02:47:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFDFC1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD91880CE8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12lKNWC3c-Dt for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4BAB80CDF
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:27 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAVmR7XG; Sun, 07 Nov 2021 03:44:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253067; bh=JfcOhz/CTnwc6XZ49xPB3O9cCBME0R1qrd/4ql7ev1E=;
 h=From:To:Subject:Date:MIME-Version;
 b=mj26YlnOd2sIgbvgcBcPJrvkftcYdYw1DWE1Cf8aQWXFrNx8Ucfw2hqwLtbszOYNn
 7eMDPypBswsX0TrAl0xu2RvgZczfLTU7OWNksDUDQsmJnT7LY/xymfgv7hsMnPNdsI
 NCSr4Lqzt4SRsVumKlIOlfTsrg1wKvidy4rw2Kt25J2EHHOO+/Skpk98o0duHesfAG
 xzzieqTClK2DuQNlz0bEYrx0kE59qYQHKo9yReTjiRK5qDm2dZG3qKEFQMfJ9DDx+0
 kaiy36nU7vSVX0rbP5br+eUChJEhw595zXq7WTxPskCOc7D8iBqiPE4M7A/66lXpj+
 eFg7rXqxc/Wsg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:01 +0100
Message-Id: <20211107024330.3061378-14-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMRteTVRG8IewU/SvLZ2ezfjeFb+154ngbF92j3waogASma6QvYA7dYX8Yd7c/P+65y0mcemMiAgUEeyTS2CfbsTaTOv3ZvLY70q8S9eOBYEr26o4LJ0
 fktq/a1AF1uHxLXm/kPacUPmecg3cJFP1fI095ZI6iuN2Fj9I9KaZzq2juV6Xk2q+zjD51sHYxuFO1YQtLcD4HzQVjxVX+P/yGol36wj4lU4tFrhNbro+DN7
 4O1+rRdkSgQxpWhA6oJDlVTQ3Yy6NXqVsywRCnMEINg=
Subject: [Buildroot] [PATCH 073/102] board/pine64/pine64/genimage.cfg:
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
 board/pine64/pine64/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/pine64/genimage.cfg
index 2ff38d5415..ae2f93c1ec 100644
--- a/board/pine64/pine64/genimage.cfg
+++ b/board/pine64/pine64/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 64M
 }
 
@@ -16,14 +17,14 @@ image sdcard.img {
 	partition spl {
 		in-partition-table = "no"
 		image = "sunxi-spl.bin"
-		offset = 8192
+		offset = 8K
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 984K # 1MB - 40KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
