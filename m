Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11A6C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 18:48:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 016DB610FD
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 18:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 016DB610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE82D40119;
	Wed, 18 Aug 2021 18:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kqJShtl8Pbb0; Wed, 18 Aug 2021 18:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED46D401C4;
	Wed, 18 Aug 2021 18:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCAC51BF2EF
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 18:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B928B6068F
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 18:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EnbkK4V7byoY for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 18:48:09 +0000 (UTC)
X-Greylist: delayed 00:08:11 by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB7CD6064E
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 18:48:09 +0000 (UTC)
Received: from z-store.grenoble.cnrs.fr (z-store.grenoble.cnrs.fr
 [147.173.1.59])
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTP id B17DABFAD7
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 20:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1629311994;
 bh=aHpqaC9uKoxt0ckJaMZ3RtMTZ25cLK+sjRSt5pErjHc=;
 h=Date:From:To:In-Reply-To:References:Subject:From;
 b=d4frDvYZV7/rcMAMz7Htyo9yYaEWaw/eOSS1mld8geawp5OlsOkZ2Ngo7xTn4N0r4
 Nhc+6FMSL0cVPRhzxse2vSaUIYw+1MkasplWLe3EPHb3jxoDTKPiUL3k+A6kp8j1Rl
 VXabhWAdCWY5NW9ieaBoBWuLK3sZeXJHtVmHjNu5mpMbT/BWPA1UE0XfELegTNA262
 D3HTtyN0GeBcdRS62Ls2EaB/o0CDI3SFeESlCsz9K6DdzFw7NTBk1zli2pQkm4t6Oe
 ihCrmI0+0auq5MNvOMplk581wQOeY6IuXfCQUXD1eL1+Ka8oGJ7CeqCshlo2ld+3TR
 gK8DyfN0kwWjQ==
Date: Wed, 18 Aug 2021 20:39:54 +0200 (CEST)
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
To: buildroot@buildroot.org
Message-ID: <1195930689.13341578.1629311994018.JavaMail.zimbra@neel.cnrs.fr>
In-Reply-To: <b19518d7-4b48-e3fc-6d4c-f84238f1186d@microchip.com>
References: <20210816120418.427-1-ludovic.desroches@microchip.com>
 <20210816120418.427-3-ludovic.desroches@microchip.com>
 <aeca7e19-f3f0-c66b-8033-f6bb1da29ab2@mind.be>
 <b19518d7-4b48-e3fc-6d4c-f84238f1186d@microchip.com>
MIME-Version: 1.0
X-Originating-IP: [147.173.1.60]
X-Mailer: Zimbra 8.8.15_GA_4101 (ZimbraWebClient - FF91 (Linux)/8.8.15_GA_4059)
Thread-Topic: configs/acmesystems_*: bump at91bootstrap3 version
Thread-Index: AQHXkpbpfV4JxvLDm0qfbqT5vv0HXKt4NgQAgADq5YBYcFxZAg==
Subject: Re: [Buildroot] [PATCH 2/3] configs/acmesystems_*: bump
 at91bootstrap3 version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello!

Ludovic wrote:
> I didn't test it on old boards.

Note that I did test my patch on the Acqua. But, since there was no
appropriate release at the time, I used a SHA1 instead. If I understand
correctly, there is no substantial difference between that SHA1 and the
current release of AT91Bootstrap 3.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
