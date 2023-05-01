Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630A9C77B7C
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 19:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ACBB8002A;
	Mon,  1 May 2023 19:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ACBB8002A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7T8cCPnDCA7; Mon,  1 May 2023 19:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31F57813E9;
	Mon,  1 May 2023 19:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31F57813E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CFEC1BF4E7
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5033F8002A
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 19:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5033F8002A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TP71fKTbTbwY for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 19:35:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6B4D80B73
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6B4D80B73
 for <buildroot@buildroot.org>; Mon,  1 May 2023 19:35:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:8906:ae70:691:1fda])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id F358619F744;
 Mon,  1 May 2023 21:35:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 May 2023 21:35:32 +0200
Date: Mon, 1 May 2023 21:35:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tom Wambold <tom5760@gmail.com>
Message-ID: <20230501193532.GB2696@scaer>
References: <20230426163910.28943-1-tom5760@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426163910.28943-1-tom5760@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682969735;
 bh=Tn++WgNvmw796nE988fUD/oOF3dK6xOdpkkvFJRLpDo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c9IKFGgJJhLVZmLekP6D2F6tFepr3FhVAnDR1nA8hyUhSnG6KQ7eGsD97pzaldoiT
 ut8cN6RQcHeYpdH6sN+aUs9HkPAIFtow8F900ENNTxktwuwig9C1W4+tAVALsw3cZ0
 GLMmsJftNE66G+H/q93+TKYzvK2KSVZ/H1FqIrgCZG6G+OM98B/fs6AhPGzxoBntqh
 O2lcTvG/iyc5AakUsIYeh+cASP11HJ81+wE7k0YR2Qv+dd6sKi0rXJ8j1xxP2z92df
 qg3tF+mN1768y8QI6bb3uJaSabL9WcolsGg7XkF1cDrwKRsc5nypcknt2RNfYWgo3L
 jgXdbei+dZ8uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c9IKFGgJ
Subject: Re: [Buildroot] [PATCH] package/libcurl: remove OpenSSL
 LD_LIBRARY_PATH override
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

Tom, All,

On 2023-04-26 12:39 -0400, Tom Wambold spake thusly:
> I believe this is no longer necessary since commit 2d4c215 [0] in curl
> (released in curl 7.60.0). This appears to cause problems when building
> on Arch Linux at least, as noted in bug 15181 [1].  Just removing this
> entirely resolves this.
> 
> This effectively reverts a51ce319492 and 71b1d397266.
> 
> [0]: https://github.com/curl/curl/commit/2d4c2152c9eb3dbdf943de46ed8fc11285f1b90b
> [1]: https://bugs.buildroot.org/show_bug.cgi?id=15181
> 
> Signed-off-by: Tom Wambold <tom5760@gmail.com>

Thanks for this patch. James sent the same a few days before you, and
basically both commit logs were roughly equivalent. So I applied James'
patch instead of yours.

Regards,
Yann E. MORIN.

> ---
>  package/libcurl/libcurl.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 1a1594a45e..dd715c1bb6 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -56,11 +56,6 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
>  LIBCURL_DEPENDENCIES += openssl
> -# configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
> -# native stuff during the rest of configure when target == host.
> -# Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
> -# are found first.
> -LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
>  LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
>  	--with-ca-path=/etc/ssl/certs
>  else
> -- 
> 2.40.1
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
