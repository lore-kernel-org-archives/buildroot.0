Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B586C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 19:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6E5240A8F;
	Sun, 17 Jul 2022 19:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6E5240A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFc-nnqNw7gv; Sun, 17 Jul 2022 19:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F8B340297;
	Sun, 17 Jul 2022 19:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F8B340297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 888381BF255
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 19:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D23883E86
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 19:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D23883E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3jukHPaYaYu0 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 19:40:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E62F383E84
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E62F383E84
 for <buildroot@busybox.net>; Sun, 17 Jul 2022 19:40:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6518:6457:938c:3f55])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4707D13F8AE;
 Sun, 17 Jul 2022 21:40:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 21:40:49 +0200
Date: Sun, 17 Jul 2022 21:40:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220717194049.GW2249625@scaer>
References: <a18cb02f314d0b8d69c7de564970028d2c671d71.1658085348.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a18cb02f314d0b8d69c7de564970028d2c671d71.1658085348.git.baruch@tkos.co.il>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658086853;
 bh=I4lUB/PQMhX1WPlzkCcIOFfWS5PeUevnCtn1fVlgKBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R4TKN6/8ppBrK9i3zi+P5kHNNF7Hj/CW+J2JLboSM9h3Hmno90ijrYwboYMDMbKtg
 /pMbMAnOKFXau0Kx7pT1bN7mHR8BHc1E8ucDXMKd8EvNBoI/r6RAWqWA8VoJzNlECK
 1P/6NFK1jT8XtgTBpwwivF/VfG+UcBPEzAaxFNo1a+svoiPocdSPFdIrE5AulH/haQ
 lIIjqokPsN5dUEQhltb2F8ievDGGZtcBJXhQ76G2CCfTtSFtmMoPEyADZVSZDvdVPG
 cbefrEmV+OWed4jUrQaSVa8KeJK9KSo9+aeG3ye2/R22RBYu7Z/Ub/FozNwWCBeV7K
 B9V2nBSWy09Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R4TKN6/8
Subject: Re: [Buildroot] [PATCH v3] package/uacme: requires TLS support in
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
Cc: buildroot@busybox.net, Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, Nicola, All,

On 2022-07-17 22:15 +0300, Baruch Siach via buildroot spake thusly:
> uacme configure script fails when libcurl does not support TLS. This
> means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme. But
> there is no way to change the choice to something other than
> BR2_PACKAGE_LIBCURL_TLS_NONE. So instead make uacme depend on libcurl
> and !BR2_PACKAGE_LIBCURL_TLS_NONE.
> 
> As a result we can no longer select BR2_PACKAGE_OPENSSL since it causes
> recursive dependency. Use 'depend on' instead, and add a comment to
> explain this uncommon choice.
> 
> Fixes:
> http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
> http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
> http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/
> 
> Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

OK, I was about to apply that one, and I got curious about the circular
dependency you mention. I did not investigate, but I could pretty easily
see the problem.

So II wondered if we could keep the current situation, and just ensure
that libcrul was never goign to be built without SSL/TSL. So I did a
hack:
    https://patchwork.ozlabs.org/project/buildroot/patch/20220717193719.2429999-1-yann.morin.1998@free.fr/

Not sure which is better, but we do certainly already have some "force
this" options, like BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL, so this would
not be a first.

Thoughts?

Regards,
Yann E. MORIN.

> ---
> v3:
>   Move comments up to fix suboption indentation (Yann)
> 
>   Add missing MMU comment dependency (Yann)
> 
> v2:
>   Add dependency on crypto back end for uacme itself (Nicola Di Lieto)
> ---
>  package/uacme/Config.in | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> index 58b7c534e73d..e27d41160716 100644
> --- a/package/uacme/Config.in
> +++ b/package/uacme/Config.in
> @@ -1,8 +1,17 @@
> +comment "uacme needs one of openssl, gnutls or mbedtls"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_GNUTLS && !BR2_PACKAGE_MBEDTLS
> +
> +comment "uacme needs libcurl with TLS support"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_PACKAGE_LIBCURL || BR2_PACKAGE_LIBCURL_TLS_NONE
> +
>  config BR2_PACKAGE_UACME
>  	bool "uacme"
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
> -	select BR2_PACKAGE_LIBCURL
> +	# We can not use select here as it causes recursive dependency
> +	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS
> +	depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE
>  	help
>  	  uacme is a client for the ACMEv2 protocol described in
>  	  RFC8555, written in plain C with minimal dependencies
> -- 
> 2.35.1
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
