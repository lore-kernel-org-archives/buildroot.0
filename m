Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2104E784A9
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 06:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 691B6815AD;
	Thu,  5 Oct 2023 06:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691B6815AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-J2QVVfgJ8a; Thu,  5 Oct 2023 06:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2424E8148D;
	Thu,  5 Oct 2023 06:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2424E8148D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6E41BF25B
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 06:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA8586F521
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 06:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA8586F521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id US5bEcehauYl for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 06:25:06 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp3.osuosl.org (Postfix) with ESMTP id C21636F529
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 06:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C21636F529
Received: from pwmachine.numericable.fr (unknown [82.77.158.143])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1824520B74C0;
 Wed,  4 Oct 2023 23:25:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1824520B74C0
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu,  5 Oct 2023 09:24:57 +0300
Message-Id: <20231005062458.8973-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1696487106;
 bh=I72iboPW66cVyXhgCm9PB/6P9Ix8HEXkAY3GsYZcrTw=;
 h=From:To:Cc:Subject:Date:From;
 b=MvINLgdpmJql6p1Zr7zmZ0MbYrUuN+RsvWO9D9VoFLNm8RmRvrDgNr6NZinB+o3DB
 2/klCw2LDXnnQenUCCJABVnZtGoXMJ7xM+F+p5W6gRARv3APVo2qNbPyEl9Rxm0b3E
 OW9xprCTUD9AVF6iwHAlxhCQjsB8JMq+wgi6T2sU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=MvINLgdp
Subject: [Buildroot] [PATCH 0/1] package/tbb: fixes hash
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


Sorry, I got mixed up while bumping tbb and the whole sysdig stuff and actually
forgot to update the hash in the previous commit.
Lesson learnt, I will clearly double check before sending next patches.
The present patch fixes the situation with the correct (locally computed) hash.

Francis Laniel (1):
  package/tbb: fixes hash

 package/tbb/tbb.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


Best regards and again sorry for the disturbance.
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
