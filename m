Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25876C433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 17:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5AB740301;
	Fri, 31 Dec 2021 17:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8-6QG7UD8Wm; Fri, 31 Dec 2021 17:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BF2F402D2;
	Fri, 31 Dec 2021 17:41:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AAC51BF399
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 17:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 659D240347
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 17:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLozYxLZM0pg for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 17:41:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FF6240120
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 17:41:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 96F375FFA1;
 Fri, 31 Dec 2021 18:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640972457;
 bh=+KuycbB2AC1hYyRkAXXC2sy18OZk0Rxk548UzIyFioQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X6RGn1abapFpU/U082HRifSaX6USfhum5mqLbohxN9RZuEnvnvlJXMwxslmLJjTDC
 pQrtmmlYtgI3cxGHomsE0D7hZ4ah5yJt5x8Tre5sa+st63dkSmaAxnex6NEKbGYtu9
 +ekIFbTJ8Nuo1zTjVQ+aeh3Y6hlyy2w5mfxen3mi0gafUNlINVUyMXxXTYH83hdeAa
 QWQ52dfG4o5/v5rME+OG/2VllDwvaLdzKkyILO0j1cAvlTPnp5Bwll8fL8zzUHXuUi
 BtbdBAShsDA6Cmir1eozGvg9KSUTSiotdI3FJ8wL0kANYZFmDXf93qbnf06uqTrPxo
 0EoyT8FuJ9lhw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 Dec 2021 18:40:53 +0100
Date: Fri, 31 Dec 2021 18:40:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211231174053.GM3390456@scaer>
References: <20211230224820.3080102-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230224820.3080102-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libtasn1: fix typo
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

Fabrice, All,

On 2021-12-30 23:48 +0100, Fabrice Fontaine spake thusly:
> Fix typo added by commit 30ac432b419599a8744238fdea65cf08c0765b63
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libtasn1/libtasn1.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
> index ecca00e79e..65b0868b79 100644
> --- a/package/libtasn1/libtasn1.mk
> +++ b/package/libtasn1/libtasn1.mk
> @@ -20,7 +20,7 @@ LIBTASN1_CONF_ENV = MAKEINFO="true"
>  
>  LIBTASN1_CONF_OPTS = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
>  
> -LIBTANS1_PROGS = asn1Coding asn1Decoding asn1Parser
> +LIBTASN1_PROGS = asn1Coding asn1Decoding asn1Parser

You forgot to also fix the variable expansion a few lines below...

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  # We only need the library
>  define LIBTASN1_REMOVE_PROGS
> -- 
> 2.33.0
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
