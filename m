Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E23CC87FCA
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 17:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86E183E10;
	Thu, 31 Jul 2025 17:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeL2AFcyRGyB; Thu, 31 Jul 2025 17:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE6F83E3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE6F83E3E;
	Thu, 31 Jul 2025 17:32:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BBBDA13D
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADDBF83E3E
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjMdrpr2hToc for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 17:32:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E504783E10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E504783E10
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E504783E10
 for <buildroot@uclibc.org>; Thu, 31 Jul 2025 17:32:14 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1uhX8Q-000688-HY
 for buildroot@uclibc.org; Thu, 31 Jul 2025 19:32:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 31 Jul 2025 19:31:54 +0200
Message-ID: <pan$ad114$711a1a5c$b50f2540$8d5409ec@ID-313208.user.individual.net>
References: <20250730203947.1097409-1-thomas.petazzoni__2388.75252414203$1753908012$gmane$org@bootlin.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 0/2] Upgrade glibc to 2.42
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Wed, 30 Jul 2025 22:39:43 +0200 schrieb Thomas Petazzoni via buildroot:

> Here is a small patch series bumping glibc to 2.42. I would probably
> recommend to *not* merge this into master right now, but rather merge it
> in next. Indeed, they removed termio.h, and this is likely to cause some
> amount of breakage here and there. Even gcc had to be fixed because of
> this.
> 
> So I believe we probably want to release 2025.08 with the existing glibc
> 2.41, and bite the glibc 2.42 bullet for our 2025.11 release.

Hi Thomas,

just a quick fyi: besides a fix for nfs-utils my usual setup

$ ls -la output/build/ | grep -v host- | wc -l
430

built without problems, runtime-test is pending however.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
