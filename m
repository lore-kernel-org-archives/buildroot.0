Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9CEC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BA8182A26;
	Mon,  4 Apr 2022 18:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6HKaTR6WhMD; Mon,  4 Apr 2022 18:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F29828B3;
	Mon,  4 Apr 2022 18:12:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 448E71BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41C8860C16
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVVtavH-0Hrj for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:12:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 108BD60BF6
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:12:52 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id d7so211867edn.11
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g/sx4CrE+iwLht+FPYBQQ9CIg8kSrnAqfrejGbh4DKE=;
 b=AbojLRXTmR2su7bapqT7EDM4MC1RRAQ9EFGXVPU68GrRbIRf6sxDYV9RJq7cxYJWki
 lTFuz+hKUirCe00am91huj+aj+NOMFF5Bl7k6FrBH/UizcjDi9LaGdSRWgFpd6V5OYcq
 dy3y4ErVOBkX/kXg1ZDaZTDm9i4V0FI3zVejnrdzte/7N9crHp9ZC17uyA1bdIqIHSja
 3K8yy+i5QBVYGcIjybZCBaEbAaUIT/mkz7F8x9CJoUBz3B7cjYyA2pI9kiL8pp9DEVwW
 VuYH2Ch34VvZjNOI4QbrI9OeabOF/QIGI42kP3netMpGAa6ZQxW2L3RTVX9BWuOMamXu
 FfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g/sx4CrE+iwLht+FPYBQQ9CIg8kSrnAqfrejGbh4DKE=;
 b=LglhfxmKKLE+Qk6H4tuVIi7QXTFOGdlwSTS5GMEqpjJkt9gDcNMMysy4wcnrej12NV
 qjkY9xi2xtS9sMwtU+CyOS07Wqvm+9Q6aIzMSNJcAwZKXDreE8DrPVXKrkwrUlbALm+g
 /wahKmMtMidapnomd0eRkFq8OVE//kXyN+aPS00jGP5a0HyxjsR6oMIsCp3XNp2oEulg
 NyOj6p8hp8EAMd/ozhkhrhZiNKKnrEXueoyhLNhUGYoIbjypKaI1f0DQR+uG76u88DAY
 Pua3K+x4blNwta6T2ALNLDC0qgi7j1+nggF0Pag82F9rJwqJOxrVGkglaMeTQMhJqA7w
 Ga7g==
X-Gm-Message-State: AOAM530eb16G9RE4+mJuf4FRoMNEkbZbhhcKPYQzW6qRmLwgCnt8jkCB
 e/b2Suz8QkZQO/9nyk1jbMgTGw==
X-Google-Smtp-Source: ABdhPJwE39tAX68InGKoYxy6jKAA+JhxW3KCCpwM2oXehGJz3wFOQTxTjtMX1th4//GpDHYF3IMK5w==
X-Received: by 2002:a05:6402:1112:b0:413:3d99:f2d7 with SMTP id
 u18-20020a056402111200b004133d99f2d7mr1471554edv.23.1649095971246; 
 Mon, 04 Apr 2022 11:12:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a170906550100b006e116636338sm4675571ejp.2.2022.04.04.11.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:12:50 -0700 (PDT)
Message-ID: <c9c545d4-83bf-97cf-577d-a26029f65ebb@mind.be>
Date: Mon, 4 Apr 2022 20:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220401210055.946614-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220401210055.946614-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/liblinear: bump to version 2.44
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/04/2022 23:00, Fabrice Fontaine wrote:
> - Update hash of COPYRIGHT (date updated:
>    https://github.com/cjlin1/liblinear/commit/3d2fdc801ce45f470b1b5ed1945cb63126358485)
> - Update LIBLINEAR_INSTALL_SHARED due to
>    https://github.com/cjlin1/liblinear/commit/42f423c023e45879c8750b468e0afe74931afe3f
> - Some minor bugs are fixed:
>    https://github.com/cjlin1/liblinear/compare/v243...v244
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/liblinear/liblinear.hash | 4 ++--
>   package/liblinear/liblinear.mk   | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
> index a714b8bc4e..27aa4e3e87 100644
> --- a/package/liblinear/liblinear.hash
> +++ b/package/liblinear/liblinear.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  02bad43d745e2796f39a08ac9d117770e71939ef06b1ee7afc6ab7909e304807  liblinear-2.43.tar.gz
> -sha256  c5c91211a0edaa4c77e352f6b27a8f9c6768afe27d48176d6094905c534eacb3  COPYRIGHT
> +sha256  45572b99d4eeffc3e8ad7b72c27370be867edf3523c396d8b278a2c873bfbb5c  liblinear-2.44.tar.gz
> +sha256  d49b7898fd9ea7c29f0478e8c409ee7c0f621533d5eca7b7912e80391dc564e3  COPYRIGHT
> diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
> index 1ad734c756..c100ccc6c5 100644
> --- a/package/liblinear/liblinear.mk
> +++ b/package/liblinear/liblinear.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBLINEAR_VERSION = 2.43
> +LIBLINEAR_VERSION = 2.44
>   LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
>   LIBLINEAR_LICENSE = BSD-3-Clause
>   LIBLINEAR_LICENSE_FILES = COPYRIGHT
> @@ -14,8 +14,8 @@ LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
>   ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>   # $1: destination directory
>   define LIBLINEAR_INSTALL_SHARED
> -	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.4 $(1)/usr/lib/liblinear.so.4
> -	ln -sf liblinear.so.4 $(1)/usr/lib/liblinear.so
> +	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.5 $(1)/usr/lib/liblinear.so.5
> +	ln -sf liblinear.so.5 $(1)/usr/lib/liblinear.so
>   endef
>   LIBLINEAR_CFLAGS += -fPIC
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
