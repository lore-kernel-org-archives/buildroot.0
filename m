Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92784CD6133
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 20:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2946B60E41;
	Mon,  9 Oct 2023 20:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2946B60E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F83KQGtJf-Xr; Mon,  9 Oct 2023 20:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 372AA60E6A;
	Mon,  9 Oct 2023 20:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 372AA60E6A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9FBD1BF2F0
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 20:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2E5D81276
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 20:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2E5D81276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtwxJTNcCEdX for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 20:06:00 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 748118126D
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 20:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 748118126D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d143:e10c:f714:dfc9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3CD9C60128;
 Mon,  9 Oct 2023 22:05:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 09 Oct 2023 22:05:53 +0200
Date: Mon, 9 Oct 2023 22:05:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231009200553.GG14234@scaer>
References: <20231009170428.2836853-1-adam.duskett@amarulasolutions.com>
 <20231009170428.2836853-2-adam.duskett@amarulasolutions.com>
 <20231009172519.GF14234@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009172519.GF14234@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696881957;
 bh=RYea7073ngmkPDbTiwh8vOdUL1WBdofb0sTDplwQGzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UTEpKKXbpCBnOTpetvChx8KJzVxCfx3MuOKHSKwFnY+kVKBN4ks1Jn7oiq8eAu3pq
 twegPsHV3gcpwqkPguj83YcQLvuL4OJVgaTPqUYIEIzzNTFdHwXtW9++PKwL+evKms
 BqoxU+WR0JE2x1afU+/JzP4HJAjuM7bdOZ+n8jVSq5eF0StbiJnCXBV3EMCuNVLjfY
 Cbs7VK/vBuwDwz9Gd7WldzGZzXEOEQJSIkXP3v0kLRifd6QcIK8xP7tH7wsPs7ew3T
 g1a1zlEiCDrVxwymL5wm1wUAuVAf5rVTIyJnOxOWezvolUYIzPR5ShdylDQuKuSWcI
 itzLh1NiYVtPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UTEpKKXb
Subject: Re: [Buildroot] [PATCH v4 2/2] package/refpolicy/Config.in: depend
 on merged usr when selecting upstream
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
Cc: Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-10-09 19:25 +0200, Yann E. MORIN spake thusly:
> On 2023-10-09 19:04 +0200, Adam Duskett spake thusly:
> > Refpolicy contexts expect a merged /usr file system. In fact, there
> > are no references to /bin, /sbin, /lib, or /lib64 at all.
> There is a file in the refpolicy upstream tree, 

Bad copy-but-no-paste, so the file was: config/file_contexts.subs_dist

[--SNIP--]
> But maybe that no longer works? Or maybe we need to take action to make
> that work?

As discussed on IRC, that is indeed not an issue: refpolicy works even
without a merged /usr.

The issue stems from "dontaudit" rules that hid some other issue (if I
understood correctly).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
