Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F007C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:08:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9CF160E98
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9CF160E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA9F83AFD;
	Fri, 23 Jul 2021 20:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImcG8G-UHz-A; Fri, 23 Jul 2021 20:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1F4083AD4;
	Fri, 23 Jul 2021 20:08:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FB441BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BE1B405F7
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvOfD3kWzxbM for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:08:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12441405A5
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 20:08:40 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 71TKmoURu0K6n71TKmx4Fl; Fri, 23 Jul 2021 22:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627070919; bh=iJMtmRdnBDlLm2qKwLOjueOwUcLu4LPSWF9bsvaCJCo=;
 h=From:To:Subject:Date:MIME-Version;
 b=JdveG1UZDUujAvhIQ2c64i07WNMuHES0y/P8jpRou3yqGf0xzvH2pc8uTxnNb0uNa
 PauGRw2SzyLrlnk6lkSV7ppz0345rugXskRzvKRr8vdJpcIJcOlztFWS2hkuSe3QUn
 JrXYAntxRmRdS+aUlIddSv25eVY0VzN/1SHil+1zv4fQTSu8TE+1oNTtcIRHJ35ydv
 DBGyjE5oujFBK1W/EZuZ9HmbiHDQB+wG68+X2sdbvyAupQhrt/XKsvBsTIKdTPHAJN
 MOPoaWoCZa2HT14aee4HxUvb++dUMEB2ZS52hqziPjPHHRpspEBae8HTauWu5iUlc8
 avT4T1xfeY6aw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Jul 2021 22:08:35 +0200
Message-Id: <20210723200837.1802930-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210703221223.4194738d@windsurf>
References: <20210703221223.4194738d@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEmcMIimO2S3tgYLWc3LawtliEq4o7/zlCYwLXUaFoqGEVqWst6CDmqnGtHGAXQDE2aAAjdPWhShoPvBeStIHVYtLDXfhhWmHQLnuTWEBJF5trY64CxO
 QWYxy27PWahGjY7keFXggT6pfITDlskP1PJobmLWk61hskHXCJkawwV2MlriBHZns4X183RTDSc3XZ6XLv8lz9FYrwJXVwdOR4ypXyp3kszMAi1KviSmgL+2
 nW2EjzUIaIBZlrqhn+6EnkAvORdJhOjmL/1KZzRGP5wqFRmSl/xwmokROJJF4rjbBitYSNlaOrm7nRVpD5a1lQ==
Subject: [Buildroot] [PATCH 0/2] package/at: bump version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patchset allows to bump package at. First patch converts all local
patches to git format as requested by Thomas Petazzoni, while the second
actually switch SITE to the official one and bump version.

Giulio Benetti (2):
  package/at: convert local patches to git format
  package/at: bump version to 3.2.2

 ...Makefile.in-replace-IROOT-by-DESTDIR.patch | 27 +++++++++++--------
 ...ake-install-for-non-root-don-t-stri.patch} | 24 +++++++++++------
 ...tloadavg.c-compilation-revert-to-3..patch} | 21 ++++++++++-----
 package/at/at.hash                            |  2 +-
 package/at/at.mk                              |  6 ++---
 5 files changed, 51 insertions(+), 29 deletions(-)
 rename package/at/{0002-Makefile.in-make-install-fix.patch => 0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch} (83%)
 rename package/at/{0003-getloadavg.c-fix.patch => 0003-getloadavg-fix-getloadavg.c-compilation-revert-to-3..patch} (54%)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
