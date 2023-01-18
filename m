Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918A6C32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 20:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 311E3610AD;
	Wed, 18 Jan 2023 20:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 311E3610AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wV5cLj8Chjn; Wed, 18 Jan 2023 20:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6649A6108F;
	Wed, 18 Jan 2023 20:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6649A6108F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5DD1BF28B
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 20:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A4F96108F
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 20:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A4F96108F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21GNmpiSEVMI for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 20:43:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FDB36107E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FDB36107E
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 20:43:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 21C245FFA1;
 Wed, 18 Jan 2023 21:43:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 21:43:12 +0100
Date: Wed, 18 Jan 2023 21:43:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230118204312.GL2770@scaer>
References: <20230118182333.503773-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118182333.503773-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674074595;
 bh=DcQUl7krsneZKucQVr3pp762nYnMGU/3xsyIWOm/YdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ciKxfekOGBbOCvM352S+AlelVGgKrrddbj4hAxNbmgYD4IiKA1OO8HCthAyQyNMDQ
 zKZatra1s0ivr4wMRYg+0dE2/zPdyy9B6l/kPvARFWKTv87S6QnTGu2F5AGIBomcGI
 chw1D21Jv2fcPdLOQUQG90n+NWh6vI+3cCXRYfpNrkqXUx+IiF6dUFOJq8hfO4mqIX
 dRAoIleCisSulMsJgv4SLJ2IqID4peZo8fFf9plLRDdnfMygxkhYCBMQLPYDFsG9Fm
 yrE49OOOigalJoWjhtqxB35HQ2KtNUw0xiGZtNtHLwQRW0R3bszGiSC61M7Mv8Vy0U
 QoDlhoX1//UFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ciKxfekO
Subject: Re: [Buildroot] [PATCH 1/1] package/xxhash: set XXH_NO_INLINE_HINTS
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

On 2023-01-18 19:23 +0100, Fabrice Fontaine spake thusly:
> Set XXH_NO_INLINE_HINTS to marks all internal functions as static,
> giving the compiler full control on whether to inline or not. This will
> fix the following build failure raised since bump to version 0.8.1 in
> commit 5dbdb2535c649ee617595b8c4ae3cbba0ee37b97:
> 
> In file included from xxhash.c:43:
> In function 'XXH3_accumulate',
>     inlined from 'XXH3_hashLong_internal_loop' at xxhash.h:4390:9,
>     inlined from 'XXH3_hashLong_64b_internal' at xxhash.h:4453:5,
>     inlined from 'XXH3_hashLong_64b_withSecret' at xxhash.h:4473:12,
>     inlined from 'XXH3_64bits_internal' at xxhash.h:4554:12,
>     inlined from 'XXH3_64bits_withSecret' at xxhash.h:4570:12:
> xxhash.h:4196:1: error: inlining failed in call to 'always_inline' 'XXH3_accumulate_512_scalar': function not considered for inlining
>  4196 | XXH3_accumulate_512_scalar(void* XXH_RESTRICT acc,
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f2c52238df97cc4c13117d8dc1423235231a094c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xxhash/xxhash.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
> index 04bc98690f..40e3c2696c 100644
> --- a/package/xxhash/xxhash.mk
> +++ b/package/xxhash/xxhash.mk
> @@ -28,6 +28,7 @@ endif
>  
>  define XXHASH_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		CFLAGS="$(TARGET_CFLAGS) -DXXH_NO_INLINE_HINTS" \
>  		$(XXHASH_TARGETS)
>  endef
>  
> -- 
> 2.39.0
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
