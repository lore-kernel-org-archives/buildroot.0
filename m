Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C798C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FEC141622;
	Sat, 14 May 2022 09:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhGzADGWVyeK; Sat, 14 May 2022 09:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D022440861;
	Sat, 14 May 2022 09:48:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8044B1BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F10360B42
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ck1EBTjszVSV for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:48:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7719D60AE5
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:48:09 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gh6so20422988ejb.0
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=JZPP6FqQBflS2N4dVsEclb1s1GNY13oQB5UEMhlGjZo=;
 b=UDkEBlMv7SkJBZK2m3XVJBlLkaqiOXKyrmBqQ2xDEjocVCk2QI0TtWjYwXvLrL02uS
 GanEwODIq+vG+0RIZTfOE5UEyG12dfEkR5ZUyTBb/Y5SkQU6PNFrq8C+gWNANnXRIpXe
 8hj7sZvroKuDOXS+zpgfRP0+ghfGYXHSN+KuQ2MoVUhvRCjMBDkCwKkwQH0VeNKabYKh
 mNRlGor38Mv0miTS2cThZy269tseR3SAY8e8LMybFcJIru9Omp+NDOdYqd5W33YThL37
 tUpqySMgk8n47ngC4LeknKo3B1ji+fMyxYcD76drVEff2m6r+c7QvLFMTenuLzP6F7Q6
 qXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JZPP6FqQBflS2N4dVsEclb1s1GNY13oQB5UEMhlGjZo=;
 b=rfXXsCfuie1uw/hOFgqj/KOwF7vJ3tqsNW3S83qIrPZauVrtnwGtYM7kgwzNn2Q/P5
 wHoVsssNMhMWYY9WKCi+jwyXpqg5aXUkasXFR0NLJgy9R+XEExioINmrSvSNf8WEWoUf
 4cwWHCMKCUPklSEA8Lh2NmGVqMtoBHARCSoXOYQOh6V5xeFBMIofsjY0QIRCi3eX9UZq
 kh4Klg4LB7uSlK6Pc/H4bK7xzJmqamag4lz8U1hA3MpASvyBKcPvSuxz1fgl2P88/Wtm
 HH58cfQSc1JY1uOSulQCWKqk4X2Q+qeBSgV5iztdWArt7+5YdP7P9kFEuTvRcW3WDneG
 9BZg==
X-Gm-Message-State: AOAM533Yl3PZ8ijQOnO0EtsleDwqQQergUftksKoJ2OJagmhCq41+Ftm
 YbBTaY3fz19GXq4aER0awNdpddK5COf5mg==
X-Google-Smtp-Source: ABdhPJxhZiG/W5wceswxsBzwIvcjC6rWFXFkx7irBV/GsxJn9Cgx7BkrNMGthZRgcrDPZaMv+o3Xjg==
X-Received: by 2002:a17:907:7d93:b0:6fe:21d9:4230 with SMTP id
 oz19-20020a1709077d9300b006fe21d94230mr688379ejc.42.1652521687392; 
 Sat, 14 May 2022 02:48:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h11-20020aa7c94b000000b00428a42815aasm2032332edt.0.2022.05.14.02.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:48:07 -0700 (PDT)
Message-ID: <bef4fafb-b02a-f09c-a1db-90e980278dfe@mind.be>
Date: Sat, 14 May 2022 11:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 buildroot@buildroot.org
References: <20220512143647.49989-1-thomas.claveirole@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512143647.49989-1-thomas.claveirole@green-communications.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/vuejs-router: bump to version
 4.0.15
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



On 12/05/2022 16:36, Thomas Claveirole wrote:
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/vuejs-router/vuejs-router.hash | 2 +-
>   package/vuejs-router/vuejs-router.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
> index fe270a6062..ba8f09b508 100644
> --- a/package/vuejs-router/vuejs-router.hash
> +++ b/package/vuejs-router/vuejs-router.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  6adff85db2045a092ba4bf37e95cdc3c661cfe4f3e7f7cbc36082a57c05c6365  vue-router-4.0.14.tgz
> +sha256  59d6f3e237e68953fc4e4e22463b487b9fde5733b3ff3392eec488c0cc84976b  vue-router-4.0.15.tgz
>   sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
> diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
> index 397a78e1a7..562c698157 100644
> --- a/package/vuejs-router/vuejs-router.mk
> +++ b/package/vuejs-router/vuejs-router.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -VUEJS_ROUTER_VERSION = 4.0.14
> +VUEJS_ROUTER_VERSION = 4.0.15
>   VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
>   VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
>   VUEJS_ROUTER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
