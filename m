Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0D6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 09:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7636A40A60;
	Sun, 17 Jul 2022 09:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7636A40A60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iSfF17n1ugI; Sun, 17 Jul 2022 09:49:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFE324097E;
	Sun, 17 Jul 2022 09:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFE324097E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21B3A1BF5AD
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 09:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFF7284172
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 09:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFF7284172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2rpQLsNSACF for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 09:49:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB0E784162
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB0E784162
 for <buildroot@busybox.net>; Sun, 17 Jul 2022 09:49:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5432F78031A;
 Sun, 17 Jul 2022 11:49:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 11:49:28 +0200
Date: Sun, 17 Jul 2022 11:49:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220717094928.GA2107091@scaer>
References: <55f81de26c9b74283245f427bc7dd7ff4db09c06.1657777745.git.baruch@tkos.co.il>
 <20220717090719.GE2543@scaer> <87pmi4xfph.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pmi4xfph.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658051372;
 bh=Ke0X+K4oDk61aHvAkXt75/6sUE5DWpKlWaOHsehT/0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nWD3rF6oGrxCmCf/qfbg4m7WyMIylMuS8LQHKsOTKkBuYm9Qmpkqj3sFyx0PszIiL
 kXHaFjbmVemlMLmqBiKVuo6SIKOyc1mw4v4tnqd8hwRL+dGT7g91vhQBfIRKWE1fCl
 bHiEPcsp/L40dl8+NHIMn+pjgC/O662CheQ6eT71CbskRotpLRgRq0svzYAXeaYcye
 WcC+kegL3aA8OIn3iu/JmipoPp/E42DLCF4Oz5CiSZBrzLSddRILYrRCYbgN+vAn7v
 BpDA8NRsoGZSTyP+6+E8y2H4epBLHoW6quAs0/AudlfmuBQnhAMiTOiJW1yQ2+UYL+
 iFkYSZ7YEMgeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nWD3rF6o
Subject: Re: [Buildroot] [RFC PATCH v2] package/uacme: requires TLS support
 in libcurl
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
Cc: buildroot@busybox.net, Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2022-07-17 12:09 +0300, Baruch Siach spake thusly:
> On Sun, Jul 17 2022, Yann E. MORIN wrote:
> > On 2022-07-14 08:49 +0300, Baruch Siach via buildroot spake thusly:
> >> uacme configure script fails when libcurl does not support TLS. This
> >> means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme. But
> >> there is no way to change the choice to something other than
> >> BR2_PACKAGE_LIBCURL_TLS_NONE. So instead make uacme depend on libcurl
> >> and !BR2_PACKAGE_LIBCURL_TLS_NONE.
> >> 
> >> As a result we can no longer select BR2_PACKAGE_OPENSSL since it causes
> >> recursive dependency. Use 'depend on' instead, and add a comment to
> >> explain this uncommon choice.
[--SNIP--]
> >> --- a/package/uacme/Config.in
> >> +++ b/package/uacme/Config.in
> >> @@ -1,8 +1,9 @@
> >>  config BR2_PACKAGE_UACME
> >>  	bool "uacme"
> >>  	depends on BR2_USE_MMU # fork()
> >> -	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
> >> -	select BR2_PACKAGE_LIBCURL
> >> +	# We can not use select here as it causes recursive dependency
> >> +	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS
> >> +	depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE
> > I don't think this is correct. Indeed, even with one of those packages
> > enabled, there is nothing that prevents libcurl to be linked with
> > another TLS provider, as that is decided with the choice entries, not
> > with the packages being enabled.
> > Instead, what about:
> >     depends on BR2_PACKAGE_LIBCURL_OPENSSL \
> >             || BR2_PACKAGE_LIBCURL_GNUTLS \
> >             || BR2_PACKAGE_LIBCURL_MBEDTLS
> > That way, it encodes both the fact that libcurl is enabled, *and* that
> > is has the proper TLS support enabled.
> As Nicola explained on v1, uacme does not care which crypto back end
> libcurl uses, as long as there is one.
>   https://lore.kernel.org/all/Ys5vPCrxDXWvj+ok@einstein.dilieto.eu/
> Regardless of that, uacme requires one of these crypt back ends for its
> own use. So I think these dependencies are correct.

Doh... I somehow got it backwards...

Then you want to also hide away the first comment behind "depends on
BR2_USE_MMU" too.

[--SNIP--]
> > Also, comments about packages being not available should go either
> > before the main symbol, or after the conditional options. Otherwise, the
> > sub-options are not indented below the main symbol. With your code:
> >     [*] uacme
> >     [ ] enable ualpn
> > while we want:
> >     [*] uacme
> >     [ ]   enable ualpn
> > I'd have fixed that when applying, but I prefer to get some feedback
> > about my proposal on the dependendcy condition.
> I'll fix that if I send another iteration.

Thanks!

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
