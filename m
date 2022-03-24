Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4986C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 964FF843F6;
	Thu, 24 Mar 2022 21:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zg-fsdy-lSh0; Thu, 24 Mar 2022 21:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF0D4843BA;
	Thu, 24 Mar 2022 21:14:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA7B1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EE2B40350
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZeS_OmEhufm for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:14:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87C9F415CA
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:14:13 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a8so11643628ejc.8
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d9SlEUfPchzHTbsdZ/JM6cUjKla62xE5gLzzSdSYMCg=;
 b=XnxGOnccXeud+dp/zTkwGQPWPvlJdOR61jPgtxIi+3Z713BxoIUmJPoLwYl9LIQXt6
 SpTEyvCpqa+x2F/dVwjAchWVtvXYD0ktwZWa3acrDUAxLV+T8LE4WU4mrSFAOXRwgDXa
 NwfpX+ZhE/55gH5JnrRhk3d+AWIqDDOdiEZAzMi0fB1N1yWczwjveQvYCRncK7afn1kC
 bJJ7/rqOiXJordee2hK3eHVqWQYHk31ejbkxCl895/G/z6uzjz1KcybhAKQgGUUahZ/F
 6o8I0wyHifULxX3DAfn7Kwv8Rj/7BnTvjw/yF6eKHsOKmWXDcLIQSSJEq/L7BKWSk3k1
 B+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d9SlEUfPchzHTbsdZ/JM6cUjKla62xE5gLzzSdSYMCg=;
 b=SJpluT7JKgG++kfj3LfJWDAVyHHG3RKiPw8WbZbLA1ksQYx6b728gMg9OO4Rdrw9Bg
 +OwFdV6nt80RNujmND2OQx/hQnOFKA1hbqafXwNkDd45NZa/KuAd3vT7dmSCQdLKNzco
 C18/AhjhGtDcLFUANe5HIdKxW874cjcTsVrp+h3G3xHlg5Z7yKmw52/kAxZtl/+lae75
 m6d6cxEeJznO+0yJFOsRXfB8Kk0gOhv2/KbKIrpjvu62+UAp7bpo2aG4ATLDnCXD9/mb
 GokrCYz993a8Rq0eUuGUJmeQLIrigqWXf1o0Faw9JOLtsx9yddchHGGAoavPNJJc3yn1
 L2Sg==
X-Gm-Message-State: AOAM5320X2L3cNdcHsGznTlgLmy9cD9+Y81qSq2dQv69KVZPbBwfzBGS
 O503Rhh4sHYTkvG0366Rx44+gw==
X-Google-Smtp-Source: ABdhPJwBP/vx5UmnhmyGyVUJwrVE+SZS4H1PCOH8BsBhFFhChmkgDvKDcwd3WJ1c7MKJQS+CJEWQDQ==
X-Received: by 2002:a17:906:4fc4:b0:6da:b4c6:fadb with SMTP id
 i4-20020a1709064fc400b006dab4c6fadbmr8222203ejw.282.1648156451750; 
 Thu, 24 Mar 2022 14:14:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a056402349400b00419651e513asm2049690edc.45.2022.03.24.14.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:14:11 -0700 (PDT)
Message-ID: <52993c0b-1955-f1e0-6aa8-49fa2d984132@mind.be>
Date: Thu, 24 Mar 2022 22:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220315220305.2439467-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220315220305.2439467-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libbluray: bump to version 1.3.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2022 23:03, Fabrice Fontaine wrote:
> https://code.videolan.org/videolan/libbluray/-/blob/1.3.1/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libbluray/libbluray.hash | 4 ++--
>   package/libbluray/libbluray.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
> index 4ab8c85866..6e62bb49a1 100644
> --- a/package/libbluray/libbluray.hash
> +++ b/package/libbluray/libbluray.hash
> @@ -1,4 +1,4 @@
> -# From http://download.videolan.org/pub/videolan/libbluray/1.3.0/libbluray-1.3.0.tar.bz2.sha512
> -sha512  3d5145e6fd7de099c07f937282112c7abb12a5590b7c0b965b00bddee3837ddfd1a30076aaa6d6278d07a5beee3856f602125983ae075ab30eceb6ac1bd9bcdc  libbluray-1.3.0.tar.bz2
> +# From http://download.videolan.org/pub/videolan/libbluray/1.3.1/libbluray-1.3.1.tar.bz2.sha512
> +sha512  f39fc8a11771e8fdd5eeebf0ab23535ffab44721f64b350e5d153eee44555b31c618b6d765da114254dc83ff0ff89e84c6b185f61cdbcfedd2d47a5f6e26b75a  libbluray-1.3.1.tar.bz2
>   # Locally computed
>   sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
> diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
> index 233797f38d..a9eb3c67c6 100644
> --- a/package/libbluray/libbluray.mk
> +++ b/package/libbluray/libbluray.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBBLURAY_VERSION = 1.3.0
> +LIBBLURAY_VERSION = 1.3.1
>   LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
>   LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
>   LIBBLURAY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
