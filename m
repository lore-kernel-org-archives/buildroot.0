Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D690BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 16:05:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454DC61BD3
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 16:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 454DC61BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC18B40106;
	Mon, 15 Nov 2021 16:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkYWnn4GoSV6; Mon, 15 Nov 2021 16:05:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E81FB4017E;
	Mon, 15 Nov 2021 16:05:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9868E1BF574
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 16:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94FCF80D4E
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 16:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C__f_W3cMYhl for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 16:05:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7AD480D4A
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 16:05:51 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 23E914407C1;
 Mon, 15 Nov 2021 18:05:30 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1636992330;
 bh=noULXrVNERNCAt1TU3WAIZxs+a9PgZg27cA2eUj7i9w=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=dRa6RnYvNsJd0RGzN1kC37mGWn7Rhm+Qfd9Wg9JT0MM/r6+VtYmHXiGZM96ArZtmT
 bAtd1xK+IyGJTI721u33mrGmXeX1cNQdi0AxJuotebx9J9HsCIA2QtBDBQbRQOVLq2
 XjS61lce5iR5QwKb/a8VF7cT/2JBonVve68Big5em4y1iTKr80HGwWxgW5aq3WJUfc
 Fz8jvWGtdqFHR5dk3xVbun4dnt6/beZknTiJKEEUKkkUF4A7JvsRekeERxFtNeHE2w
 OxsPhvK5+BXlcv9hMNY6/w2+Pd80jF4v7B/rVyeYweUzT8eq9PLFX7VC22PII6VUoW
 gRbkBH17zrccQ==
References: <20211115133000.72041-1-kory.maincent@bootlin.com>
 <20211115133000.72041-2-kory.maincent@bootlin.com>
 <20211115153825.251bff20@windsurf> <87r1bhl97g.fsf@tarshish>
 <20211115165044.5a524d4b@windsurf>
User-agent: mu4e 1.6.9; emacs 27.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Nov 2021 18:01:33 +0200
In-reply-to: <20211115165044.5a524d4b@windsurf>
Message-ID: <87mtm5l7z8.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/psplash: add support to missing
 configure options
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Kory Maincent <kory.maincent@bootlin.com>, phil.eichinger@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Mon, Nov 15 2021, Thomas Petazzoni wrote:
> On Mon, 15 Nov 2021 17:37:49 +0200
> Baruch Siach <baruch@tkos.co.il> wrote:
>> On Mon, Nov 15 2021, Thomas Petazzoni wrote:
>> > On Mon, 15 Nov 2021 14:30:00 +0100
>> > Kory Maincent <kory.maincent@bootlin.com> wrote:
>> >  
>> >> Add support to three configure options:
>> >> --disable-startup-msg: Disable text banner output on startup
>> >> --disable-progress-bar: Disable progress bar
>> >> --enable-img-fullscreen: Enable the logo image in fullscreen mode
>> >> 
>> >> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>> >> ---
>> >>  package/psplash/.Config.in.swp | Bin 0 -> 12288 bytes  
>> >
>> > Are you sure we want this file in Buildroot ? :-)  
>> 
>> A file of this name is already in current master branch. Introduced in
>> commit 70440e28c8eef ("package/python-pudb: bump to version 2021.1").
>
> I was confused initially, I thought you said
> package/psplash/.Config.in.swp already existed, but it's .Config.in.swp
> in the python-pudb package. We definitely want to get rid of it, indeed.
>
> As an Emacs user, should I also suggest to forbid the usage of vim? :-)

Or we can add '*.swp' or '.*' patterns to top level .gitignore. The
kernel has the latter.

I have '*.swp' in .git/info/exclude for the same effect.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
