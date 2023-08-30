Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADEAC83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C3CB41B99;
	Wed, 30 Aug 2023 19:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C3CB41B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4_dfMvGe9S2; Wed, 30 Aug 2023 19:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A3941B8C;
	Wed, 30 Aug 2023 19:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9A3941B8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27B8E1BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0062840465
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0062840465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEPOBJkEZmR6 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:15:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A45D340017
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A45D340017
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89853FF805;
 Wed, 30 Aug 2023 19:15:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbQet-000F6R-UE; Wed, 30 Aug 2023 21:15:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier via buildroot <buildroot@buildroot.org>
References: <20230728212952.3890970-1-brandon.maier@collins.com>
Date: Wed, 30 Aug 2023 21:15:19 +0200
In-Reply-To: <20230728212952.3890970-1-brandon.maier@collins.com> (Brandon
 Maier via buildroot's message of "Fri, 28 Jul 2023 21:29:52 +0000")
Message-ID: <873500pcjc.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libubootenv: backport fix for
 NOR flashes
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Brandon" == Brandon Maier via buildroot <buildroot@buildroot.org> writes:

 > Fixes a bug present since v0.3.3 that causes extremely slow writes to
 > NOR flashes.

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
