Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293A6C4332F
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 941AC40A8C;
	Mon, 25 Apr 2022 19:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siDYctgnsTmf; Mon, 25 Apr 2022 19:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94CB740529;
	Mon, 25 Apr 2022 19:03:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 112D01BF312
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F35A340529
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YItTSfOFOPe4 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:03:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58F6E404FF
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:03:19 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id w16so10214371ejb.13
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Q9J1XI5NB6gVl79jojhLoagDHop8n5U6/mBvZ6Xg+hg=;
 b=bkE3QMFx1feNxovO2U+6vSh9TgMDdIurfR3ScNp5Ig74kduZJ2YiUmqzd+Ynr+u2CN
 EZDx3dmN8uhnw5tBVPjJPIM8J3DeXcIHZO6sSOS6EjWBLkJFFDmXYm6nkvuFGV1rPZV1
 8JP+7U2YdGw2SvsQAQJZbXj0HgjjRU7wim30eTyeT9fAYtmHXSOUpzFsECMT2nvhL9q6
 TCtXZ6bJd3LLvLe2F5MUYRMhJG1p+/gu72Tdbexn5Vj06XYrhFVwPwYZ6WlOemHM8/b6
 nVy4Xgb6AMMVd2/geDKkl9ZyzizcteG6cT5YjDrgiMzFKuRv7JWe7zZOL1wpm6UBWL/i
 tfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Q9J1XI5NB6gVl79jojhLoagDHop8n5U6/mBvZ6Xg+hg=;
 b=gO31eLMXosoHD5dZKOb1J2J7PeEGe1/3BgiOUnTjUovXtE42pvFS2huwEfHLYBS9w1
 zsugmlRnAgxNM6jfE8IzYksp8jb4/S003q93agZan9BhiaI5pJMjOiiZw5+iMLLhkRd0
 BFeEjtMli7tIom/zQoK0tD+N07FWRm3HxZj9l9A6Wvyi2KO4Any+sYVuBZLtsgoslGZT
 fSpbeIT1qCc4ohc4A/vq7pbLIhLgYO/pb0ktyFkh8QIppwQyJkxR3m0w0EjSrfllI91H
 DtbWDYQJJIQimErhf2PI4dygv9FJaV8tpzpQ8AfYAYB4Sftc4e7xDrMK5fIrlbZVApkI
 d85w==
X-Gm-Message-State: AOAM533+PS1Uborhy4Tn9wZuP+Vbdp0lfxjRgL6wnGCvb0oxL4nuIqWL
 MwIiEj3EqxgJApYvsdlNRO1g5PiRqpLEPg==
X-Google-Smtp-Source: ABdhPJz0eVESt+c+YTxfGfR0v0Ua3oyqk+ImB70DQNX5+yM61vZZy5p5kiyjqFSbYCe9yDFRcArlIw==
X-Received: by 2002:a17:906:1841:b0:6e8:872d:8999 with SMTP id
 w1-20020a170906184100b006e8872d8999mr17442067eje.492.1650913397529; 
 Mon, 25 Apr 2022 12:03:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm3888331ejb.194.2022.04.25.12.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:03:17 -0700 (PDT)
Message-ID: <0fe99444-c94e-0fec-ac3f-4ade3d7035b8@mind.be>
Date: Mon, 25 Apr 2022 21:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220422071643.60273-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422071643.60273-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.17.0
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



On 22/04/2022 09:16, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/xmrig/xmrig.hash | 2 +-
>   package/xmrig/xmrig.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
> index ff5f80a67b..7863c0319d 100644
> --- a/package/xmrig/xmrig.hash
> +++ b/package/xmrig/xmrig.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  245ba47a6b8ae8e9a9df1c055e90f22f944a7d1219416cb30268881d0c0d377b  xmrig-6.16.4.tar.gz
> +sha256  748a989390202ba2d1ccbd9d9a6b8cbd6551149cbab63b347fd1ed6df0254faa  xmrig-6.17.0.tar.gz
>   sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> index 1feab499fc..6e21e550a4 100644
> --- a/package/xmrig/xmrig.mk
> +++ b/package/xmrig/xmrig.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XMRIG_VERSION = 6.16.4
> +XMRIG_VERSION = 6.17.0
>   XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
>   XMRIG_LICENSE = GPL-3.0+
>   XMRIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
