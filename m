Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25356C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E2060E3C;
	Mon, 20 Dec 2021 22:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TakMYqmsq5ML; Mon, 20 Dec 2021 22:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE4AC60E69;
	Mon, 20 Dec 2021 22:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD101BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71C57607A1
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4g8MD25DURNl for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:40:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 730A460E3C
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:40:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id j21so39961205edt.9
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5/twrZxuumSId+q9g/TNsNTUtqcvfsNIxxokbgPK+sY=;
 b=DOmIqN51GbuHZ8M8gswvC44mL0eo9o0mupC3/um0DDgMAMA13b1uWO8UgXPEcawvoZ
 6RONxQULkKWcVTBrQh7TJ6z4TRqRhcdWS4CMjxJZHMtJ0VRSQDz2MWLkM7anPE9EAyqs
 QZUanyjwbbzjgObCXp0fQduioXofbhqGTHx/GzypjAPZghKqjA/vR6KOrQLkXrUZR6C6
 I/YUqfllmjw3fgn4txb89pcELRoGFDRsP+uVV9xdJnTWlhl0RLZeJCdRwId0DP0r+r+b
 sZLW9M2qwoh65F/45p6KQSUkcuV4HrutbrgDUJEQI3k5MMhbpJREEgyX8uMoJcaRHNsF
 5lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5/twrZxuumSId+q9g/TNsNTUtqcvfsNIxxokbgPK+sY=;
 b=uw3fm9stOb8kcE4Lxw5IkNuCVFQ7QM4Jcb3IndqHN8MO0zcuO1h+7mkhqv4ouv7v/C
 vs/577CthF1oo7l1xT9EfVNWGKbecDMZjgnNwRJ/1GxzqI06cIC8Qklyq+MlYGzUV/EV
 dqd+0akjOfakzpJ2xrJrJX/mdwCemDmRZERrH0ap7c4Yaj0XkjyLS8NxuDkUMRMCitAd
 g4cPLQdlmJytgtut2bwQfFSFuSsSV1yxu2aIuKq/dGYcBqa9MjzBmMlPxHXBtk7Hmbm1
 59ioYpt08mMpi4SSsq+mQIzuwBoAemQ77aHzTv4zJqR/lK42jUnN4SP7SBCYxb1MbpcD
 DBog==
X-Gm-Message-State: AOAM532LQ2IwNp86OrMYhYUGAWe6614NZBmfRrdAV4WjVh40tLbIKObH
 S9ZEUkHRvF0a5DJc92cx+XxycFDSDV96xg==
X-Google-Smtp-Source: ABdhPJxUbAjq5FNtqrZdJUpaBKmyIbuHkvHPZZumTnmrQGO6F+ExUm7CTpkbeNWjznN7wSls+yL4Fg==
X-Received: by 2002:a17:906:7305:: with SMTP id
 di5mr256158ejc.702.1640040010786; 
 Mon, 20 Dec 2021 14:40:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id lv23sm1909068ejb.125.2021.12.20.14.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:40:10 -0800 (PST)
Message-ID: <f7f89265-37fd-9a08-89e0-c3576035f8b1@mind.be>
Date: Mon, 20 Dec 2021 23:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211219160510.1359989-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211219160510.1359989-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/stm32flash: use official tarball
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/12/2021 17:05, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/stm32flash/stm32flash.hash | 2 +-
>   package/stm32flash/stm32flash.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
> index 514d71f823..7039f06eec 100644
> --- a/package/stm32flash/stm32flash.hash
> +++ b/package/stm32flash/stm32flash.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  dec1a81a3ba85a61dfa39ec12e391ea16a8d431470f41d34413f7ab183da46ef  stm32flash-v0.6-br1.tar.gz
> +sha256  ee9b40d4d3e5cd28b993e08ae2a2c3c559b6bea8730cd7e1d40727dedb1dda09  stm32flash-0.6.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
> diff --git a/package/stm32flash/stm32flash.mk b/package/stm32flash/stm32flash.mk
> index 1c68a0ffbe..6e38e09d98 100644
> --- a/package/stm32flash/stm32flash.mk
> +++ b/package/stm32flash/stm32flash.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -STM32FLASH_VERSION = v0.6
> -STM32FLASH_SITE = git://git.code.sf.net/p/stm32flash/code
> +STM32FLASH_VERSION = 0.6
> +STM32FLASH_SITE = http://downloads.sourceforge.net/project/stm32flash
>   STM32FLASH_LICENSE = GPL-2.0+
>   STM32FLASH_LICENSE_FILES = gpl-2.0.txt
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
