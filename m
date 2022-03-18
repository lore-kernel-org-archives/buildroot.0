Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4896CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 21:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31244091E;
	Fri, 18 Mar 2022 21:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7RJe08UOzFlF; Fri, 18 Mar 2022 21:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0F314050F;
	Fri, 18 Mar 2022 21:26:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DAAB1BF2CC
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18DC884826
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NlJgDEA4HKBm for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:25:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B76468481F
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:25:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3ED0513F846;
 Fri, 18 Mar 2022 22:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647638756;
 bh=7v9HIf8UNckSQKwvR8nwn1nq9GVlR3ub0SfqnxbQXAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eLn2YEaFKYkrCkX0IlF3WxkoVjAxI1Xw9KGsNEz+gNaB0NyEB3Pc0CT0xYETRNy3x
 KIhM0V50s5EF1vq4plfSfEIzcz2ws1EH9zJ9LIbr2UTIjbRshQq9IMDdVVwzXQKnhs
 0GZojC0PKsQIiaF9gbsNVDXAo5xTnRPIODdu58n3HSmbQ5QutFTDtB01NoiR3mGsoH
 GFHzn/uQJYD7xHeYeObTcub2McYNMO5bOk03S/vltnuPxpPgOi7pSy3KIDS6hk65F7
 58nVA/8hdDcumyMSxwqLF6gToFm6mu1tLQH3cMxcxzh0lvfi4NE79Cj1IOBj6mR01s
 76fcDWSUrWVrw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 22:25:53 +0100
Date: Fri, 18 Mar 2022 22:25:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220318212553.GI283544@scaer>
References: <20220318202044.10413-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318202044.10413-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/5] package/wget: explicit set some
 default options
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

Peter, All,

On 2022-03-18 21:20 +0100, Peter Seiderer spake thusly:
> - explicit set some default options (--without-metalink, --enable-opie,
>   --enable-digest, --enable-ntlm, --disable-debug, --disable-valgrind-tests,
>   --disable-assert)

Repeating the title and the code in the commit message is not very
helpful.

What would be more intertesting, is to explain why you did need to set
those options, and just those, among all the others that are available,
like attr, iri... (I think that is basically what Thomas asked for in
his review of your v1).

I see that your series will also introduces some optional support
(libpsl, c-ares), but if just this first patch is applied, then that
also leaves those options unset, so this first patch should really add
defaults to all options.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - split out from original patch
> ---
>  package/wget/wget.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index f30fa39917..d100a59eae 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -12,6 +12,15 @@ WGET_LICENSE = GPL-3.0+
>  WGET_LICENSE_FILES = COPYING
>  WGET_CPE_ID_VENDOR = gnu
>  
> +WGET_CONF_OPTS = \
> +	--without-metalink \
> +	--enable-opie \
> +	--enable-digest \
> +	--enable-ntlm \
> +	--disable-debug \
> +	--disable-valgrind-tests \
> +	--disable-assert
> +
>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  WGET_CONF_OPTS += --with-ssl=gnutls
>  WGET_DEPENDENCIES += gnutls
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
