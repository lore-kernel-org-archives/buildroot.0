Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C341C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 19:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEE5081987;
	Mon, 14 Mar 2022 19:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id neenRshadT3V; Mon, 14 Mar 2022 19:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4F581772;
	Mon, 14 Mar 2022 19:32:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3114F1BF318
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 19:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AB7E4064B
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 19:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4snU9syOt1hx for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 19:32:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1A884027A
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 19:32:02 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id CC79644062E;
 Mon, 14 Mar 2022 21:31:52 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1647286312;
 bh=30tEJdsJ80jLkj+Nt7oG44mAgiHZfx+Bm1sf6cF3JSY=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=vSeRhDGRcAGYR34G+xQ0y+jSt2UzcsynePJ4qQSngN+weYpSq5WUKPAMZAsgnmv4k
 SAGw6IIPchzNVOjwKq36+/kKILX8sAJg2kohhkPMesY70EEnfunOgEv/OikkbwPdOK
 NuljKJE94v3sLu1TITSG0GjTJbc4TX/0cNVuL8jbjRefIWBS6d/3nB77lRXxGVllho
 KmrKfwDA7NwEo/s6L4JlBcXFSkkhyfyglyj5VDhUWOHYnEFhAI/dWwfy8BqUtitYOF
 PW5747Ic1vlxO2l0R/rnah+X5Y2rAONbVBLSLT4uMZedz68QBak2pY5tWWRLYaxu+x
 HTFM40fXN183w==
References: <20220314185945.2823356-1-bernd.kuhls@t-online.de>
User-agent: mu4e 1.6.10; emacs 27.1
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 14 Mar 2022 21:31:15 +0200
In-reply-to: <20220314185945.2823356-1-bernd.kuhls@t-online.de>
Message-ID: <87lexcbaa9.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix libgsasl support
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Mon, Mar 14 2022, Bernd Kuhls wrote:

> Contrary to the helptext
> https://github.com/curl/curl/blob/master/configure.ac#L152
>
> the configure option is called --with-libgsasl:
> https://github.com/curl/curl/blob/master/configure.ac#L1989
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  package/libcurl/libcurl.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 0db0c088cb..a6e5b06b8f 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -128,9 +128,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBGSASL),y)
>  LIBCURL_DEPENDENCIES += libgsasl
> -LIBCURL_CONF_OPTS += --with-gsasl
> +LIBCURL_CONF_OPTS += --with-libgsasl
>  else
> -LIBCURL_CONF_OPTS += --without-gsasl
> +LIBCURL_CONF_OPTS += --without-libgsasl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL_COOKIES_SUPPORT),y)


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
