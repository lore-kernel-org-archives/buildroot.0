Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE864C43217
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 13:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58D96401B2;
	Mon, 28 Nov 2022 13:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58D96401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCNMcVzep_gX; Mon, 28 Nov 2022 13:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A4AB4021C;
	Mon, 28 Nov 2022 13:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A4AB4021C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7471BF38D
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 13:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB510401B2
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 13:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB510401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOTEunZpBkXv for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 13:12:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 732FB4021C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 732FB4021C
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 13:12:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E25641C000D;
 Mon, 28 Nov 2022 13:12:23 +0000 (UTC)
Date: Mon, 28 Nov 2022 14:12:21 +0100
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20221128141221.0b2f5a56@windsurf>
In-Reply-To: <CAMo8BfKE9KqDYyFhsKK9M8XjjuR=TtONT8JdKniFKwAgfr4HVg@mail.gmail.com>
References: <20221125191155.111c4ddc@windsurf>
 <CAMo8BfKE9KqDYyFhsKK9M8XjjuR=TtONT8JdKniFKwAgfr4HVg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669641144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uE69fO7qjtB42teI4nZ8eCzJ71dDkqQPTCwaim7/FJY=;
 b=JKXwgUJKDHiIwCbIp+G8CToWgL764X2V7w2UpWPKDfJQ22XTY8vvNenu7ID6sxOJXJDO6U
 xh9lGmoL1SxAGD/u0CDcKKcRfYpspLhD9YAUnbEnn8G0qMILP6IgcoVSM+4mLqn1I3cKX4
 /zHllWBHIW8tUxEVnPM2OtnAKtiDrJh9kufzzwkbE4Y2YUpzEiag31GIZIcr4YOxYD6lW6
 V9k6+RLLoqb+T9QzYLj/aGO0ALjeGzdeDx5Qjj9v+pF9QDtoTpQUVpep2b6nnBMnewdHUO
 /xWFEmQyF+wptOK+ZETwzU6AwwduoY4ZvvoGvAI0Zcp/a/oVP2J3/LVCZnDAlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JKXwgUJK
Subject: Re: [Buildroot] Xtensa qemu nommu defconfig not working
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Romain Naour <romain.naour@smile.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 28 Nov 2022 03:54:19 -0800
Max Filippov <jcmvbkbc@gmail.com> wrote:

> > Max, do you think you could have a look at what is happening?  
> 
> AFAICS the following commit in the elf2flt
> https://github.com/uclinux-dev/elf2flt/commit/5e08f19683163584f23b953e570749964758c439
> 
> disabled address endianness fixup for addresses in the text segment for
> xtensa which results in the observed failure. I haven't checked, but from
> the code it looks like not only the xtensa may be affected.
> I can confirm that reverting that change fixes xtensa nommu boot.

Thanks for the investigation. How do we move forward from this? I must
say I never went into the details of elf2flt, so I'm not sure how to
fix this myself.

Should we report a bug to upstream elf2flt (which are generally never
looked at), or is someone volunteering to provide a fix for this?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
