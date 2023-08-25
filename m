Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31625C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E14E761022;
	Fri, 25 Aug 2023 13:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E14E761022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrIiJnyT_r5f; Fri, 25 Aug 2023 13:20:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 457C560BD8;
	Fri, 25 Aug 2023 13:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 457C560BD8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 274B51BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0136240993
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0136240993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hut2mYw_8q3L for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:20:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DB0A4049F
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB0A4049F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15BEB20009;
 Fri, 25 Aug 2023 13:20:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZWk8-002u9c-8S; Fri, 25 Aug 2023 15:20:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230705162011.1224688-1-bernd@kuhls.net>
Date: Fri, 25 Aug 2023 15:20:52 +0200
In-Reply-To: <20230705162011.1224688-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 5 Jul 2023 18:20:11 +0200")
Message-ID: <87il93b6mj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: force arm mode instead
 of Thumb mode
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fix the following build failure:
 > /tmp/ccw5V2Ti.s: Assembler messages:
 > /tmp/ccw5V2Ti.s:2013: Error: selected processor does not support `itt gt' in Thumb mode
 > /tmp/ccw5V2Ti.s:2014: Error: Thumb does not support conditional execution
 > /tmp/ccw5V2Ti.s:2015: Error: Thumb does not support conditional execution
 > /tmp/ccw5V2Ti.s:2017: Error: selected processor does not support `it le' in Thumb mode
 > /tmp/ccw5V2Ti.s:2018: Error: Thumb does not support conditional execution
 > /tmp/ccw5V2Ti.s:2020: Error: selected processor does not support `it gt' in Thumb mode
 > /tmp/ccw5V2Ti.s:2021: Error: Thumb does not support conditional execution

 > Fixes:
 > http://autobuild.buildroot.net/results/3fc/3fc68f756cf1661673941c411c4a2477e901e361/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
