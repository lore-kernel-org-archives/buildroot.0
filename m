Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2566C4332F
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EEB960DFC;
	Thu, 16 Dec 2021 20:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mbdn1qgpOd-e; Thu, 16 Dec 2021 20:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B40F660C1D;
	Thu, 16 Dec 2021 20:14:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA9F71BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D825760C1D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hzhPkwjKPOO for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:14:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 108346061B
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:14:29 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y13so91038762edd.13
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SNXXq4biR47CdlnUuvHAHi0CbvJN4naOIJnveFHow/Y=;
 b=KTztf3qC/LvLq+ypyWYS5LzQaclDp+3bo9ieIfNacO+F3KO1+bbtpQ6vZUMFFLJWJV
 3fXGea93okr0jC2Xy1W2BrdAsf8U6lbl0JdXdjJ65kLUUSnEIQHQbI1Q6kW7gMgD8S9L
 TPL10gFX3SgZxo63FI2jbVVT2SD0tPcgr29GH2Dkc3Gc8DDkwFWvfNp8SkHZVHGn0Pgn
 RhsZgZM0upO6EXr8U/UUD7eTrJvhDdBuKwivYhxpdtGw2s9XWRxEDLJihLbSmRbK403A
 DieaJyXmzs7hcepLH1RcuMYKV+V+nWhVqUxnJ5ybS5vlogOEYGVzS/rF7L/H2QI8Ld20
 fsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SNXXq4biR47CdlnUuvHAHi0CbvJN4naOIJnveFHow/Y=;
 b=XJDnpkamtIpuCGU3aIuA8VXGBDnYt8ydCJuz7ioecnauMf+e0FI0Avk+pitojU+RUt
 hW6eL+J76G52A/z5MGyFPydxR6qQKDVPiVuPbXDfIlmAWrEY5QJrYs+0EipLL9C7DFxF
 InmvT91pqvMBwFOImWvDxyc9gWtRKXGM+uihOGPtA+I1hvyFpDM6Vsk5d7/ZLzjwfU93
 06mIhBM5aGfeh1rc8X0vLx1x7RQq2XX4EM7Ni7aojPY6HKH13ZC8k0YA9yz+eLMAMNCX
 nH2I5Ogv2n6oRMHoDSLZewY9CZqwowgquNaKhzB1AizeuPChgrqdwFXaS2EWkNqxJzGN
 j1wQ==
X-Gm-Message-State: AOAM5309PpdkZhFMD4XicfldUXXVv4MTjdHBy/mxV0vpHpTwhNSk8tLl
 4MOwx429mQyHxpQlbNAVl0GhmQ==
X-Google-Smtp-Source: ABdhPJz9NxpMb6pFqzw/pfNyegQvWvqdn0Ee6zZtnOrxE10YCCyWUuhV0u9MOtjShlTbCaiRl8yNAw==
X-Received: by 2002:a05:6402:22ef:: with SMTP id
 dn15mr3374140edb.375.1639685668375; 
 Thu, 16 Dec 2021 12:14:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d14sm2709535edu.57.2021.12.16.12.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:14:27 -0800 (PST)
Message-ID: <7c7dd2cf-9446-5a1b-f36f-350211be9f1c@mind.be>
Date: Thu, 16 Dec 2021 21:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211215223905.1844641-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215223905.1844641-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: add optional support
 for pcre2
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 23:39, Bernd Kuhls wrote:
> pcre2 takes precedence of pcre:
> https://github.com/tvheadend/tvheadend/blob/master/configure#L473
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tvheadend/tvheadend.mk | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 27443307da..4e84e496bf 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -121,11 +121,14 @@ TVHEADEND_DEPENDENCIES += liburiparser
>   TVHEADEND_CFLAGS += $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)
>   endif
>   
> -ifeq ($(BR2_PACKAGE_PCRE),y)
> +ifeq ($(BR2_PACKAGE_PCRE2),y)
> +TVHEADEND_DEPENDENCIES += pcre2
> +TVHEADEND_CONF_OPTS += --disable-pcre --enable-pcre2
> +else ifeq ($(BR2_PACKAGE_PCRE),y)
>   TVHEADEND_DEPENDENCIES += pcre
> -TVHEADEND_CONF_OPTS += --enable-pcre
> +TVHEADEND_CONF_OPTS += --enable-pcre --disable-pcre2
>   else
> -TVHEADEND_CONF_OPTS += --disable-pcre
> +TVHEADEND_CONF_OPTS += --disable-pcre --disable-pcre2
>   endif
>   
>   ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
