Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD57C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 16:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1113781FAC;
	Wed,  4 Jan 2023 16:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1113781FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hRjaJfr5VVZk; Wed,  4 Jan 2023 16:52:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62B2281FB0;
	Wed,  4 Jan 2023 16:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62B2281FB0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24B6D1BF5DF
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 005B281FAA
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 005B281FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7vzfDTTG8hA for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 16:52:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9EAD81FA9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9EAD81FA9
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 16:52:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A4E6D40005;
 Wed,  4 Jan 2023 16:51:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pD6zc-0053MK-QO; Wed, 04 Jan 2023 17:51:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
 <20230101233653.487175-10-ricardo.martincoski@gmail.com>
Date: Wed, 04 Jan 2023 17:51:56 +0100
In-Reply-To: <20230101233653.487175-10-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 1 Jan 2023 20:36:33 -0300")
Message-ID: <874jt6z1hv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 09/29] package/tekui: really disable
 parallel build
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

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Commit "c80789c917 tekui: disable parallel build" added TEKUI_MAKE but
 > that is not a symbol used by the generic package infra.

 > Ensure -j1 is passed to the build and install commands by using
 > TEKUI_MAKE explicitly.

 > Fixes:
 > http://autobuild.buildroot.net/results/c6cd0d488581013a8b215b0ee2fd8f549a868d4b

That build seems to use make -j1?

 > Cc: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
