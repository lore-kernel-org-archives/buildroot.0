Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31C9C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63C7440C66;
	Tue, 19 Jul 2022 15:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63C7440C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWWplXn1pKI7; Tue, 19 Jul 2022 15:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21BE040C67;
	Tue, 19 Jul 2022 15:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21BE040C67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 666771BF4D7
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4071160B14
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4071160B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e6xNFX2HQhU5 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:48:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CF5D60AF2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CF5D60AF2
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:48:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5d47:1bcb:9db:ce0f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AF2CB13F88A;
 Tue, 19 Jul 2022 17:48:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Jul 2022 17:48:30 +0200
Date: Tue, 19 Jul 2022 17:48:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220719154830.GK2249625@scaer>
References: <20220718203847.2646609-1-yann.morin.1998@free.fr>
 <87a695ydq0.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a695ydq0.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658245714;
 bh=Zq5CUAeEBvCXVdCl+JlUAWV0hxBdQxTNKiJHJhrUqzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p564AW2De8Ljsw20N9om7CHKG0jxSvqRZrXcAdpyZsZ3kN259/eRMIhS1kVQBoTvc
 /VYkk2yzXvfjDayIzH+1CK9wCKRWvTcpk/KBcfErFIEgf7JRAUwgK3QQbHtGvAVQfl
 M1rcTLhZcpKmD9QbNHluQBomJ5Itbe5DHfZdAq1dZd6NYtGVM6xPtQcNgIw0QI3nlF
 mEs0jsRlO4tkLpYgP53E/L9IBGBnwCKEzmtZ9pHAwfD4p/3AX0XQoKZqfccbmsyoZ7
 hWaHs9ZYZeJkaGQKiJx3hXBoVR2z5xJExKBJQAoJxm46Z3zSBKOw7APF4aKxlbkRje
 yXstgxPO7lK0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p564AW2D
Subject: Re: [Buildroot] [PATCHv5] package/uacme: requires TLS support in
 libcurl
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
Cc: buildroot@buildroot.org, Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2022-07-19 06:29 +0300, Baruch Siach via buildroot spake thusly:
> On Mon, Jul 18 2022, Yann E. MORIN wrote:
> > From: Baruch Siach <baruch@tkos.co.il>
> >
> > uacme configure script fails when libcurl does not support TLS. This
> > means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme.
> >
> > Add a kconfig knob to libcurl, BR2_PACKAGE_LIBCURL_FORCE_TLS, so that
> > _TLS_NONE is not an option. Select that from uacme.
> >
> > Note that, beside selecting BR2_PACKAGE_LIBCURL_FORCE_TLS, packages will
> > have to also select a package that can be used as a crypto backend by
> > libcurl. Use of BR2_PACKAGE_LIBCURL_FORCE_TLS is unlikely to become very
> > common in the foreseeable future, so we don't need to optimize for this
> > corner case.
> 
> This sentence is not clear without its original email discussion
> context. So I'd add in its end: "... with automatic selection of crypto
> backend".

Agreed, thanks! I'll tweak it that way before I apply and push, then.

> > uacme already needs a crypto package for itself, so the above
> > requirement is naturally met for uacme.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
> > http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
> > http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/
> >
> > Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > [yann.morin.1998@free.fr:
> >   - keep the current forward select
> >   - add the kconfig knob
> > ]
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> LGTM. Not this is the right tag since I'm technically the patch
> author. But FWIW here it is anyway.
> 
> Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Well, it is still correct to provide that tag: it means you acknowkedge
and validate the changes I made, so recording that in the commit log is
very important.

Thanks!

Regards,
Yann E. MORIN.

> Thanks,
> baruch
> 
> > ---
> > v5 (Yann E. MORIN):
> >   Rename knob to _FORCE_TLS (Baruch)
> >   _FORCE_TLS needs a crypto package to be selected (Baruch)
> >   Expand commit log to explain that (Baruch)
> >
> > v4 (Yann E. MORIN):
> >   Restore forward select
> >   Add the _FORCE_SSL_TLS kconfig knob; use it from uacme
> >
> > v3:
> >   Move comments up to fix suboption indentation (Yann)
> >   Add missing MMU comment dependency (Yann)
> >
> > v2:
> >   Add dependency on crypto back end for uacme itself (Nicola Di Lieto)
> > ---
> >  package/libcurl/Config.in | 7 +++++++
> >  package/uacme/Config.in   | 1 +
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> > index 3381decca8..bc2f8f47f2 100644
> > --- a/package/libcurl/Config.in
> > +++ b/package/libcurl/Config.in
> > @@ -45,6 +45,12 @@ config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
> >  	  - DICT
> >  	  - Gopher
> >  
> > +# Packages must select that if they require a SSL/TLS-enabled libcurl.
> > +# Those packages must also select one crypto package that can be used
> > +# as a backend below.
> > +config BR2_PACKAGE_LIBCURL_FORCE_TLS
> > +	bool
> > +
> >  choice
> >  	prompt "SSL/TLS library to use"
> >  
> > @@ -77,6 +83,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
> >  
> >  config BR2_PACKAGE_LIBCURL_TLS_NONE
> >  	bool "None"
> > +	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
> >  
> >  endchoice
> >  
> > diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> > index 58b7c534e7..796f54754e 100644
> > --- a/package/uacme/Config.in
> > +++ b/package/uacme/Config.in
> > @@ -3,6 +3,7 @@ config BR2_PACKAGE_UACME
> >  	depends on BR2_USE_MMU # fork()
> >  	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
> >  	select BR2_PACKAGE_LIBCURL
> > +	select BR2_PACKAGE_LIBCURL_FORCE_TLS
> >  	help
> >  	  uacme is a client for the ACMEv2 protocol described in
> >  	  RFC8555, written in plain C with minimal dependencies
> 
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
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
