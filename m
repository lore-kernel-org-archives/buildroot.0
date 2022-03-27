Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2982C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E6560B9D;
	Sun, 27 Mar 2022 16:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3HskFus-gE9U; Sun, 27 Mar 2022 16:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD27960681;
	Sun, 27 Mar 2022 16:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FA3B1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E05960681
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1R3PFOAsmNp for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:30:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A54B60625
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:30:30 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w25so14404129edi.11
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fAgcowAX+rIgRY3F/TfUaoAmpsMuxd58gcDdyIpGA60=;
 b=Dw99uo2SKYQGhK+Xd6+ZtL9Bc83Hs6H7ctY2XyJVIX81LNVtTZmUaLEEjPv+pcD9/N
 L3dWf7d2PwxEIAgBXqHWEgYVSsA9EDwxT6V7897oSYkFe9fWePTVRYS1IvXCrV0QHoNG
 PuKt0TI5j9sS0xk5iIEO0LwD3xEEc7beTVW9otnUpxfe4S6heziYSco9U/N89wWSrWI/
 NeT3K4bMSTvRttw2+02GpcrUzj7Wk9IjwZySfozfDM/poWzKbtUEaIQZ7/RdCb6m26RX
 ANwYlxHdyYVnTLgzTxd9UsJFrG1/KcXKwNDqfJM0Qgoejd//wvKBJVHlIEj8rAox1V5Z
 63Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fAgcowAX+rIgRY3F/TfUaoAmpsMuxd58gcDdyIpGA60=;
 b=j2XFJr2xrgkFkIS/GD9I7MpLfEHZHGMmDDZU3WSwKprEjszwPTDaC+2RWjLq5QmJeM
 iDrE7WWajgr6JuTTtcyA9L2LesIdeHTqj23SrYnWA/KXW5nhfYNlJNPVQK+F2c/bfrvY
 4qDIDRcS8IHztC8MojEvfnj6XQIuXyfK7jN2/Bb+k5pA0Rsh65PgwJQPSH7FK3LqFSYo
 Ff80wBMpZ5VjW2c5TFCni9pQoiN1N5MHjzJpp4SbFRxf19BrctcX/jEUFWzfn6SL5fGp
 ZpaH3IvEwoX8tazs+Kqlb2G2NQtDwqsJj1qR2x0FR6I9+rhamYqRvQohXaB+gKOzvJwP
 Qe/Q==
X-Gm-Message-State: AOAM531aW9PLV0PB5SYMMJf1mkIDr90eZa4mJQOdrCAi9p8kNUDFs0Ez
 BY5c5GlMMOEYoWDGtdK4X+6TFg==
X-Google-Smtp-Source: ABdhPJzB9DjKOmRjPpTs+JTUkSfGEL+E0x94oS9d1agBAlEFyPaLhn89kJqekyjPiX2uwP1B4PFTfw==
X-Received: by 2002:a05:6402:1909:b0:418:d876:3119 with SMTP id
 e9-20020a056402190900b00418d8763119mr11384599edz.266.1648398629000; 
 Sun, 27 Mar 2022 09:30:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qa30-20020a170907869e00b006df9ff41154sm4742539ejc.141.2022.03.27.09.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:30:28 -0700 (PDT)
Message-ID: <d453aa1b-d919-d632-a642-ddb4097c9d93@mind.be>
Date: Sun, 27 Mar 2022 18:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220326142007.864294-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220326142007.864294-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH v2 1/3] package/intel-mediadriver: bump
 version to 22.3.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/03/2022 15:20, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied all 3 to master, thanks.

  Regards,
  Arnout

> ---
> v2: no changes
> 
>   package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>   package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
> index 044b9d7013..57499830b1 100644
> --- a/package/intel-mediadriver/intel-mediadriver.hash
> +++ b/package/intel-mediadriver/intel-mediadriver.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  b74227ab165fdb09f184968589129dbf29bf382b44b415dd69db9e612f551345  intel-media-22.2.2.tar.gz
> +sha256  89940ae2f7e5c7ec182f0d4d0ce8e149ae614876edd5bdad2b852e699a29b3f9  intel-media-22.3.0.tar.gz
>   sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
> diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
> index 84eda811ae..c22aeecc77 100644
> --- a/package/intel-mediadriver/intel-mediadriver.mk
> +++ b/package/intel-mediadriver/intel-mediadriver.mk
> @@ -6,7 +6,7 @@
>   
>   # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
>   
> -INTEL_MEDIADRIVER_VERSION = 22.2.2
> +INTEL_MEDIADRIVER_VERSION = 22.3.0
>   INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
>   INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
>   INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
