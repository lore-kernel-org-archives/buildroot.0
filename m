Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E45EC3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 16:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01228614CA;
	Fri, 25 Aug 2023 16:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01228614CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y3NHegqHWATS; Fri, 25 Aug 2023 16:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58E8561495;
	Fri, 25 Aug 2023 16:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58E8561495
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3643F1BF35E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E03A40352
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E03A40352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8AceWVobCL1 for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 16:55:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25EB340291
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 16:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25EB340291
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CA4C1C0003;
 Fri, 25 Aug 2023 16:55:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZa5W-0030P4-Vl; Fri, 25 Aug 2023 18:55:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230714182400.3801854-1-bernd@kuhls.net>
Date: Fri, 25 Aug 2023 18:55:10 +0200
In-Reply-To: <20230714182400.3801854-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 14 Jul 2023 20:24:00 +0200")
Message-ID: <87ttsn83kh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: increase default
 target ubifs image size
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > The new value is calculated based on:
 > ROOTFS_SIZE = 5G (see commit 3c98eb26db6501a373cc405c80505ba72fde9e96)
 > BR2_TARGET_ROOTFS_UBIFS_LEBSIZE = 0x1f800

 > 5G / 0x1f800 = 41610

 > Fixes:
 > http://autobuild.buildroot.net/results/f72/f72918d63510b170e5da01bfa9c247cf9dcf507f/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Suggested by Thomas:
 > https://lists.buildroot.org/pipermail/buildroot/2023-July/670125.html

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
