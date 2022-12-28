Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8257C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E26B815AD;
	Wed, 28 Dec 2022 19:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E26B815AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9z9fdhK3wpJG; Wed, 28 Dec 2022 19:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C29B381583;
	Wed, 28 Dec 2022 19:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C29B381583
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9F381BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B44EA404DA
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B44EA404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TpsXGZWbLev4 for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:52:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D048840002
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D048840002
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:52:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:58a9:4a7:c920:8cca])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2999F2003DA;
 Wed, 28 Dec 2022 20:52:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 28 Dec 2022 20:52:44 +0100
Date: Wed, 28 Dec 2022 20:52:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20221228195244.GG2498764@scaer>
References: <20221217153729.545952-1-romain.naour@gmail.com>
 <20221217153729.545952-3-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221217153729.545952-3-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672257169;
 bh=9skRNnSKDB9XYY4w3a+tuubEcjOu+HvYVCIu/3i+88s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZcZsfRWOfNuFDtSSLHnryaSouPS+HWIZLDuTlTto9j92OO0AgnZ1D58mkdaw3QBXc
 JYUeBtYh6TryfxuwHIobx9NFTZNdjNDE9rIFlslbvoQ+fq3fFTiMjZSwvjlhs8SzZ7
 q3yz3/bS414aSXGESzaVHyjl8CTVZYDl7zVxF+cz4iykJMkcwgyuJ84l3d9Wxpz4pO
 sSiqrOi+qZvz29ecpAFboRmHFlCRV9aL0NAJOzW4qxcrvKAr0ipVebhqtBKGwqGT0K
 s95TjdsR2i4cOmwvt5SWwUwirta/u6sWquEic0NJriewHWz+uCMblsWiqr28mQObkF
 ZFSBalO1YEXlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZcZsfRWO
Subject: Re: [Buildroot] [PATCH 3/4] package/qemu: reorder dependencies
 alphabetically
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

Romain, All,

On 2022-12-17 16:37 +0100, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qemu/qemu.mk | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index e800f31e7e..d42a16ec3e 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -22,10 +22,10 @@ QEMU_CPE_ID_VENDOR = qemu
>  # Target-qemu
>  QEMU_DEPENDENCIES = host-meson \
>  	host-pkgconf \
> +	host-python3 \
>  	libglib2 \
> -	zlib \
>  	pixman \
> -	host-python3
> +	zlib
>  
>  # Need the LIBS variable because librt and libm are
>  # not automatically pulled. :-(
> @@ -251,12 +251,12 @@ $(eval $(generic-package))
>  #-------------------------------------------------------------
>  # Host-qemu
>  
> -HOST_QEMU_DEPENDENCIES = host-meson \
> -	host-pkgconf \
> -	host-zlib \
> -	host-libglib2 \
> +HOST_QEMU_DEPENDENCIES = host-libglib2 \
> +	host-meson \
>  	host-pixman \
> -	host-python3
> +	host-pkgconf \
> +	host-python3 \
> +	host-zlib
>  
>  #       BR ARCH         qemu
>  #       -------         ----
> -- 
> 2.38.1
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
