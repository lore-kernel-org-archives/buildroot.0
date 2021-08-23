Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URI_HEX autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F38C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 23:19:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2474C613A7
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 23:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2474C613A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D78A64035E;
	Mon, 23 Aug 2021 23:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id geb8Czzr6fu5; Mon, 23 Aug 2021 23:19:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53D0940360;
	Mon, 23 Aug 2021 23:19:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 185561BF3AF
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 23:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 011EB80BC9
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 23:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5FgncCM_GqE for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 23:19:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A5D080BBA
 for <buildroot@busybox.net>; Mon, 23 Aug 2021 23:19:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id CB2DE1814BD; Tue, 24 Aug 2021 01:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1629760768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=dUmwV7yUwaNazF01wRNJja6r3pcIUsfB+gdIkk6lb4Q=;
 b=O++MgZlMd9+UH7DR9XkdVNoWehHWHT+vOxi7vPlUVPc6ItAq/SFVZ+yVIv4XALe4p1RzD9
 bRSe9KSXXKLlpX9TLQW2oV2yMDHdFswBGuQT/U9QgmLrTvpZNG/bBMTYfr2Xf1dGXidqXV
 IPqowbNxMXVBhyXKphCRZDmMP79NG9I=
In-Reply-To: <CAJpxd06H8_O2AWELYqqf71jpgkZNnHeEb8kvH3tPSDsEoV25NA@mail.gmail.com>
Date: Tue, 24 Aug 2021 01:19:27 +0200
To: bryce.schober@gmail.com
MIME-Version: 1.0
Message-ID: <54f5-61242d00-3-3eaf8580@172892221>
User-Agent: SOGoMail 5.2.0
X-Last-TLS-Session-Version: None
Subject: Re: [Buildroot] =?utf-8?q?Buildroot_mailing_list_archives_search?=
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

On Monday, August 23, 2021 23:55 CEST, bryce.schober@gmail.com wrote: 
 
> I've found that the "Search the List Archives" tool at
> https://buildroot.org/support.html seems to be broken. It seems that
> there's a DNS problem with buildroot-busybox.2317881.n4.nabble.com.
> 

This search dialog should better point to lore I guess. 

> And the mailman archives search is pretty rudimentary and not as effective
> a tool...
> 

Have a look at the archive on https://lore.kernel.org/buildroot/

This should have a much better search functionality. 

Regards,
Michael

> I'm trying to do the work to find out what is available all by myself...
> 
> <><  <><  <><
> Bryce Schober

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
