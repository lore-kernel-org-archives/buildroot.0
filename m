Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F69C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 987E9610CB
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 987E9610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 602F540220;
	Mon,  8 Nov 2021 23:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhaP35Katw1p; Mon,  8 Nov 2021 23:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24514021A;
	Mon,  8 Nov 2021 23:05:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 202531BF2C4
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ECAC402E9
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYK6KBUUOJl2 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 23:05:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1132C401E9
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 23:05:25 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kDhZmJJDJNGRPkDhbmjCAe; Tue, 09 Nov 2021 00:05:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636412723; bh=kEMycD7jj5ZA8iR1Pbv+S6OOxhFh0Taj51gXLcetWnk=;
 h=From:To:Subject:Date:MIME-Version;
 b=aP2DZXCHYXV/jpOwx9qIH40QCYIXoPBOgPtMsU5GrqYZIqRHM4jN1cFmSehe7K92a
 mkuPITMbcrFZcZm1/IamZ9o+PD1m/+mnTc9zzFf3RbZs/Kw/LzJNjUI/R+sQ9eRNL3
 +/5C9w0tlous9DJBUGy/OBd5AwZKG+9koFDi2tWOZxBgzD3yjsq35SxhPuNiI+VbvO
 p/O40JBTTiLyUNaBvb0YsHdhDQFDFYW5um9keOj+oEAoZw8wwy9dZNCeBoh0l/ZlW3
 jDC+Y/i518mkZEcSGVXW7nIj6lolUh9FR5OO+KQA43iur/TdJ3XZarWItNxDoTlakq
 3zTHtTMK97Ipw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 00:05:14 +0100
Message-Id: <20211108230520.4007148-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBtIs2EWJQtNRWjj4Rwhw3C+KYiYK7Qe2E8SSIibpJARKlNhubeh3lOlwUa0pefCBRQb+/Vq86GEEeJnOBeiNoxvqUUlwVwXmCdGLhyFHUx7hxf5sY4F
 Z69ZSHxuJBELXiC9h8HIIWzKFt0yaBRk6cPCMxs1ixlyXqGc2yvRZCJ885gyW5zFC2a0urWLhRKKUaDzOAeGZRa92LzJiwcTY5pztxZKXfbaZAxilXTrcoVC
 sP01+kFfNJ2K5gCEe9FjUSKltO97VCSd3T3EytUMxZVXlg1TNOGakaIkNDmJJtPCZTkCloH9nYV1xsOmQ9rojvPdBfqvpyWDRHrNXZAtajNp61NmdFez23Ar
 1CptqvFDSEmBPlM+fTJoBsOfuj5Tft1KKxqHq31BRt3TddApy9OPa7A6g5xUSN6Y2M0qjI/BI9BzO6N5tQZSDYYNxffHun8RR0kXHiI7T/RtVRPt7j60xcKO
 W5ObmR6AiwmnuATbhmgx/rWTLWXgwtQRKwpecv2qDUyLGPw5CK3mNesIrWw+Ib/Z6FEkBPdTF4xSBf9t2ScHCOdFuLP0bKCrB6TpAw==
Subject: [Buildroot] [PATCH 1/7] board/olimex/a20_olinuxino/genimage.cfg:
 fix build failure due to wrong offset value suffix
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With commit[1] I've introduced a bug:
offset = 8KB(not valid for genimage)
and this prevents genimage to work, so let's substitute 8KB with 8K.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/olimex/a20_olinuxino/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/genimage.cfg b/board/olimex/a20_olinuxino/genimage.cfg
index 5a735ed2de..b48e12a831 100644
--- a/board/olimex/a20_olinuxino/genimage.cfg
+++ b/board/olimex/a20_olinuxino/genimage.cfg
@@ -5,7 +5,7 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8KB
+		offset = 8K
 		size = 1016K # 1MB - 8KB
 	}
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
