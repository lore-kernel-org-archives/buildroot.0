Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D497ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 06:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EA0960BD4;
	Sun, 28 Aug 2022 06:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EA0960BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p0mfpInW2VQn; Sun, 28 Aug 2022 06:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B75C60B60;
	Sun, 28 Aug 2022 06:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B75C60B60
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0016C1BF2E4
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 06:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC2F860B60
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 06:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC2F860B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WR-7J7omQnRT for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 06:55:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 894D260B5D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 894D260B5D
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 06:55:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7B36478050A;
 Sun, 28 Aug 2022 08:55:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 08:55:15 +0200
Date: Sun, 28 Aug 2022 08:55:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220828065515.GE37358@scaer>
References: <20220828053710.76D3D4089E@smtp4.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828053710.76D3D4089E@smtp4.osuosl.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661669720;
 bh=pkoqI6PsSOYDOI/+PSaabI4famKSagH8J5G0eNwIn3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mhsEhrsYdE7mxn/JLTSU0415MI4e4dWhhf6IjkgjTR9PWa/qtJLB1jsGJJxIIXgec
 xG87WEz9LQKtSq4nXDzVF8DbvFmeRPSZNvvv4m+wsrV1KHjAZ8TBjid72bxn11bdn0
 /uxgIvZJVyDZaF9Sna6mmrLPLpnRcz2+D3i6g7WcxUQvYu5u9qEn4OxlGHh21LuaFk
 hdo211RTO60hM03UJX/JZXSWV5YSC+Ke7DR9SIPZaEBdMfWWedFE00yYsMp0ER7qvu
 lsbv9p6Ia/gVg+yGh3OigzGYxEiHBbRMDCBZ3TOau3HDQckmbunHKier98hGMvbTv/
 OJuZMSVRLJg9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mhsEhrsY
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-08-27
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

+Christian, +Joel: your inut may be needed below, please...

On 2022-08-28 05:37 -0000, Thomas Petazzoni via buildroot spake thusly:
> Classification of failures by reason for master
>                 wtfutil-0.41.0 | 1 
>    mips64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/2d7492483723197f20bb3ed4f057de97787c42e6 |     

This is a go vendoring issue, where go can't download one of the
vendored dependencies:

    go: downloading jaytaylor.com/html2text v0.0.0-20200412013138-3577fbdbcff7
    ...
        jaytaylor.com/html2text: unrecognized import path "jaytaylor.com/html2text": https fetch: Get "https://jaytaylor.com/html2text?go-get=1": dial tcp 50.250.226.91:443: i/o timeout

However, locally, the vendoring succeeds... :-/

Also I noticed that all such downlaod failures only ever occurs on
Thomas' runner...

Joel, Christian, this part is for you:

There area other actual build failures [0], but they all happen for
powerpc64le, and I have no idea how to fix those, though. I already
asked for help [1] but still no idea what's going on... :-/

There's [2] (package/go: Fix link failure on ppc64) but it does not look
to be addressing this error, and it no longer applies...

Can you help, please?

[0] http://autobuild.buildroot.net/results/c2c/c2ced76fbfa387a0a6e8ca8b295af553788658fa/
[1] https://lore.kernel.org/buildroot/20220604112132.GJ427639@scaer/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20220511114003.162006-2-joel@jms.id.au/

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
