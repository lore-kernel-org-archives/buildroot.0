Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658A9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16E7E403E9;
	Sun, 13 Feb 2022 15:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGPI0bw1Selv; Sun, 13 Feb 2022 15:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14A1A403A4;
	Sun, 13 Feb 2022 15:25:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF25D1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E78E606CB
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXHGoGE6CKiq for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:24:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2708160655
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:24:00 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id p15so32588158ejc.7
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=IBjz+/uHmYOKHLkmekDrW4xOY+o3RGd9UXUhP9snbJo=;
 b=IGEj2SVSvljPEAVyDHUXxwP8l2tVqAYd8cb6SioWweIgivCk3zZJnq9cgLAqlJxtXc
 MtG1Tv/Scr/kU5VsVpSw86JEeE8hwM9bIJM8oSdqTxdnXDsp3w0Clq+xMv9o9Q2cOKu1
 OyjejcbNwBZcJ2nORi8W/YcYGnFrpKHIEWiOMoCHNbnnXDiZftDimAnN62Z5jjY2JIv5
 yDIGFVpn+J5Hg1h2wbKMjDF6bqmdBdqCnVFglZ5UkPgNiYQjusfvUurvGYNa6cdNgil1
 Decu/3lqewyUr22Pp38TRjfKk1FnQizzhE4GPdBUT+JsqbU817VMGOHYsc4zcgGNnM7m
 vKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IBjz+/uHmYOKHLkmekDrW4xOY+o3RGd9UXUhP9snbJo=;
 b=KxsiyFdE/vz1rweedLFk5RQHKmsmPqFEwwRYL/J3kaj1MaNIL1Qzt/66lns/NvDEu3
 vKvntXUxNb+5zUOTlvTzm3Evt6rCZ5X2iJ21TzXwkD9sSxYVAXl7ItFvljLWpeBlA1TJ
 mz3fPxaKvwP7iXkdAXyYBdSTfdQXzfNXNsUMqg7JWqI7qAUK42eV95kdzGqiVLuY4g3z
 sXpDfZEFT6M6cOFze7HrJE+XqLrpUoj6C3ef59R2GqFx2L9KlmrKvtOztGjf03u4VCk/
 nwcLdQjh9KxD5N+f0MzACNi155ffC6SC8bkOj9M+BSaPk6Y93pi7BtH9AlUcI1OL7RNl
 RmRA==
X-Gm-Message-State: AOAM53224XIQRt+H/cY+LcgpJG+td7EWf7aKf4fXDANgGgqoEX+rdkYi
 OdJoDT+NaJbTgQvLSOOjUhED6Q==
X-Google-Smtp-Source: ABdhPJyFamM0osn2mY7juM7EV8qFnWRgNZtdRTce/J5orFFqYgESXyaG9jDCg3F/YfcSkxxwRF2Huw==
X-Received: by 2002:a17:907:3e8a:: with SMTP id
 hs10mr8215877ejc.112.1644765838446; 
 Sun, 13 Feb 2022 07:23:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y21sm1654105eda.38.2022.02.13.07.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:23:58 -0800 (PST)
Message-ID: <100393fa-c571-821c-9226-b01d0a144df4@mind.be>
Date: Sun, 13 Feb 2022 16:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220205174046.1850152-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220205174046.1850152-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libldns: enable dane-verify
 for OpenSSL
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2022 18:40, Bernd Kuhls wrote:
> Since the bump of libopenssl to 1.1.x support for offline DANE
> verification can be enabled.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: enable only for libopenssl, libressl does not support SSL_get0_dane
>      (Peter)
> 
>   package/libldns/libldns.mk | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
> index 7deca978da..86e7c0eafc 100644
> --- a/package/libldns/libldns.mk
> +++ b/package/libldns/libldns.mk
> @@ -13,11 +13,9 @@ LIBLDNS_CPE_ID_VENDOR = nlnetlabs
>   LIBLDNS_CPE_ID_PRODUCT = ldns
>   LIBLDNS_INSTALL_STAGING = YES
>   LIBLDNS_DEPENDENCIES = openssl
> -# --disable-dane-verify can be removed after openssl bump to 1.1.x
>   LIBLDNS_CONF_OPTS = \
>   	--with-ssl=$(STAGING_DIR)/usr \
>   	--enable-dane \
> -	--disable-dane-verify \
>   	--enable-ecdsa \
>   	--enable-gost \
>   	--enable-sha2 \
> @@ -26,6 +24,12 @@ LIBLDNS_CONF_OPTS = \
>   	--without-pyldns \
>   	--without-pyldnsx
>   
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
> +LIBLDNS_CONF_OPTS += --enable-dane-verify
> +else
> +LIBLDNS_CONF_OPTS += --disable-dane-verify
> +endif
> +
>   ifeq ($(BR2_STATIC_LIBS),y)
>   LIBLDNS_DEPENDENCIES += host-pkgconf
>   # missing -lz breaks configure, add it using pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
