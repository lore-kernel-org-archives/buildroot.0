Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D55C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 10 Sep 2022 12:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 136A88427A;
	Sat, 10 Sep 2022 12:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 136A88427A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jeT5DoZj7tfq; Sat, 10 Sep 2022 12:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2441A8305A;
	Sat, 10 Sep 2022 12:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2441A8305A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E59611BF2BE
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 12:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF16D8305A
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 12:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF16D8305A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtmk3rubLDR2 for <buildroot@lists.busybox.net>;
 Sat, 10 Sep 2022 12:35:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A8FA82FE7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A8FA82FE7
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 12:35:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d2dc:af53:61e0:beab])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D411919F5B4;
 Sat, 10 Sep 2022 14:35:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Sep 2022 14:35:38 +0200
Date: Sat, 10 Sep 2022 14:35:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220910123538.GJ1585594@scaer>
References: <20220222102211.74573-1-nolange79@gmail.com>
 <20220222102211.74573-3-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222102211.74573-3-nolange79@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662813343;
 bh=NEvZPgHs+Yj7s9b4HsoTGAkb7FFyQvUBXfQ4UM8pJhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lxOWH9nyytOzshTxliDfYI4E8bD+s37oJ9YBlwKyuxJEiQu0D5xD4eEfETezit6lu
 Kn4IXw+OLlqCl4XREI6zbcyTAcJ15YqaTKoi8AJEWf2yNeWMT2CGtuVrwmELIbqKhq
 p0XDb+7TkCP4Y/30KVIcWWWUovdrtl+d9yJnnqOdCAVDt86LVuTuY3NT3cR4Z4ZCXY
 RBq6pXSq8UwsAdu8ii0zh+7O5ifBl2Y/GT+p8m80VaFySEBoPGaoCmibsmnJHn2T19
 cGO2PcrcennlCZSq3iXFrAqTPuYgH7SALE/9jEjjQRgk5GnPBT/nMieZ9NJUJSStKF
 gNgS/wf+Whs8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lxOWH9ny
Subject: Re: [Buildroot] [PATCH v3 2/7] pkg-autotools: optimistically set
 runstatedir
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2022-02-22 11:22 +0100, Norbert Lange spake thusly:
> since Autotools 2.70 there is an option to set the
> runstatedir. To support configure scripts using older version,
> the variable is set directly instead of using the --runstatedir
> argument.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/pkg-autotools.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 717ff81593..b6224b349d 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -187,6 +187,7 @@ define $(2)_CONFIGURE_CMDS
>  		--exec-prefix=/usr \
>  		--sysconfdir=/etc \
>  		--localstatedir=/var \
> +		runstatedir=/run \

We have unfortunately had to revert this change as well as all the
various hacke we tried to fix it, for various reasons (list below
serving as a memo for the futur):

 1. --runstatedir only appeared in autotools 2.69b, and we still have
    packages that were autoconf-ed with previous versions, and thus
    do not support the option;

So we tried with passing it as a variable assignment, but...

 2. passing runstatedir=/path as a variable assignment on the command
    line actually breaks packages with very old autotools versions, like
    2.13, which get confused as they believe this is specifying the
    host;

So we got back to an option, but only if we could grep it in the
configure script; yet...

 3. packages that do recognise --runstatedir in their top-level
    configure script, may still break with configure scripts in
    sub-directories, written with older autoconf vrsions, so back to
    square one.

Given that we are nearing the release, given that FHS 3.15 does
acknowledge that /var/run can continue to exist for backward
compatibility, and that it suggests individual programs (not whole
systems!) to only use one or the other, we should just continue to
support /var/run (if at least for binary-only cruft that may still be
lying around and need /var/run anyway).

As a consequence, not having a generic solution to pass --runstatedir
(or an equivalent) is not a blocker, and is not a regression either.

Sure, having it would be better, but we can't make it work reasonably
well for now.

So, here is a brain-dmup of some thoughts about that (stil just thinking
about autotools here):

  - packages that actually want to access runstatedir will have a way to
    specify it, be it the option or the variable assignment, or even
    something else;

  - packages that have neither the option nor the variable, would most
    probably not need to access runstatedir at all.

As a consequence, what are the odds that a package needs runstatedir?
Are they legion, or are they few? If they are relatively few, then we
can just add the applicable solution (option or variable) on a
per-package basis.

And I think this is most probably the simplest and most efficient
solution, as we can't have a generic one.

Unless we can come with a much clever solution...

Speaking of cleverness: Peter suggested checking for --runstatedir
recursively in all configure scripts, and only pass it if they all
suport it.

However, I think this might be incorrect: the top-level configure script
could support it, and the package needs it, but sub-configures may not
support it (or there is a file named configure in a sub-dir, which is
not an actual configure script (or is not needed), in which case we
would miss the opportunity for the generic solution, and we'd be back on
a per-package _CONF_OPTS...

So, I'm still thinking the per-package _CONF_OPTS is way better
overall...

Untill we can get a better solution, or all upstream packages have been
fixed and bumped in Buildroot... :-]

Thanks for the initial patch! We tried, it did not work, we reverted.

Regards,
Yann E. MORIN.

>  		--program-prefix="" \
>  		--disable-gtk-doc \
>  		--disable-gtk-doc-html \
> -- 
> 2.34.1
> 
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
