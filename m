Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FF5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 10:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14CA86079E;
	Mon, 17 Jan 2022 10:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXRdNQYVXef3; Mon, 17 Jan 2022 10:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A241605BE;
	Mon, 17 Jan 2022 10:24:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D24981BF3D7
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 10:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE5E5605BE
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 10:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Chna-qaQoKtV for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 10:24:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E11906059B
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 10:24:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3413:1d36:355:a22c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DCB5E2003DA;
 Mon, 17 Jan 2022 11:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642415093;
 bh=1MfD1NufGm4QPShlIXMReFBUYde6nd6NF6e18xJa+vI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LqcVLKRk8WJIOpJ2onah6dU3BRoGITh3r3HEgoFMM6jUmy+Zbx1Pj5p3v/AG0Fla8
 EgixQUVmCSF5BsMJ7BoLAXS9Gz1KoJ6S8MarQfNRK97MhpqjAbMWuscUFu1IKbCprr
 ToxQIS2nxlpj4Ab8rXnuOIH4Bfk6pBY4Kd2wdDzjimFJ4SKqCYVI8NaHbUookTwZco
 IvIknJaY9kcfWtzgqlejTFK3AG3r/oVXFiS8IPcvcWx6RkKJxv3i901uKcG2EADlVE
 IIBigpXQZvX9M8xmZ63et1C2eYGRiJirb0tFKBi3S/6RPfqY6/duk4H0zdBmT7msBf
 zwxEhOk8K3RVg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Jan 2022 11:24:50 +0100
Date: Mon, 17 Jan 2022 11:24:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Danilo Bargen <mail@dbrgn.ch>
Message-ID: <20220117102450.GC2313964@scaer>
References: <20220117105017.28d6aacc@c3po>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117105017.28d6aacc@c3po>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] DMARC on this mailing list
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

Danilo, All,

On 2022-01-17 10:50 +0100, Danilo Bargen spake thusly:
> I recently enabled report-only DMARC on my e-mail domain. After sending
> a few e-mails to this ML yesterday, this resulted in multiple DMARC
> would-be rejection e-mails.

DMARC has bitten us in the recent past (1.5 year or so...)

> DMARC relies on SPF (correct sender IP) *or* DKIM (correct signature). A
> nice tool to visualize this is https://www.learndmarc.com/. If either
> SPF or DKIM passes, the e-mail should be accepted.
> 
> In the case of mailing lists, the way I understand it, there are two
> options:
> 
> - Rewrite the "From:" header so that the e-mail appears to be coming
>   from the ML itself. Put the original sender e-mail in the "Reply-To"
>   header instead. If this is not being done, the sender IP (the mailing
>   list) does not match the sender e-mail domain and SPF fails. Note
>   that this *might* impact the buildroot ML reputation for some big
>   mailservers.

This is exactly what is going on. You can check for example on the
archives:
    https://lore.kernel.org/buildroot/20220115101415.986123F41E@exit1-us.msgsafe.io/

> - Expect that mail servers with DMARC enabled also have DKIM enabled,
>   and ensure that the e-mail body is not modified (i.e. turn off the
>   automatically inserted footer). Put mailing list unsubscribe links
>   in the headers instead. This way, even though the sender IP does not
>   match, the signature should still be intact.
> 
> These approaches are described in the following blog post I found
> online: https://begriffs.com/posts/2018-09-18-dmarc-mailing-list.html
> 
> I don't know if mailman allows turning off body modifications (i.e.
> RFC2369 and RFC2919), but it definitely allows "From"-munging:
> https://wiki.list.org/DEV/DMARC

Yeah, this is what is being done on this list...

Regards,
Yann E. MORIN.

> I'm still quite new to this mailing list and don't want to put out any
> demands, but I wanted to bring up this issue, since it will probably be
> more and more of an issue in the future (DMARC adoption is increasing).
> 
> Cheers,
> Danilo
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
