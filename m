Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAE2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 04:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE2C83281;
	Mon, 18 Jul 2022 04:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE2C83281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWMBaLaf_Oqp; Mon, 18 Jul 2022 04:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01BD83404;
	Mon, 18 Jul 2022 04:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01BD83404
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 525661BF3A3
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 04:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A56141525
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 04:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A56141525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QiTL6qA6lFzF for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 04:14:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3B9C41522
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3B9C41522
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 04:14:05 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 8F1DA44044D;
 Mon, 18 Jul 2022 07:13:38 +0300 (IDT)
References: <20220717193719.2429999-1-yann.morin.1998@free.fr>
 <87lesry0vz.fsf@tarshish> <20220717201831.GY2249625@scaer>
User-agent: mu4e 1.8.5; emacs 27.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 18 Jul 2022 06:38:54 +0300
In-reply-to: <20220717201831.GY2249625@scaer>
Message-ID: <87edyjxdkm.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658117618;
 bh=RQOs7UhPtZHOaWck+EtqZBukwaQgqP4PTDJqIJHEuuQ=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=bq2JGY1jgJUmbtq+jXjc8re9JLo6A5BDTRhmkrDraxs+GC/WFP6uDHBdkBXin4Zss
 s7uJhodw6WCanGJ2krr1PiMTabJ31e/ZV9YtQ64zpnrwgWce5Mg2EYwLQFW0H2O/t/
 zzdcqw5XrNIKO0ATXRQC9RqSaPo0pgNeiOVE8ZXifYBPCHhtSofl1RV47+bk+FyPvE
 TNf8d8kgEYkhWbLSscZuJtV9FN64w5HJRFV9+UqucIP/3/EHIQnKsEXUKUNBMOk9aq
 8wM0Dki9McXdFpzl9JI/j2Z++rZJApD7eIHTsgs928YAgL3bgkGCjrqF//oEm99lbp
 0gXvLXcHie+Cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=bq2JGY1j
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org, Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Sun, Jul 17 2022, Yann E. MORIN wrote:
> On 2022-07-17 22:41 +0300, Baruch Siach via buildroot spake thusly:
>> On Sun, Jul 17 2022, Yann E. MORIN wrote:
>> > From: Baruch Siach <baruch@tkos.co.il>
>> >
>> > uacme configure script fails when libcurl does not support TLS. This
>> > means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme.
>> >
>> > Add a kconfig knob to libcurl so that no_TLS is not an option. Select
>> > that from uacme.
>> Looks much more elegant. Thanks.
>
> Cool! If you prefer my patch, I'll let you mark yours as superseded in
> patchwork, then. Otherwise, I'll let another maintainer pick their
> preferred one. :-)
>
> [--SNIP--]
>> > +# Packages must select that if they require a SSL/TLS-enabled libcurl
>> Said package must also select one of the crypto back ends that libcurl
>> supports.
>
> Absolutely valid point.
>
>> This part is somewhat fragile as libcurl might remove support
>> for any given back end like it recently did for NSS.
>
> I guess openssl will always be a safe default, as it has no architecture
> dependency. However, that would need further change in libcurl, such as:
>
>     @@ -47,10 +47,11 @@ config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
>
>      choice
>             prompt "SSL/TLS library to use"
>     +       default BR2_PACKAGE_LIBCURL_TLS_NONE
>
>      config BR2_PACKAGE_LIBCURL_OPENSSL
>             bool "OpenSSL"
>     -       depends on BR2_PACKAGE_OPENSSL
>     +       select BR2_PACKAGE_OPENSSL
>             select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>
>      config BR2_PACKAGE_LIBCURL_BEARSSL
>
> which changes the way we handle crypto backends...

Maybe, if we go down this path of 'depends -> select' for all other
libcurl crypto backends, we can solve the original uacme problem with a
simple !BR2_PACKAGE_LIBCURL_TLS_NONE dependency without recursion. Is
that correct?

But I'm not sure what can of recursion worms that would open.

I only meant to say that the comment above should mention that the
package must select a crypto backend. uacme is a special case and it
already selects a crypto backend.  BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS use
is unlikely to become very common in the foreseeable future. So I don't
think we need to optimize of this corner case.

> Maybe just not default the choice to BR2_PACKAGE_LIBCURL_TLS_NONE...
> After all, we want to promote best practices, and enabled TLS in libcurl
> is better than not enabling it... Meh...

I think this is too heavy handed. TLS takes much more than a crypto
backend after all. It should be an explicit user choice. And if we do
default to crypto enabled, then a more lightweight option is probably
better.

>
> Not sure what's the best, and it is starting to become more complex than
> my quickly whipped-up patch...
>
>> > +config BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
>> [Bikeshed] Why not just BR2_PACKAGE_LIBCURL_FORCE_TLS ?
>
> The prompt of the choice is "SSL/TLS library to use" so I reflected that
> in the symbol name, although I do agree that SSL is something we should
> definitely forget about! :-)
>
> If you feel so-inclined, you can grab this patch and adapt it to ensure
> a crypto backend is always enabled. Otherwise, I'll try to see what I
> can o a bit later...

I'm fine with the patch as is.

baruch

> Thanks for the quick feedback! :-)
>
> Regards,
> Yann E. MORIN.
>
>> baruch
>> 
>> > +	bool
>> > +
>> >  choice
>> >  	prompt "SSL/TLS library to use"
>> >  
>> > @@ -77,6 +81,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
>> >  
>> >  config BR2_PACKAGE_LIBCURL_TLS_NONE
>> >  	bool "None"
>> > +	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
>> >  
>> >  endchoice
>> >  
>> > diff --git a/package/uacme/Config.in b/package/uacme/Config.in
>> > index 58b7c534e7..1458e74d28 100644
>> > --- a/package/uacme/Config.in
>> > +++ b/package/uacme/Config.in
>> > @@ -3,6 +3,7 @@ config BR2_PACKAGE_UACME
>> >  	depends on BR2_USE_MMU # fork()
>> >  	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
>> >  	select BR2_PACKAGE_LIBCURL
>> > +	select BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
>> >  	help
>> >  	  uacme is a client for the ACMEv2 protocol described in
>> >  	  RFC8555, written in plain C with minimal dependencies

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
