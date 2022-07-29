Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783AAC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 18:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ADB1421E6;
	Fri, 29 Jul 2022 18:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ADB1421E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AH9y59LZLz8b; Fri, 29 Jul 2022 18:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D08B941BD5;
	Fri, 29 Jul 2022 18:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D08B941BD5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBE41BF575
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A82F8426B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A82F8426B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovFmYCEqCP3a for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 18:45:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77DE284123
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77DE284123
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 18:45:51 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc21b.ng.seznam.cz (email-smtpc21b.ng.seznam.cz [10.23.18.27])
 id 039bacf8b5bb13a3039c128f; Fri, 29 Jul 2022 20:45:49 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by email-relay28.ng.seznam.cz (Seznam SMTPD 1.3.137) with ESMTP;
 Fri, 29 Jul 2022 20:45:46 +0200 (CEST)  
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 20:45:39 +0200
Message-Id: <20220729184542.213544-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-szn-frgn: <35a6352c-6c6d-4f14-8287-edaf9794ce42>
X-szn-frgc: <0>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=beta; 
 t=1659120349; bh=vVqDhfRV3/w2YEJF8HO9us9hYg4XBM5JHbjUyc0Xlp0=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
 b=FgsBlJxUuTr5XZlQIKqpOAeIip0XnUoLXaO++1/ygSD0+xOjJFCbiOghOEtAoP9T+
 0KUTWp8tpHSIAqb5gOn703DwJsF6KNdrE7Yl1JzPKlpQOTWEqDF81sa2GQ1tMdXcZJ
 8+G2MGCJMZxHYuW9EnIHVrZWntkRPr/UoalPi4tA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=beta header.b=FgsBlJxU
Subject: [Buildroot] [PATCH 0/3] modem-manager, libqmi and libmbim updates
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

Petr Vorel (3):
  package/libmbim: bump version to 1.26.4
  package/libqmi: bump version to 1.30.8
  package/modem-manager: bind version to 1.18.10

 package/libmbim/libmbim.hash             | 2 +-
 package/libmbim/libmbim.mk               | 2 +-
 package/libqmi/libqmi.hash               | 2 +-
 package/libqmi/libqmi.mk                 | 2 +-
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
