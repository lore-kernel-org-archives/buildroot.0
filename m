Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAA2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 15:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19B4540165;
	Thu,  9 Nov 2023 15:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19B4540165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UR4D7RQa8uYV; Thu,  9 Nov 2023 15:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A43540166;
	Thu,  9 Nov 2023 15:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A43540166
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BE671BF31F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 15:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 819F4814A0
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 15:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 819F4814A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBCLeVapCJnV for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 15:01:42 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D942813CF
 for <buildroot@uclibc.org>; Thu,  9 Nov 2023 15:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D942813CF
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0B9B9C8D2C
 for <buildroot@uclibc.org>; Thu,  9 Nov 2023 14:57:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E6FCE0004;
 Thu,  9 Nov 2023 14:57:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r16T4-002Unw-0K;
 Thu, 09 Nov 2023 15:57:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20231002195159.3053254-1-bernd@kuhls.net>
 <20231002205144.GD2957__28552.5928296678$1696279934$gmane$org@scaer>
 <pan$e4c2e$65ef9aa7$60d9f1ab$55fd2db7@ID-313208.user.individual.net>
Date: Thu, 09 Nov 2023 15:57:14 +0100
In-Reply-To: <pan$e4c2e$65ef9aa7$60d9f1ab$55fd2db7@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Tue, 03 Oct 2023 13:12:10 +0200")
Message-ID: <87il6bnfed.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: fix cross build
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Am Mon, 2 Oct 2023 22:51:44 +0200 schrieb Yann E. MORIN:
 >> So your patch looks like it is correct.
 >> 
 >> However, I would challenge it on other grounds: ISC decided to stop
 >> maintaing dhcp starting end of 2022, almost a year ago, when they
 >> released the last version of dhcp.
 >> 
 >> Should we just drop that package now and be done with it?

 > Hi Yann,

 > my patch follows Peter's intention:
 > "If it is dead upstream and hard to fix then that naturally makes it 
 > harder to do, but the intention is to fix it."
 > http://lists.busybox.net/pipermail/buildroot/2022-April/640709.html

.. Which was a discussion about supporting it during the support period
of Buildroot 2022.02.x, but OK.

Maybe we should consider dropping it for 2024.02.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
