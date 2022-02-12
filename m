Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85950C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA6C60DFA;
	Sat, 12 Feb 2022 13:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wl4MwRKUXwaK; Sat, 12 Feb 2022 13:09:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42414605DB;
	Sat, 12 Feb 2022 13:09:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 351B41BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 227EF40272
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2My-wU3-GHg for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:09:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9C4240227
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:09:17 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id k25so28141819ejp.5
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=yGJp2Y+fJ3YAg7LLm6TZ3oh5wYJ+U09wJ/5LZ99Ogfs=;
 b=FGNVGyLO3lpqnk9+4xKK56Jf+6u7hnBlB6N8P3lhaqrjEyqO3D9BQ7TW0tyAEXK+cM
 BpDpdZn39yqFvRhSrjJoYRt/Vdhg/v04ZdZADJhcwt7HeowcIH4DrgesfUxaPeTjBgBd
 WKZi2o10FejhIdxuj3JqHngUIvIQZJP0E5d8lB8a7GxVwmks1zpc0KHyhWjNSW2mv/ms
 6kL0e0CyaxXqlw4IsF3FZ94yk6/fSz90dfrAKfniZuaXZmg9GyNNGN9nF3+m6g7OeMDy
 82rE8QAqDiU42+4zDPdJzWkLbRVluY5QSRZUxgv8mv7FJNDXomz5FYlQdUY3HDKOr4oR
 06Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yGJp2Y+fJ3YAg7LLm6TZ3oh5wYJ+U09wJ/5LZ99Ogfs=;
 b=gxkKbGpMQ7KzauJiEPyzXcMq+XoRHzhEosklkXJkHiA/p1FdYruHXOkYZ2DKJguE4c
 oV2TXj4fnTpNjxsmChOYLRgH6qPd+Os+zHGLpIZlruv/iKU9tYDjWFvWubXyeqqKs++c
 313/tSJ/FHCoUA4w01vUIbr8nW1fvkf8f9MTHc6DAv3b8rJ9n7cyXYkpi2jJXKkSbNy9
 U2uIO+2tamA5tFgNzWMpJCmaXfGKVjcAkrTJpOfcTlyGEY30Usi6E6rUm0MJEinqgf94
 JFBzko8lR4CHajgjCfFx9+o/DpXM4wduB7THlZV8sdprEACJReYP2ieSKdxI44U9lBv0
 SyUA==
X-Gm-Message-State: AOAM533rnntlKDeW2E4nal5qZ7nd2jL//DYYhbKOgLiJvmmXCrO4Em2j
 SiehsB3WIX+4d9R49mDu4S/VZA==
X-Google-Smtp-Source: ABdhPJxr/YxP+9ozfUtDal9aSnc1/usabaxSFAMXgMCoQiVkfdivN9580TQjX/+ScSMnkcXD6DYHYg==
X-Received: by 2002:a17:906:748a:: with SMTP id
 e10mr1697806ejl.107.1644671356189; 
 Sat, 12 Feb 2022 05:09:16 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w23sm10739656edt.88.2022.02.12.05.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:09:15 -0800 (PST)
Message-ID: <3537c4f9-b868-977e-12a1-c6d464aef044@mind.be>
Date: Sat, 12 Feb 2022 14:09:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org, Peter Korsgaard <peter@korsgaard.com>
References: <20220131024451.2580165-1-ricardo.martincoski@gmail.com>
 <20220131024451.2580165-2-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131024451.2580165-2-ricardo.martincoski@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/thermald: bump to 2.4.8
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



On 31/01/2022 03:44, Ricardo Martincoski wrote:
> Two source files had their header updated to correctly state the licence
> is GPL-2.0+, not GPL-2.0. There is no real licensing change to the
> project in this bump.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> It is a bugfix release, so it is only for master:

  No, it's a bugfix release, so it should be backported to stable...

> 
> Release 2.4.8
> -Fix Ideapad thermal shutdown issue #328
> 
> Release 2.4.7
> - Fix AC/DC power limit issue in some HP TigerLake systems
> - Regression fix for RAPL MSR usage in xml config file
> - Added Japer Lake and Alder Lake CPU models
> - Debug scripts for log collection to upload

  Peter does backporting by going through the commit messages and deciding based 
on them whether it's for backport or not. Therefore, it's better to put this 
above the --- line.


  Applied to master, thanks.

  Regards,
  Arnout

> ---
> test-pkg config 1:
> BR2_PACKAGE_THERMALD=y
> BR2_INIT_SYSTEMD=y
> https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/459263710
> 
> test-pkg config 2:
> BR2_PACKAGE_THERMALD=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/459264537
> ---
>   package/thermald/thermald.hash | 2 +-
>   package/thermald/thermald.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
> index 0a37f0e413..3a7c0f6952 100644
> --- a/package/thermald/thermald.hash
> +++ b/package/thermald/thermald.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  80c92902a89b72a9df85c51a8b5fc472cc01b4410600ef1f56d62c4ac23890c1  thermald-2.4.6.tar.gz
> +sha256  3e5a5033339c021de41ed4f946dd39e13f79f722fb5bd98d798e83658184c39b  thermald-2.4.8.tar.gz
>   sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
> diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
> index 9b303104e3..4e43277128 100644
> --- a/package/thermald/thermald.mk
> +++ b/package/thermald/thermald.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -THERMALD_VERSION = 2.4.6
> +THERMALD_VERSION = 2.4.8
>   THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
>   # fetched from Github, with no configure script
>   THERMALD_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
