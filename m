Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904A8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 492E5416A9;
	Thu, 12 May 2022 20:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RVc_D_oqR2P; Thu, 12 May 2022 20:53:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02DA7410AF;
	Thu, 12 May 2022 20:53:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 157271BF3A4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04AB482A0E
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mG9KvlnEkRjt for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:53:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D1E5829B6
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 73B3F19F576;
 Thu, 12 May 2022 22:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652388828;
 bh=9b/jH4LLPO2kX62gk7XpEUecBRjyVCBVSv/0hed+AqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GoSVBm2gPqUF/kHFskh4nWXVy8eotsXXHa1ZWYsgdfSG1PFFyC++f/mrwOEA7pRom
 YgPkATi2jnpviSVzExavKeFxJJs9aRQPCT+A5mhbiqtrnm+QHpX/hXJfawhP8fopnB
 XXLhVuxq6iSoTizZL6/JmNsYZHnQd5B5lr0S8TAbZpyhFtI+FYLh9lMW2zTDnDoBIQ
 GOAN0Aoeo/C0ElVTVF8//3wo8QdXA7BmslH1iq2rMea/L2RelutS9YqAqZh3SU5m+c
 tmgQCVJK3oAUFnf0sCit9LuaUB0dBfqDUxJ+x3rPOiPBrl+sCwLOGye0aD8o4gx/kF
 CEk0Ytv+U9Sgw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 22:53:45 +0200
Date: Thu, 12 May 2022 22:53:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220512205345.GL1597494@scaer>
References: <20220512160116.2011627-1-arnout@mind.be>
 <20220512160116.2011627-3-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512160116.2011627-3-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/5] package/gnutls: remove redundant
 --enable-openssl-compatibility
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-05-12 18:01 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The option is set a few lines below depending on
> BR2_PACKAGE_GNUTLS_OPENSSL.

I've moved all the openssl compatibility stuff under a single
conditional block.

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gnutls/gnutls.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 79e7d529b1..1d997781b0 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -25,7 +25,6 @@ GNUTLS_CONF_OPTS = \
>  	--disable-libdane \
>  	--disable-rpath \
>  	--disable-tests \
> -	--enable-openssl-compatibility \
>  	--without-libcrypto-prefix \
>  	--without-libdl-prefix \
>  	--without-libev-prefix \
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
