Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECD0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE5AC6115B
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE5AC6115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 977854032A;
	Tue,  9 Nov 2021 10:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C10_q8_37Sa0; Tue,  9 Nov 2021 10:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D27D44012D;
	Tue,  9 Nov 2021 10:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BAFB1BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B83B80D77
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbxq57PG6kDz for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:19:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5111D80D6C
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:19:08 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kODFmziIdyoivkODYmOZxU; Tue, 09 Nov 2021 11:19:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453147; bh=74N0pxbA9kjvB0cbdMW6SSEpu1ocV0HaRnykjMdHJi8=;
 h=From:To:Subject:Date:MIME-Version;
 b=Adc6ag4bkYvv/k0AAtNjbymltZsTNDFCiv/bpijmUYIQ0TM1Hftk4zejiTQO2551S
 bNRm/s7K7Tb6NOTU1ymJtLrjffRTh9oUZtoCrjePRxy4i6QTInhLd5Y9qAUhN4N7HR
 hWvwLOxal73s0XSsKzQ5R/9E0Hgbi5L9tXBq0ZLNFOV+sc5xAkwlduFTj3Vxh692ZU
 Hsb5ZmX70XPF4XAnCExgcPIpw/W7e2GeEVc1MW9XyfgeWBwhA74SaJd9S6t+897ct5
 vuI4mnCvIw8kSugFrgCmsBjPOocgqIe4VpOwj8sHMK8hmf+xQ7OOfwtK3s0nMz3FSs
 21VDoRJ70pIOw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 11:18:40 +0100
Message-Id: <20211109101844.1132067-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
References: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHeMg14XYDWrM7c6IcG7NLLx05CBQYYW57XKvpCaPpcVBElkjPQfl7EXzSV1GY+UP6D1/CnI963kznoE7pjJ+/VbVEqhGSp3WacivWyN1J7WTlHhO+w4
 JLIRfgYo4FCRG/r7Y7LfRuJ6jepe1G0fibT0Xs8P/rA39Hqkah/jKMnw0U1NbfDa0x5Jy6CsksXKHYbrbHdGG4Fj+G5MkALJjCiwl+t/2aIOYnoT+1r1yrUI
 R14AdxgXQXSUaZjl7Lma/BTiF+iFm5AI9qMiUleEssvHHiQUjogahZkpWrTzcae1A+CsAl0vP9SuPMDLFs8CDGGlTgFf9YMBFAzsyS3wDWlCcOPwP0KhILcE
 mWBqrY/vjWhvNnPB0KhRcHffWLNQi120j/7FV0MzUjpra8z/lRxHGm6WBo583v9f6AGxxSWVC28VlnkkCgndDO2D7IABEcbcHQeDn2IGPRRy5lyD+1aQsTVQ
 k5/Kvl5VBdD1C/4OhzIXFnuX1cA8PymI9GGFCJT4Aj8AealcoiRV0Ovm1yB2EslOyrNivtB14xLcuJhrUOya6vZ5qCzRSou9h6fS5+c3IJ+lYWt3FMfJTlIO
 YwU=
Subject: [Buildroot] [PATCH v2 5/9] board/minnowboard/genimage.cfg: fix
 option assignment spaces
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>, Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Option 'size=10M' must be 'size = 10M'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/minnowboard/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/minnowboard/genimage.cfg b/board/minnowboard/genimage.cfg
index 34b3070901..2eccce2de4 100644
--- a/board/minnowboard/genimage.cfg
+++ b/board/minnowboard/genimage.cfg
@@ -9,7 +9,7 @@ image efi-part.vfat {
 		}
 	}
 
-	size=10M
+	size = 10M
 }
 
 # Create the sdcard image, pulling in
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
