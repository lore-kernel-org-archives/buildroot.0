Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68692C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 20:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9A1260BEB;
	Sun, 17 Jul 2022 20:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A1260BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id noqF4XVqfZKT; Sun, 17 Jul 2022 20:18:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBE0760B1A;
	Sun, 17 Jul 2022 20:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBE0760B1A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2625F1BF35C
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 20:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0056E40164
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 20:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0056E40164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUIyS4ta_pQ8 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 20:18:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1AA040002
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1AA040002
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 20:18:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6518:6457:938c:3f55])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DA1AB13F88A;
 Sun, 17 Jul 2022 22:18:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 22:18:31 +0200
Date: Sun, 17 Jul 2022 22:18:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220717201831.GY2249625@scaer>
References: <20220717193719.2429999-1-yann.morin.1998@free.fr>
 <87lesry0vz.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lesry0vz.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658089115;
 bh=kah9DBy6oKbwirqI/Dsru3CuL23jNukXw8EFMykaDRY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lgHyCekrdAe3oz6iytEwIduGqggdF+S6ux18v5Efl58o9t9DzFDRTQJ19SjukTHfP
 o+X4rNW1r4jIrfts8rTrrsP2S6B+oj+eOCjDTOzfl9HB+US45wUbnnlwx3hmSNoBdW
 CfS5Qqi0Gr12B8VWgAnQsBWJm+izO+zmW05QxioGlcEySDRNsqbGUNM0wMRoLkaNWW
 glBm1McUYIAWObsmyoh7wmikJ+hs6Ux4A3tQvyyjiXaCAgGETSESUjPzPot1awW5FH
 kU2dP+hL7NXsNMYk1ULVkEmVTreE+TmfN3RtNDbX0g/fKzsHkrmxqsHvBk7BSB4dM+
 ILYbFJRkVVPxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lgHyCekr
Subject: Re: [Buildroot] [PATCHv4] package/uacme: requires TLS support in
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

On 2022-07-17 22:41 +0300, Baruch Siach via buildroot spake thusly:
> On Sun, Jul 17 2022, Yann E. MORIN wrote:
> > From: Baruch Siach <baruch@tkos.co.il>
> >
> > uacme configure script fails when libcurl does not support TLS. This
> > means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme.
> >
> > Add a kconfig knob to libcurl so that no_TLS is not an option. Select
> > that from uacme.
> Looks much more elegant. Thanks.

Cool! If you prefer my patch, I'll let you mark yours as superseded in
patchwork, then. Otherwise, I'll let another maintainer pick their
preferred one. :-)

[--SNIP--]
> > +# Packages must select that if they require a SSL/TLS-enabled libcurl
> Said package must also select one of the crypto back ends that libcurl
> supports.

Absolutely valid point.

> This part is somewhat fragile as libcurl might remove support
> for any given back end like it recently did for NSS.

I guess openssl will always be a safe default, as it has no architecture
dependency. However, that would need further change in libcurl, such as:

    @@ -47,10 +47,11 @@ config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES

     choice
            prompt "SSL/TLS library to use"
    +       default BR2_PACKAGE_LIBCURL_TLS_NONE

     config BR2_PACKAGE_LIBCURL_OPENSSL
            bool "OpenSSL"
    -       depends on BR2_PACKAGE_OPENSSL
    +       select BR2_PACKAGE_OPENSSL
            select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL

     config BR2_PACKAGE_LIBCURL_BEARSSL

which changes the way we handle crypto backends...

Maybe just not default the choice to BR2_PACKAGE_LIBCURL_TLS_NONE...
After all, we want to promote best practices, and enabled TLS in libcurl
is better than not enabling it... Meh...

Not sure what's the best, and it is starting to become more complex than
my quickly whipped-up patch...

> > +config BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
> [Bikeshed] Why not just BR2_PACKAGE_LIBCURL_FORCE_TLS ?

The prompt of the choice is "SSL/TLS library to use" so I reflected that
in the symbol name, although I do agree that SSL is something we should
definitely forget about! :-)

If you feel so-inclined, you can grab this patch and adapt it to ensure
a crypto backend is always enabled. Otherwise, I'll try to see what I
can o a bit later...

Thanks for the quick feedback! :-)

Regards,
Yann E. MORIN.

> baruch
> 
> > +	bool
> > +
> >  choice
> >  	prompt "SSL/TLS library to use"
> >  
> > @@ -77,6 +81,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
> >  
> >  config BR2_PACKAGE_LIBCURL_TLS_NONE
> >  	bool "None"
> > +	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
> >  
> >  endchoice
> >  
> > diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> > index 58b7c534e7..1458e74d28 100644
> > --- a/package/uacme/Config.in
> > +++ b/package/uacme/Config.in
> > @@ -3,6 +3,7 @@ config BR2_PACKAGE_UACME
> >  	depends on BR2_USE_MMU # fork()
> >  	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
> >  	select BR2_PACKAGE_LIBCURL
> > +	select BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
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
