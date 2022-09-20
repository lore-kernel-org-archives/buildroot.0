Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2388CC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 09:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 792B840BE5;
	Tue, 20 Sep 2022 09:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 792B840BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqzzE6SaURPb; Tue, 20 Sep 2022 09:19:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A29EF4013F;
	Tue, 20 Sep 2022 09:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A29EF4013F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42C7D1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 09:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 034D041548
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 09:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 034D041548
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lSpxHxTRJ3I0 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 09:19:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FAD54152D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FAD54152D
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 09:19:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 59D181BF208;
 Tue, 20 Sep 2022 09:19:20 +0000 (UTC)
Date: Tue, 20 Sep 2022 11:19:19 +0200
To: <yann.morin@orange.com>
Message-ID: <20220920111919.784ffa7e@windsurf>
In-Reply-To: <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
 <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663665560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMbYmEeD1XOK5TgVFUL5Z4lp0DJhQpoeX12fukfmUf8=;
 b=ogCfnRXnQuReDzClzk6SuST6zC5h0GcOlX51kvhgpwprsG2Zr6jMcR1ZM4oZg65oNbzf6X
 kXkhQpKOhRBvwCX/gtqBIf9f42pdAQv7H+WLAvzcY5+P2G+ZqH1JlEOt+YdtDumrVRWP5C
 uNXNDiadrLIJhsSbkLHNJTgC+PSrvZ1q4OXlbkYHM8120SYtoE/uO3Dn7oyfTorGX2A4qW
 ILWPYHE6MXQDknfkwolwmpNx76Eyu8GiOgNcqepYrXiPDmEBWYj3AcKEmgrXxyDVc9/tq9
 DZ35yg6nqQaAbSxDs6IYGtW/juWQY3XGQUpPPB6SK/8ontw5dFfiI9OlpDc1hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ogCfnRXn
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Howdy,

On Tue, 20 Sep 2022 11:11:43 +0200
<yann.morin@orange.com> wrote:

> Sorry, I was not explicit enough. Yes, the filtering only, i.e. only
> running 'file' on all those 16k+ files takes more than a minute:
> 
>     $ date +%s; find host/*bin host/lib* -type f |while read f; do
>         mime=$(file -b --mime-type ${f})
>         if test "${mime}" != "application/x-sharedlib" -a
>                 "${mime}" != "application/x-executable" ; then
>             continue
>         fi
>         printf '%s\n' "${f}"
>     done |wc -l; date +%s
> 
>     1663659605
>     339
>     1663659681
> 
> I.e. 76 seconds just to identify the files to actually look at.

ACK.

> Or we can see at optimising it. Overall, I am not a fan of "if it's too
> slow, don't do it", but I prefer "if it's too slow, make it faster".

Sure :-)

> So, we can start by spawning less processes, then use sed to filter out
> the result:
> 
>     find ${HOST_DIR}/*bin ${HOST_DIR}/lib* -type f -print 0 \
>     |xargs -0 -r file --mime-type \
>     |sed -r -e '/^(.+): application/(x-executable|x-sharedlib)$/!d; s//\1/' \
>     |while read f; do
>         readelf blabla...
>     done

If it's really running "file" on a zillion files that is slow, I'm not
sure how this can really improve the performance: it still runs "file"
on zillion files.

Also, I initially had some constructs with a ... | while read f, but
the variables in the sub-shell where not visible outside, so the
"bailout" variable didn't work.

An alternative would be to try to do this in Python and use
parallelization.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
