Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A54C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6BC440492;
	Fri,  1 Dec 2023 20:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6BC440492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mq4qLqdMjBS6; Fri,  1 Dec 2023 20:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BACA741A01;
	Fri,  1 Dec 2023 20:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BACA741A01
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78E621BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F00942172
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F00942172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id icRPNnfeqcr3 for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:15:55 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F05C4215E
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F05C4215E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04790C0003;
 Fri,  1 Dec 2023 20:15:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r99vU-004TK7-04;
 Fri, 01 Dec 2023 21:15:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231104220152.3252635-1-dev@bybram.com>
 <20231201100405.GL3177259@scaer>
Date: Fri, 01 Dec 2023 21:15:51 +0100
In-Reply-To: <20231201100405.GL3177259@scaer> (Yann E. MORIN's message of
 "Fri, 1 Dec 2023 11:04:05 +0100")
Message-ID: <87sf4l4r2g.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] configs/raspberrypi: bump Linux version
 to 6.1.61
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
Cc: Martin Bark <martin@barkynet.com>, buildroot@buildroot.org,
 Bram Oosterhuis <dev@bybram.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Bram, All,
 > On 2023-11-04 23:01 +0100, Bram Oosterhuis spake thusly:
 >> Linux 6.1 has been marked LTS for a long time now. Time to bump
 >> Linux for RaspberryPi's to the latest 6.1.61 Since April 2022
 >> the RaspberryPi defconfigs have compressed kernel module enabled
 >> by default. (see [1] and [2]).
 >> 
 >> To load compressed kernel modules kmod and xz packages are needed
 >> because busybox doesn't support it.
 >> 
 >> For testing I used RaspberryPi 2, 3(32+64bit) and 4(32+64bit), all with mdev enabled.
 >> 
 >> [1] https://github.com/raspberrypi/linux/commit/c45b4223a4e4a8cfe39edbb4949329ea478fa4e2
 >> [2] https://github.com/raspberrypi/linux/issues/4966
 >> 
 >> Signed-off-by: Bram Oosterhuis <dev@bybram.com>

 > Applied to next, thanks.

Sorry for the slow response, the xz compressed modules seems a bit of a
random choice by the rpi people. I wonder if it wouldn't make more sense
to use a kernel config fragment to just disable that rather than
enforcing kmod?

Or do they enable so many modules that they really take up a huge space
(and not fitting in our default rootfs size)?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
