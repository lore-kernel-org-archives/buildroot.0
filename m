Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9F3C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C91F841BED;
	Thu, 24 Aug 2023 21:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C91F841BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xX1leYYozhIB; Thu, 24 Aug 2023 21:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D208741D7C;
	Thu, 24 Aug 2023 21:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D208741D7C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA0D71BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CADCC835F2
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CADCC835F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUwTnCBbF2iT for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:27:02 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3FE2835E9
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3FE2835E9
Received: by mail.gandi.net (Postfix) with ESMTPSA id B17F160005;
 Thu, 24 Aug 2023 21:26:59 +0000 (UTC)
Date: Thu, 24 Aug 2023 23:26:58 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230824232658.616ff7e0@windsurf>
In-Reply-To: <87ttsocexi.fsf@48ers.dk>
References: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <20230801121118.72610acf@windsurf>
 <SY2PR01MB2778DE94AA435DAE575AAFD7940BA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <87y1i0cfjz.fsf@48ers.dk> <20230824231615.44df3647@windsurf>
 <87ttsocexi.fsf@48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692912420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyI8FVz+AIUP8puV7LHnjj5Xq755CCMihJl7nBfiYpw=;
 b=ZvGMXDecwKXaLdnKMRt7RQF6/iaUYNG71DQ7seXJReuS0HSm1JYrnjqIakkg3LBEXGInYY
 t8ZMoeBAZF3Hq+/fJTEE24n1ckkyEyBmzEOYgEhYuApOne1UENsns7dJL+5UOxrn5M1L2G
 d7hfBiO+FFJhpypkSr6lBC3dSgTRJGQY1L1zR0s6Qm1O43IxeyvqJWWQYPiTlmDKj948WG
 WPjwIXtkJeyGG/H0Bze3tfkvp86jxQbr9nwoUCRSLD+pvqwdVN0zswKRz5kipgcjWKyl67
 iyaEvfeJpSedfLRsnMUHUaOaf1sZEuIMk3TlbLI5DaG0PZzGAOqogCaq41X7lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZvGMXDec
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org
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
Cc: Afshin Pir <Afshin.Pir@gallagher.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 24 Aug 2023 23:23:53 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> It is unfortunately not right away clear to me how we can do that - Make
> source can fail for all kind of reasons.
> 
> Any ideas?

You could run "make busybox-source" first, to see if at least we're
able to source a well known package that's known to work. If that fails
(it would have failed with the missing Perl thing), we can abort and
notify us.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
