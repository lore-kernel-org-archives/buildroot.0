Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDA0C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:51:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C4F61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01C4F61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF6D402DF;
	Sun,  7 Nov 2021 02:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Opi7mnxkfamt; Sun,  7 Nov 2021 02:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F319402A9;
	Sun,  7 Nov 2021 02:51:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDB4E1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBA7A80CE8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYXQz4oGTlWN for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A69A80CDF
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:22 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBOmR7tF; Sun, 07 Nov 2021 03:45:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253122; bh=i/O1JWyY/Zsrn31GOSQIjkijJxcP03LQE5bfECyLBIo=;
 h=From:To:Subject:Date:MIME-Version;
 b=mw4gmu6PYoQ9Ad1cRmTuqgaCLQiS9BfU2njZDwNzH1uykjuT3UCWmqJNquPifX/pI
 rH8E5AefJEIAKRlLi/PY6gKDNOo6V+0ZuMQ/icMQQVleVPey5juDCHH21J0fQKp/V2
 hUp0g6AeQQnFpMHuDJixAhK+WvjnIchHPSglDahxI4MGDNQonlb/goTQKYe2j+lQpm
 LYBQfSiXTcQEOZijhL7GcSzLtUUP5jTz2VRsOrhwerNaIo5Ir3i71OHkFxvxOq5XP0
 QZd6xwXotJfFfhLrnjONz5k/7vZczEohR5LZAJRKawjOk0qMc5fN4zldChVUQtMvaQ
 M4YJooRkkV6+w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:21 +0100
Message-Id: <20211107024330.3061378-34-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfELdYXAV/bKXZKRej6jGC/A39RbQ/BjZrZR65idNbwG2UV2GVNRd/49QlVGP6EGXqNyufFavqxh6zS6fMqRPJQJzvPoZKKpLyczN3c+RkeMpUXUYhaRC
 j7d+ejwX4F1vu5em7DG13wV6EFu7VrPRKnT42LUzVFKFLiasPpLlSkHSKyNMpxqrhQJmsbuYYBKco4OfFaZRo+sypgCcko/G7cJqmZyhytcFORE0QQqaCGwp
 ZyjUFvm7S6cMjjTk9nUig5jTfNwRpSzd/rMT4pJZ8d4=
Subject: [Buildroot] [PATCH 093/102] board/sinovoip/m2-plus/genimage.cfg:
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
 board/sinovoip/m2-plus/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/sinovoip/m2-plus/genimage.cfg b/board/sinovoip/m2-plus/genimage.cfg
index cde0669e76..9311e026dd 100644
--- a/board/sinovoip/m2-plus/genimage.cfg
+++ b/board/sinovoip/m2-plus/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 64M
 }
 
@@ -16,8 +17,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
