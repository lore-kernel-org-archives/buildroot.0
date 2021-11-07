Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D521C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 357D96124D
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 357D96124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07B17402A7;
	Sun,  7 Nov 2021 02:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IlWtTidE3j-G; Sun,  7 Nov 2021 02:42:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79BE94028E;
	Sun,  7 Nov 2021 02:42:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0931BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19BD5400EA
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qC4zG8n2AFYy for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:42:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C974400DB
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:42:05 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY8Dmuoe2Ff01jY8DmqTsc; Sun, 07 Nov 2021 03:42:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252925; bh=w/6cHlrZQ8f28sXJdwleoxz+FEezzt15Fh1N/745z1g=;
 h=From:To:Subject:Date:MIME-Version;
 b=ha3SNo8AtJjI6qz0ShI0AFZkV2o5XZjcfj2cFd/stjrUWuyP+79GHJesw60fS9H5W
 qBrlu1Wi2C0ta2ykTZs+5SObHaViCRcGBDqnHqNF8Yqcz0Znl6lSk5naRn8urOtuwu
 my0VcAGgru+P8glwemVKJ/1/1gcjiLM5JfZV3bc86MKq9bUbNVbRqiYwu/Il/x4U38
 +yu+1jjmePbVGq7XHJit447TMTPjp1CVESsVwEpYLSOY8TITpScLUgBchLO6cF8NIT
 quSU52sVCnWiDdnkvZf1cxyYl+JC/EQ8OLIhotu9D5mvMBYyPovq7lE9YSNy1oBLYn
 d2li9IMKmbCYQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:04 +0100
Message-Id: <20211107024204.3061159-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJjplBrTAZWb3ucSBKIlFVN39lPmcgSy05WhHc79AEgrde+p52xCKRxDEj5gThlTEp449V49AIamih1R68KdGJXBZpgioEq/HU8Bniho6TOgZt4ZXon8
 xOKAGsW9YAelye4t6sAEKGsKlc6oSJt+kOekeER1OWm6y7ex1iHTrlv+1MPehb9fo1l2Q+4dGhelTVpsA3bzGCBloXXEKUmKLxWSQyYlJj2xbVPuo7cHRRJq
 i2h0IgzQ0ozwjt5CeGUtzDnLqpI5PUHyCMNixCVBBNc=
Subject: [Buildroot] [PATCH 049/102] board/minnowboard/genimage.cfg:
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
 board/minnowboard/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/minnowboard/genimage.cfg b/board/minnowboard/genimage.cfg
index 521385aadd..34b3070901 100644
--- a/board/minnowboard/genimage.cfg
+++ b/board/minnowboard/genimage.cfg
@@ -8,6 +8,7 @@ image efi-part.vfat {
 			image = "bzImage"
 		}
 	}
+
 	size=10M
 }
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
