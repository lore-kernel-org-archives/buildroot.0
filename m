Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155F5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE2CD6134C;
	Wed, 23 Mar 2022 20:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7qaRMC92BB3q; Wed, 23 Mar 2022 20:26:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46AB60B68;
	Wed, 23 Mar 2022 20:26:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A31131BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9204860B68
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7W4q45-HgTi for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:26:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C35060AAA
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:26:34 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r23so3289950edb.0
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZLu+spJagatcLdC4fDi+W6xFyuTjd0cSuBtFY7u9Z84=;
 b=bjewMbzInwZbxib9Iuriz5EPzJbZxtZ7L6gkkM615yGZ3MWtjVhXwrJNygZEZpmdIa
 M5Xp38SAHbeekjMztVvjVylVpXVy47Bf3F3r6/gc9lRf+FdQsSoxmoCNDbtchY4w3/Mb
 H7itkUvYMqYU5JhTkRDTpBrSbRuhTdiR+anOkdBFod8IxveKmIqBz03iktoZulcfiJos
 161dFhJe/oMD32Jj0me2pJfR7LlC0gXAjVAy/rqAwJRTTyj4GakAy/tzvHkxbw32eJ/Q
 O5vkAZrWqfHk0N3hHyS1NQ8WvZ2psrCF6uiKYKGq6UR8quKlY+jqXY2MD4IWEiQ6grIB
 lWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZLu+spJagatcLdC4fDi+W6xFyuTjd0cSuBtFY7u9Z84=;
 b=3WvPQ3sLwQVPHGpOn6sryOMA7RArtjrdXUGENCuKokf28eSHDVRTv8WYFoZJDjNDUI
 shEXZFCw+Us/LI/0wV+qUWYjJNlJ1X9GAsEpaR7QKhf6AhlJgrxnrCNBP2RL7eDKm7Py
 a7GFw5yPHi8ihbzHb28HqT95+BFZln3gJqbro+VPlS8rkls7aVINRgOPLA5FZuyUjSok
 M6GTEIphud6KayFKZdCnCHIIYfQqS4PBoz00Th31TksWEhVJeOoEw2qcV5933Tx+j5Pg
 GeHxQlqm9BDSNcX8LSA7/XV+GzG8nId3vEUBkUGgdDsYSZqdws0UHgg7S9QdWxshv0Vr
 gYSA==
X-Gm-Message-State: AOAM533v7RI1PlFvm7eDOgRQb29QG7+x+8fz77phjRqwXRKnTkEjM4qu
 WrE5u+KB7RqD/TIzMrhufoqLTw==
X-Google-Smtp-Source: ABdhPJxjek60bHDlUPyPZpX72F6swGSpd6ibJN1g75MKhH22Q+KRZLQj3lmjwxg6+29XDK5shSKxrw==
X-Received: by 2002:a50:cc89:0:b0:400:8f82:99e8 with SMTP id
 q9-20020a50cc89000000b004008f8299e8mr2448527edi.7.1648067192824; 
 Wed, 23 Mar 2022 13:26:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ch26-20020a0564021bda00b00418f99695f0sm413134edb.23.2022.03.23.13.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:26:32 -0700 (PDT)
Message-ID: <89244aaa-9676-4dab-70ed-0be5e5ab5c8d@mind.be>
Date: Wed, 23 Mar 2022 21:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220313114741.1127825-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313114741.1127825-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-twisted: security bump
 to version 22.2.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2022 12:47, Fabrice Fontaine wrote:
> Fix CVE-2022-21716: Twisted is an event-based framework for internet
> applications, supporting Python 3.6+. Prior to 22.2.0, Twisted SSH
> client and server implement is able to accept an infinite amount of data
> for the peer's SSH version identifier. This ends up with a buffer using
> all the available memory. The attach is a simple as `nc -rv localhost 22
> < /dev/zero`. A patch is available in version 22.2.0. There are
> currently no known workarounds.
> 
> https://github.com/twisted/twisted/releases/tag/twisted-22.2.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-twisted/python-twisted.hash | 4 ++--
>   package/python-twisted/python-twisted.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
> index 8f0935e4f0..63da0125b8 100644
> --- a/package/python-twisted/python-twisted.hash
> +++ b/package/python-twisted/python-twisted.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/twisted/json
> -md5  c818cb1ab241dc249517442e5a0e0412  Twisted-22.1.0.tar.gz
> -sha256  b7971ec9805b0f80e1dcb1a3721d7bfad636d5f909de687430ce373979d67b61  Twisted-22.1.0.tar.gz
> +md5  fd252d0b895ca2ab81b5b1454073d890  Twisted-22.2.0.tar.gz
> +sha256  57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba500b4f2  Twisted-22.2.0.tar.gz
>   # Locally computed sha256
>   sha256  686f6426a775450eb3afd00bc3a5c2621f305ddb9c8478ee9bf28a368ef2dece  LICENSE
> diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
> index 8e867cfb58..e5d643ec05 100644
> --- a/package/python-twisted/python-twisted.mk
> +++ b/package/python-twisted/python-twisted.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TWISTED_VERSION = 22.1.0
> +PYTHON_TWISTED_VERSION = 22.2.0
>   PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
> -PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/77/b8/8108806ebf2b33654989fd1511281dc94a49fa7e03326d84fe5498ecfae4
> +PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/40/8b/56e8870d412c550b3ff2d6714ee212c7e80a6634f4e720c3a26a983e7b46
>   PYTHON_TWISTED_SETUP_TYPE = setuptools
>   PYTHON_TWISTED_LICENSE = MIT
>   PYTHON_TWISTED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
