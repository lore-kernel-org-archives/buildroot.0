Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6FEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:39:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 431F4617E5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 431F4617E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF35381C38;
	Sun,  7 Nov 2021 02:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPqoDwsL45zc; Sun,  7 Nov 2021 02:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6750E81B60;
	Sun,  7 Nov 2021 02:39:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9772A1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87F3281B60
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iamhxCjgFc4j for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:39:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDA2681B48
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:39:40 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY5rmunIvFf01jY5rmqTBa; Sun, 07 Nov 2021 03:39:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252779; bh=twAkLkwqQZZPlyYg2DDBN2b8kq42I56mOFBBXn+chS4=;
 h=From:To:Subject:Date:MIME-Version;
 b=c9anDymPsCfWxnieUYsYM8ken0zA3/laQhbBLAX3JS7Ft5PowsO5tLB7PA058HOCd
 7fukgWGti6HHMKAksRFyeTryI2heIjlYu2/RwQMCxdQi38B3bYNovBvB06iHWetl90
 76R2kMgUBHrPdNk/hbrPBUM7lN01lcMrjIXjhtSQcmMEt3PuH0B+sknhsEPMxH0IeV
 XXzE2TsNWWyhBIuValG7URTQgKBDiOX2N0Pnb1R8eIzucWhTV9bo/iL0ZQe4b0twCE
 j48vvGw5yuMW+o+rMPGPmf8u2RpNmzaZOyV92KzapJa8sEUIlPlQHtYgsWbb3aIc/O
 20oosX/7OR1Ig==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:39:38 +0100
Message-Id: <20211107023938.3060618-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBmr+J7sMs++MdvgiAVD++ex1Wo2i1Nc0v0xqZ8YxrPasDEzL3XcBUCtThk6E4y9pHqTmZT6PGiUFf8v84ZxoSEhTISQ3KMZvaHH0S4cqk9ItAko7cAE
 tjKbMaaILUrYT0z5x1yyEXWy5QGROCOXHKRcsr6Dm0GY76G1/OzSIHMaQDouWRhvCyUM/h1NUuzRsDmdDqHgh7q5D7M4Gbh0l48k2dzbnFOAlz24F/jakXza
 WCsRIl/AfnDtt3Yw+Jb8jJQebR7S5EebVEgR0i+gRo4=
Subject: [Buildroot] [PATCH 042/102] board/intel/galileo/genimage.cfg:
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
 board/intel/galileo/genimage.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/intel/galileo/genimage.cfg b/board/intel/galileo/genimage.cfg
index b930c0deb9..76c3d9c36e 100644
--- a/board/intel/galileo/genimage.cfg
+++ b/board/intel/galileo/genimage.cfg
@@ -5,7 +5,8 @@ image efi-part.vfat {
 			image = "efi-part/EFI"
 		}
 	}
-	size=512K
+
+	size = 512K
 }
 
 # Create the sdcard image, pulling in
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
