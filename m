Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27532C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 19:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C712941C77;
	Tue, 28 Mar 2023 19:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C712941C77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkkIvhuYlsMp; Tue, 28 Mar 2023 19:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2023B41C6E;
	Tue, 28 Mar 2023 19:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2023B41C6E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D03601BF23C
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8DB340508
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8DB340508
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UP99__SwTSzE for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 19:38:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7350D4033A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7350D4033A
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 19:38:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 63CE15FF9E;
 Tue, 28 Mar 2023 21:38:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Mar 2023 21:38:49 +0200
Date: Tue, 28 Mar 2023 21:38:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20230328193849.GB3204460@scaer>
References: <20230327141122.103829-1-luca.ceresoli@bootlin.com>
 <20230327141122.103829-2-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230327141122.103829-2-luca.ceresoli@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1680032332;
 bh=Ag44FNb6lii2jgaG2h7IzfZlBZjRYUTCXaZw+B6J6bI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dd/hM4gen/oq/j6a8T31qSXaW2pjtMBpEReC5Gywel7P7gPnQhHBhDSJM/cty0XP1
 nvCxVBARZbjC4t6qZJWDaFfwDB9GHDGAJzX7829MTNHa0G17LBBVV6VKFivEkHap2s
 lu4Iu6HJAsfPCvQUpcV8I+CAoA14qe96Pnih3GQ3N1zt0xuskBCBqerWb7PVNrnOCx
 l4SBbBA4vhrTWQ17WNJtkDFsh6GOfq1gnO+xIP3Ia8dmQojoa02aoqVI2m2/P97dRP
 AvFnzL2coN5JNdIF8D7GkTBznSi5gEV/C1+6pIuTPLESSQvQZBaKcPJp+uOr6MQztX
 nmucT1fGtgDiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dd/hM4ge
Subject: Re: [Buildroot] [PATCH 2/2] docs/manual: ditch redundant -f 'rm'
 flag
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2023-03-27 16:11 +0200, Luca Ceresoli spake thusly:
> The value of the RM variable in make is 'rm -f', thus the additional -f is
> redundant. Avoid it on the docs to avoid developers taking it as a good
> example to follow.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to master, thanks.

Will you send a tree-wide cleanup, now? ;-)

    $ git grep -E '\$\(RM\) -r?f' |wc -l
    47

Regards,
Yann E. MORIN.

> ---
>  docs/manual/writing-rules.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
> index 758965d80a0a..13b7fd5bea6a 100644
> --- a/docs/manual/writing-rules.txt
> +++ b/docs/manual/writing-rules.txt
> @@ -78,7 +78,7 @@ Do not align the +=+ signs.
>  +
>  ---------------------
>  define LIBFOO_REMOVE_DOC
> -	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/doc \
> +	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/doc \
>  		$(TARGET_DIR)/usr/share/man/man3/libfoo*
>  endef
>  ---------------------
> @@ -118,7 +118,7 @@ YES:
>  ---------------------
>  ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
>  define LIBFOO_REMOVE_DATA
> -	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
> +	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/data
>  endef
>  LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
>  endif
> @@ -128,7 +128,7 @@ NO:
>  +
>  ---------------------
>  define LIBFOO_REMOVE_DATA
> -	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
> +	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/data
>  endef
>  
>  ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
> -- 
> 2.34.1
> 

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
