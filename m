Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2932CC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 16:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC116819F6;
	Mon,  1 Aug 2022 16:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC116819F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CGpD1KQV0ep; Mon,  1 Aug 2022 16:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA1E681980;
	Mon,  1 Aug 2022 16:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA1E681980
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A42311BF315
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F42E60644
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F42E60644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lSMcmE8q50Uv for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 16:10:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B694600D1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B694600D1
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 16:10:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a573:58bd:e1d1:c541])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2B51719F74C;
 Mon,  1 Aug 2022 18:10:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Aug 2022 18:10:02 +0200
Date: Mon, 1 Aug 2022 18:10:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Message-ID: <20220801161002.GD3168@scaer>
References: <20220801133041.2150607-1-foss+buildroot@0leil.net>
 <20220801151208.GA3168@scaer>
 <eb16effd-22af-9004-ef2c-f330f351c5b6@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb16effd-22af-9004-ef2c-f330f351c5b6@theobroma-systems.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659370206;
 bh=SGeEccFQWX+RxXcn9KrGOYXdKMu9lSIivCHNuUsjDkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LrpAc/uM+aYx8q+Gyg5SmdKmkAXW6U6p26y3FrFQEWAjLK+jiBGEQD2muuEEMqfVc
 Kt2ryfFZN0xDVZozZNFLpwhcggvVlMfmcZLGOs7U4KxoSvX+CojsfGlUxnOuargRyp
 da/A5HL1T4gzwLJBPvyL4v0FEpHIsJnhVdtuzOH11ve9+qDmLDxSZ7Z752STKRKygL
 iZoL+WsjrnCYNgjcFfc9Mjlpp+y+nkJG4GTlMBPFYPPjU66CJxg/WNLcYlFzBnx5jV
 nMj7BHALctVb7uG7OojcuDTVuh3IXbzBqSHvVl+2+aoKhsbujmNIdbdlchjLYUVs+n
 9OBeLUKHpAz9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LrpAc/uM
Subject: Re: [Buildroot] [PATCH] Makefile: make printvars target print all
 variables if no VARS set
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-08-01 17:15 +0200, Quentin Schulz spake thusly:
> On 8/1/22 17:12, Yann E. MORIN wrote:
> >On 2022-08-01 15:30 +0200, Quentin Schulz spake thusly:
> >>From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> >>VARS is not defined by default, meaning the filter will not return
> >>anything which ends up making `make printvars` also return nothing.
> >In fact, this is the expected behaviour, see fd5bd12379dc (Makefile:
> >printvars: don't print anything when VARS is not set).
> I should have made some research first it seems like :) Maybe we could print
> some error message if VARS is not set? In any case, unrelated to this patch.

Yeah, maybe... If you can come up with something that is not too ugly...
And don't forget to update the manual while at it. ;-]

> Sorry for the noise.

n.p.

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
