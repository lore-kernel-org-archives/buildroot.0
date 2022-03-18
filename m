Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82610C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 21:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EECFC40475;
	Fri, 18 Mar 2022 21:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKrmrkOJUBE6; Fri, 18 Mar 2022 21:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C740B40235;
	Fri, 18 Mar 2022 21:34:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69FDF1BF2CC
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 665FA60B1F
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2A5MPXtYQ1UJ for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:34:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EE8E605B5
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:34:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 685F913F87E;
 Fri, 18 Mar 2022 22:34:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647639262;
 bh=gxt8qO2LbEikARpWmDZf/CZ5KIImtHH4wHr6ZqKsScM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TM7FvgMwlBiHorLa5rKFfn9A2qim/ONvvLlEAVRxYSzFoWnxZjeyyGybbABk7PMrO
 7xEBM5um6Pub+7zbeSecW+WXq1s0m5qATo+WdA9JsX4yc6SQMJUfKrzLs5S/SLkbRL
 oqgeOe3C41N7a3cw6bFFOH+Ao9dcNu6ANWKEimormdWf9ArWWZ2bN9vswjjuCs/71s
 hIfB+mLE+04F0RFUB9Lliriox67jrvDB7g63CL1TINQgcCa/kkUj58FqFMPAf9pfsJ
 txV0/zyMC7LmdwXPJ0KmNdzqY3Ef2CvLCfRKxOf64vRUtG1MKKQMh5UiZUYwiGxJBt
 WoyC9UMJE8GSw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 22:34:20 +0100
Date: Fri, 18 Mar 2022 22:34:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220318213420.GL283544@scaer>
References: <20220318202044.10413-1-ps.report@gmx.net>
 <20220318202044.10413-3-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318202044.10413-3-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 3/5] package/wget: add optional libpsl
 dependency
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

On 2022-03-18 21:20 +0100, Peter Seiderer spake thusly:
> - add optional libpsl dependency
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, commit elided, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - split out from original patch
> ---
>  package/wget/wget.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index 7fda36f1f5..d0556e323c 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -21,6 +21,13 @@ WGET_CONF_OPTS = \
>  	--disable-valgrind-tests \
>  	--disable-assert
>  
> +ifeq ($(BR2_PACKAGE_LIBPSL),y)
> +WGET_CONF_OPTS += --with-libpsl
> +WGET_DEPENDENCIES += libpsl
> +else
> +WGET_CONF_OPTS += --without-libpsl
> +endif
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
