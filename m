Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F176C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42D56401D6;
	Sat,  3 Feb 2024 18:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D56401D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L4LRnRoRwgkP; Sat,  3 Feb 2024 18:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67A9241D80;
	Sat,  3 Feb 2024 18:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67A9241D80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB0D61BF834
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8D7041DE7
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtMoA5hnW0gH for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A825E41DA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A825E41DA7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A825E41DA7
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:11:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 375CC20005;
 Sat,  3 Feb 2024 12:11:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWErt-009OrU-1L;
 Sat, 03 Feb 2024 13:11:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Hitz via buildroot <buildroot@buildroot.org>
References: <20240110170759.3966933-1-christian@klarinett.li>
Date: Sat, 03 Feb 2024 13:11:33 +0100
In-Reply-To: <20240110170759.3966933-1-christian@klarinett.li> (Christian Hitz
 via buildroot's message of "Wed, 10 Jan 2024 18:07:57 +0100")
Message-ID: <87jznlsq6i.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/qt5/qt5base: add
 QT5BASE_CPE_ID_VENDOR and QT5BASE_CPE_ID_PRODUCT
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
Cc: Christian Hitz <christian@klarinett.li>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Hitz <christian.hitz@bbv.ch>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Hitz via buildroot <buildroot@buildroot.org> writes:

 > From: Christian Hitz <christian.hitz@bbv.ch>
 > cpe:2.3:a:qt:qt:5.15.8:*:*:*:*:*:*:* is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/detail/3A753A6D-0AFE-4E62-9C2F-58C8B630830C

 > Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
