Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD6FEE49A6
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 21:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 010F1408FB;
	Sat, 19 Aug 2023 21:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 010F1408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBFYq1S_72Lq; Sat, 19 Aug 2023 21:18:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09DDA408E8;
	Sat, 19 Aug 2023 21:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09DDA408E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88EAE1BF868
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 21:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63252415E6
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 21:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63252415E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AgoaoVxIUQwF for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 21:18:31 +0000 (UTC)
Received: from smtpdh18-su.aruba.it (smtpdh18-su.aruba.it [62.149.155.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FD55415E3
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 21:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FD55415E3
Received: from localhost.localdomain ([95.47.160.93])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XTL0qNyCoB4j9XTL0qWmIG; Sat, 19 Aug 2023 23:18:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 19 Aug 2023 23:18:24 +0200
Message-Id: <20230819211825.60854-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDG3IgGO0q5QzLn7QRB4kGGH87IOsh9d0lsrv+ThYpwjiZhzeBJwNI9ABkl8+NLZceOvvkD1eCnMut/rH+zFC7wW4WnTblHr+V1/Aad2tdTypmntozRC
 MHLGduRw7s+FM3Ch3uJPyGJUENGgxkm/ARvCP6mjStEv0J6DG1q8rFSxpdM6kUj5Da709/kvX8J59MzbfJI0tvIV28XRTd8WQRUh911V3VEahSL/dZ1ICHrW
 1OSVsAEGgzBxqxFSkyK9pXXSqdW+Spx+w5rhliz+sFd7JoMNhGDuTIify89JSrlPT00qr2E+pvauqd+evHQDGh/4tN55xZOLMwS4ogQkxuXxCeR/1yP3X6L4
 ZwU5U81KhzvSTXHkIbVuXIP++GMwWw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1692479908; bh=gxg04hdvhCxAbJMc50b/VV1UW3VLP8j1yiC5zbI1i5U=;
 h=From:To:Subject:Date:MIME-Version;
 b=JsuWOU3Xqn7GK9rMClN9dMEB+M28W1NWIgVPkbeMT7wD0XVGuDJQc2q0EXugwDNW+
 BLc5m3Z1ZH5/Zji1xeQxHJnBpHlnbI1ikaMGsPwg5blxTaerXuxl7s2NhpusCGbp2s
 iU1bpnkL9gCpPdPpZKutrpHRdB0YvrxV0jkpyze7B+veNNRNjBYGRSn0ihsUJJPWuR
 Zxtxy2lfEmVx9qx7J8avxc8mBHzxRl8HkAoT7CQXpBV4eq/+rY2D2cHf9wJaHHqTwg
 unRRvyM/4t2RudKtbpjmOpmRj54LfeETi7fUN86fDMf9ATxAKonYNGvZutpGQlsCJk
 7S8tuoPhSq+Vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JsuWOU3X
Subject: [Buildroot] [PATCH 0/1] Document Sponsored-by tag
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

I'm trying to add Sponsored-by tag to give credits to Companies or Physical
Persons who sponsor the writing and/or the upstreaming process of a patch.
The goal, as described in the commit log, is to increase their involvement
into upstreaming patches that are otherwise kept private. The customers I work
for are interested in this and I've recently sent a patch for this to Linux too:
https://lore.kernel.org/all/20230817220957.41582-1-giulio.benetti@benettiengineering.com/
where I've received 2 feedbacks more or less positive.
I'm not promising that with the use of Sponsored-by: tag the patches will
hugely increase, but for me it's worth to try.

Let me know what you all think about it.

Thank you!
Best regards
Giulio Benetti

Giulio Benetti (1):
  docs/manual: add Sponsored-by tag

 docs/manual/contribute.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
