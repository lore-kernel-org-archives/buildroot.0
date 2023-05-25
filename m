Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D542C77B7E
	for <buildroot@archiver.kernel.org>; Thu, 25 May 2023 21:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF5F642A1A;
	Thu, 25 May 2023 21:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF5F642A1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WWMMWuNcS3oM; Thu, 25 May 2023 21:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00C31400DD;
	Thu, 25 May 2023 21:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C31400DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 500F81BF360
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 21:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2866F400DD
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 21:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2866F400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emm63WDluRhD for <buildroot@lists.busybox.net>;
 Thu, 25 May 2023 21:51:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48E5540017
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48E5540017
 for <buildroot@buildroot.org>; Thu, 25 May 2023 21:51:22 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 9FA875FD25;
 Fri, 26 May 2023 00:51:18 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Fri, 26 May 2023 00:51:17 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Fri, 26 May 2023 00:51:01 +0300
Message-ID: <20230525215103.37218-1-svromanov@sberdevices.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/05/25 11:25:00 #21349968
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1685051478;
 bh=uqmNXMRTstX5jhKyXeWoQRcJN10IlH7+zI/ScauhrCc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=kZCVZ1F50QXsMn7xHFsnvtaKdToZjYnkoqP1ruuHiNp3xju6zgPMkpU/kZ4MArbtW
 9QDF/AsuqQtDavYHtTW5ho5OV6ZGwQZvmj5MFhAuO1rm6pa16oJRcAuEZO1dIugukc
 HOQXwLly7Mfi3jwHpKydBRq+Dtu91saQ/h2FXTOkZUmYje/S0AN0S0L/XvMTb0Pno4
 7A8B/eSN/p8OzKimsH4XJ4IFl7dmI+22CsURa7bXPzr4wRPtqBVRqWXbJm0hl8Vd6F
 INdG5aT1AuygQvWoAkdeQxYsZ1TiBVUYh8lNbKUbiuBvJRd7V4PJ7BAq95w2+dO7+l
 w82jclRk9iFqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=kZCVZ1F5
Subject: [Buildroot] [RFC PATCH v1 0/2] Added package: 'sysbench' and its
 dependency: 'ck'.
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
From: Sergey Romanov via buildroot <buildroot@buildroot.org>
Reply-To: Sergey Romanov <svromanov@sberdevices.ru>
Cc: svromanov@sberdevices.ru, chip-club@ya.ru, akopytov@gmail.com,
 sbahra@repnop.org, thomas.petazzoni@bootlin.com,
 sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Sergey Romanov (2):
  package/ck: new package
  package/sysbench: new package

 .checkpackageignore                           |   1 +
 DEVELOPERS                                    |   4 +
 package/Config.in                             |   2 +
 ...oid-buildroot-s-influence-on-LDFLAGS.patch | 191 ++++++++++++++++++
 package/ck/Config.in                          |  23 +++
 package/ck/ck.hash                            |   3 +
 package/ck/ck.mk                              |  42 ++++
 package/sysbench/Config.in                    |  28 +++
 package/sysbench/sysbench.hash                |   3 +
 package/sysbench/sysbench.mk                  |  30 +++
 10 files changed, 327 insertions(+)
 create mode 100644 package/ck/0001-Avoid-buildroot-s-influence-on-LDFLAGS.patch
 create mode 100644 package/ck/Config.in
 create mode 100644 package/ck/ck.hash
 create mode 100644 package/ck/ck.mk
 create mode 100644 package/sysbench/Config.in
 create mode 100644 package/sysbench/sysbench.hash
 create mode 100644 package/sysbench/sysbench.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
