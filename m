Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C920C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06AE361353
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06AE361353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D939A40328;
	Sun,  7 Nov 2021 02:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7gZn6jhym4W; Sun,  7 Nov 2021 02:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36302402C6;
	Sun,  7 Nov 2021 02:47:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1981BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78BBD80D34
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7m9Z0Odq2Kr for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6F6C80CDF
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:30 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAXmR7Xv; Sun, 07 Nov 2021 03:44:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253069; bh=rM4lDWo7ABiKrwdrrLXTJvmvnTKJZTWkL+Mhtchojog=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZDk5adpcbzY+LKxr7lISU88As6eZEo4CCEWGkhGV2lAT2GGzG1OGQ6lWWehDqgfI4
 spp9HcHWYm/c+0tjOSFx7zaWsabiyt4Xx2RkZEXlyC1IMbUnPe/rPZ8KbQ4hGHwDdD
 DP7hPBbtqk/taiJh4UZukKoj0WIy3xlq9fxoo8eA+p+Z8X08ASxUOPmoPU0pOFRwZ/
 2bCh94hiFdKlCi97gMm8QqWgn+2LMtk4bPE9GxQsUAXjEyNUYXTHipwTu68jMNl0KM
 jzeG6f+qShhC5V41tSBpBL/CfToMvb9SprQNABaJwO6tn+93i7m84Dx2QP88W+VCi6
 faGfZPBpv0Djw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:04 +0100
Message-Id: <20211107024330.3061378-17-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNkciUgKVOz7h+K7spZ20Gdz002lNFrSkpfyfC7gVKi9QLduSk976hJ6IIafUrk9Z54mtkxvZsGGr15yXSIqw3caclzmeC6BuE2oZXkBvtkVyFbhGZU+
 O0A+z2aEDq1ZHiRBNmVS/XNsYln0dwIvB/ubMigT+6tggGothO6A0VpVqjIBWpkneAU95+w0dntVahZIvw/UAxkogwxkmgwiuKArTO9ATmiXYWjN0cJffDuN
 H2+ukFy+zuIKMliIzALRHoEFFARaDLKJtz3nIBNeQKs=
Subject: [Buildroot] [PATCH 076/102] board/pine64/sopine/genimage.cfg:
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
 board/pine64/sopine/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/pine64/sopine/genimage.cfg b/board/pine64/sopine/genimage.cfg
index 02ebe7ab9b..bbe96524ef 100644
--- a/board/pine64/sopine/genimage.cfg
+++ b/board/pine64/sopine/genimage.cfg
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
