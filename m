Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA88C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 14:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3FA840122;
	Fri, 10 Nov 2023 14:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3FA840122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4J3AOBbQr7br; Fri, 10 Nov 2023 14:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B8F040A4C;
	Fri, 10 Nov 2023 14:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B8F040A4C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1621E1BF2B5
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0A6D60FE6
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 14:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0A6D60FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZNg46gNQWXf for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 14:11:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A5C460FE1
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 14:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A5C460FE1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73D8940006;
 Fri, 10 Nov 2023 14:11:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r1SDz-00419x-30;
 Fri, 10 Nov 2023 15:11:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-29-adam.duskett@amarulasolutions.com>
 <b54a0c07-e87d-4a8c-8c6c-1a2302e18ddf@othermo.de>
Date: Fri, 10 Nov 2023 15:11:07 +0100
In-Reply-To: <b54a0c07-e87d-4a8c-8c6c-1a2302e18ddf@othermo.de> (Marcus
 Hoffmann via buildroot's message of "Thu, 26 Oct 2023 16:13:35 +0200")
Message-ID: <87zfzlk8as.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 28/30] package/python-pygame: drop package
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Hi,
 > On 26.10.23 11:26, Adam Duskett wrote:
 >> The python-pygame package has not recieved any update since
 >> Sun May 1 22:15:17 2016 (commit: a9ec96e545102ae5ccd4280323d35360b0a5072d)
 >> 
 >> As python 3.12.0 no longer supports distutils, drop the package as the package
 >> is clearly unmaintained.

 > I'd like to update the package to a recent version of pygame instead.
 > Updating the package should be fairly straightforward (famous last
 > words...) but I've struggled to find a platform (real hardware or
 > virtualized) where I can actually test this with actual graphical
 > output. :-/

Great, I also had a quick look at it recently as it is one of the few
packages with a hg site, but ran out of time.

Given that pygame supports SDL2, I guess you could just test in one of
our QEMU defconfigs?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
