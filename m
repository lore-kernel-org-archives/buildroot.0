Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F88C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:44:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52B8B61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52B8B61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D260400DB;
	Sun,  7 Nov 2021 02:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LN6A-YRyCssX; Sun,  7 Nov 2021 02:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEA2540236;
	Sun,  7 Nov 2021 02:44:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE291BF976
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FE03402AC
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nvgXWTTLmVjr for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71352402A9
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:32 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9bmR7FH; Sun, 07 Nov 2021 03:43:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253012; bh=roAHHQK0przgsol1xQ/O01lQx6xr/qpcIey74hEd9I0=;
 h=From:To:Subject:Date:MIME-Version;
 b=J4TO3a+YiIc86+iSr/5JDhG3JtT+W++oX/3CE9yJyqPF6+fCNiRjvCJdzmSRo3Bri
 WmTmO4HrEoSvkjkW47lu3grThIsv0aqDkC0zYqKDHFp9qfCYkvFpgdAuWHFtfChTZa
 QTv16AFLrfYtZm6PYF7cKyslUgkw/WPSTjWuasuQPP41RDgab0pxYeq0qOu/V6lP0b
 vWAU2izIpJvKzb/SYNYSMV+ZEFe/RiZEHfXeuz70Jxy0ggJwDlbCqhnZQvUbStQ0lU
 afLwNjHijwofs9MhuNWQuz0xEdLXHTSdq0KUVqz8txySFX4cPLB7drpeKAUROCMYl4
 7fu/9arAmggPA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:48 +0100
Message-Id: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKpkJnxeLgyvED1tuHnWfShvcSEXhqDDNLEv2eetgDCknOZ2LP5n/ABqJbHzmG4Z+QHBqtqQSQ42LzXbqO0FqfcmhLaJ2D6LDDix75drvemko3mJ1DT0
 bGo7GLgrD7aRQj/q0uQWegaGK0NaqEHmnC86mUEishtdD3nXDZAGXNblEklJLIpx4toVxrBwBC8+oYp6h0Y3jbMblxBvsLkYn4YTIbtNv83bcaQjpYoAxlX/
 6/1bvApxXPx3AleuR6XDTJtMBGrVKNg8e1hDQIGMn4s=
Subject: [Buildroot] [PATCH 060/102]
 board/orangepi/orangepi-pc/genimage.cfg: beautify file
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
 board/orangepi/orangepi-pc/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-pc/genimage.cfg b/board/orangepi/orangepi-pc/genimage.cfg
index 932d81cf12..14e326cc56 100644
--- a/board/orangepi/orangepi-pc/genimage.cfg
+++ b/board/orangepi/orangepi-pc/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -18,8 +19,8 @@ image sdcard.img {
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
