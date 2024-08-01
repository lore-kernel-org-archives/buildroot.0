Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28F4C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 10:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82E506061D;
	Thu,  1 Aug 2024 10:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gd3BWzErBr2r; Thu,  1 Aug 2024 10:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A739F60640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A739F60640;
	Thu,  1 Aug 2024 10:50:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E91EE1BF47E
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 10:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E313740958
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 10:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IF-KGFUt6Luc for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 10:50:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D38C40940
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D38C40940
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D38C40940
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 10:50:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A8D0C0008;
 Thu,  1 Aug 2024 10:50:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sZTON-007cvV-2x;
 Thu, 01 Aug 2024 12:50:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
 <bae05249-8ad9-4acc-90dc-15c783e8e921@mind.be>
 <CA+TH9V=ZHiZLdXFsgiShoA3Hzr0y2ZNPXiiCm1J0qOu+jy1mKg@mail.gmail.com>
Date: Thu, 01 Aug 2024 12:50:43 +0200
In-Reply-To: <CA+TH9V=ZHiZLdXFsgiShoA3Hzr0y2ZNPXiiCm1J0qOu+jy1mKg@mail.gmail.com>
 (Angelo Compagnucci's message of "Fri, 12 Jul 2024 16:00:01 +0200")
Message-ID: <87a5hwseik.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 0/2] Fix fail2ban
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
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

Hi,

>> Do you know if this issue also occurs on 2024.02.x and 2024.05.x?
 >> 

 > I sent the patch on April 19 to silence the numerous package failings I was
 > already receiving. Not sure for the 2024.05, but surely the 2024.05 is
 > affected.

I was unable to reproduce it on 2024.02.x, but it indeed also fails on
2024.05.x. I believe it was introduced by commit 8937db8dd595e
(package/pkg-python.mk: migrate setuptools to pep517).

So committed both to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
