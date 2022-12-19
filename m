Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52405C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 20:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE497405D7;
	Mon, 19 Dec 2022 20:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE497405D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SyX1-EoFFVG7; Mon, 19 Dec 2022 20:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 048F540354;
	Mon, 19 Dec 2022 20:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 048F540354
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 498601BF369
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 20:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23AA4401C0
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 20:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23AA4401C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udUuLihWiLJz for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 20:49:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9AFE401BA
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9AFE401BA
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 20:49:47 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id a16so9333893qtw.10
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 12:49:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p3bXbzbg1/Zy0ZorkvKe88RvlUY9JF0HyCdZAKGxPpY=;
 b=15F+CvFQxJYwix0dfOz63stqZsgWdO0nKrKC93PXuqQ4c9pPHmDY2W5xkPj23djrWn
 7lTPyCXYMwt8vY3gwzXbzNyhppJUmTRkf5QXVvt/CjmbKqU+quxRB6o67utgsJ+KK5rc
 LkkadsRG8gLXkc9PZUcrWKEJXyG9Xrfj1XODbm16wLxD6r/++hM4z2YFBb64UCyBZIKP
 P9VNHy04wXyDfwo3l0yt3t4kyH2oe0BdeSdcAejjmlKdGx8y8sBwrR4Z2O1lIJonLtr2
 YV05DyealOQDnxjCYWuH1e3co0SaC9G3k03nqI3DXv6BraRdjY3ox8s1uOGeVUojYVZh
 y0XA==
X-Gm-Message-State: ANoB5pkDfQoh9qzB3XA8+ZatibylSRAkMId+hIwPfLoiuwM6tZ+7zQUq
 8HkAmXZIq4mhjHjQDgvOC17pWY9KXtUB3g==
X-Google-Smtp-Source: AA0mqf4/0dXFJAJ/Jn+/l4XYnyYT0Zs4r2a8+l5yNKiYU07AxkEBzhwP/mvqdVIzkRbvxq2Zlp8Egw==
X-Received: by 2002:ac8:708:0:b0:3a8:1295:f96a with SMTP id
 g8-20020ac80708000000b003a81295f96amr41462262qth.7.1671482986267; 
 Mon, 19 Dec 2022 12:49:46 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 cj23-20020a05622a259700b003a7f597dc60sm6551139qtb.72.2022.12.19.12.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 12:49:45 -0800 (PST)
Message-ID: <11e79180-67f3-f536-ba22-ae2d11acf977@gmail.com>
Date: Mon, 19 Dec 2022 12:49:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: buildroot@buildroot.org
References: <20221219202308.2597300-1-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221219202308.2597300-1-f.fainelli@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p3bXbzbg1/Zy0ZorkvKe88RvlUY9JF0HyCdZAKGxPpY=;
 b=bIYftqjpI10Dml5t2yixFsRToPP9HA8iw7IvuylNihvcnk7qx0Afp5Z5Z27JVHCtcI
 P5xt7wfDdDrCigLUIZC8iIOgYsfu+p+vpNu6fewEjhGzFkbt7+2zECnmQPKO3r4Q0S1o
 a3hgwMXUuNUvZRR995Lwb+H+ErCuRW5xrQfJv0hwQZPBgDLW/c6rj+c9qOi5dLvhU4TV
 mXFjKUKZ9jOYF9S3zmJZk/NrRmUTJhXyLgL4Cn86HXUR7FbRhtnn3GREp/9xXHbvRqTo
 hw9/n9pibYDw43bBea3hSpiAgrXj7odK+AkSQXUBwijsJpY3B1kS0pbDsrR9TDRxgeaS
 5Lrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bIYftqjp
Subject: Re: [Buildroot] [PATCH] package/libgpg-error: Disable support for
 non-C languages
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, mmayer@broadcom.com,
 yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 fontaine.fabrice@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/19/22 12:23, Florian Fainelli wrote:
> The only other language supported is CL (Common Lisp) which buildroot does not
> package yet. This saves 52KB in the final root filesystem.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

We can strip the package installation even more, v2 coming up shortly.

> ---
>   package/libgpg-error/libgpg-error.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 86dea6ad2acd..0b7b8df389f9 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -14,7 +14,8 @@ LIBGPG_ERROR_INSTALL_STAGING = YES
>   LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
>   LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   LIBGPG_ERROR_CONF_OPTS = --disable-tests \
> -		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)
> +		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
> +		--disable-languages
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>   LIBGPG_ERROR_CONF_OPTS += --enable-threads

-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
