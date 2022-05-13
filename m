Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2653C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E11360ADB;
	Fri, 13 May 2022 22:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TU441dT1A2Qj; Fri, 13 May 2022 22:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B25360B27;
	Fri, 13 May 2022 22:11:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA5611BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F984161B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUGAW3GoutfZ for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3844F40980
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:10 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id n10so18694170ejk.5
 for <buildroot@buildroot.org>; Fri, 13 May 2022 15:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qfy3YPEm2Bdi9b+8plyNr9QDXaglN081Lk1eG/D3Am0=;
 b=UDz1rLA5cXoQAxyRM3A6Sf8z0f7s46KbGCMBC46+WYhr6dCuqz122deQ+3s3M7jEwS
 TBZ2X8F7+BPkkwVBecsrwDx1GAtRlUcxShkkgo4lGP8nKIZFcm75veIOanf7qav6ro2D
 qGtzvEZRz2kxYLlOVB6PiCeqZFoihm31Yn3fDFn87V08c5lh4NDu+Dah11kaAK1aNvhe
 u5RdXcjCsWOthxGwU4dqX6LO8RFQvJ7QLwReqekzN3zo5m7lO+iMHLfHeAHaB72meq2s
 oO63a0rELcjQTKhsWHI7NHc9CAr8zOvtqwxvyNputD6L8/lFi1I7G74fRIVSMaRfCT+R
 /luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qfy3YPEm2Bdi9b+8plyNr9QDXaglN081Lk1eG/D3Am0=;
 b=FYrwNTYgCkgUrLMbplgYPg1s/Fm2E+sETZVaFcFWpRM5dap+GOb8lLiydw8fThW5lu
 uMJo2BIn14FPKPqdqdYCd+yya4cEHWTBdsFI/8lwVaHciq904XjaDKRQRILhBOWffg0V
 M5ze7A4Q0OBYNQfMcKq2gEzkypFCkpP4PF+xisqNXxJ6XAtTkFaQeFVB2GmyXcFlCZMl
 C2u+bPYYBMO99FFaC8mQidtIjNYzGpCE1wPCnFnyUnb/lrDzkDTqcFsMGMU+jeRKWUQu
 ewBBam1QLXKHDkGiKx+Z5I6vkCfYwK7jYiDI0ExCT+U/itO9MLR11E08yWK7XgF1frdN
 aLDQ==
X-Gm-Message-State: AOAM531itONSRA3pJEJEY6MlXmhqmdwIOGy/+DNmYpSJmJnZ/+209Mp4
 h4tK6BeNwHhqVK/C9aDW0nzAOYls4dAobg==
X-Google-Smtp-Source: ABdhPJzZW0hM59ndvO+kdXhfVqTxXPWjs4KYgaL+BBeoYKYYi6QhEFBkmtggavaRx/7ZdZ14dOjwnw==
X-Received: by 2002:a17:906:c10:b0:6f4:6c70:b00f with SMTP id
 s16-20020a1709060c1000b006f46c70b00fmr6169790ejf.660.1652479868479; 
 Fri, 13 May 2022 15:11:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a50f18b000000b0042a2d27619fsm1398850edl.26.2022.05.13.15.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 15:11:07 -0700 (PDT)
Message-ID: <53a2e308-7c82-4e41-f1d5-cfa1ed050550@mind.be>
Date: Sat, 14 May 2022 00:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220508232349.1336571-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220508232349.1336571-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version
 5.4.3
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



On 09/05/2022 01:23, James Hilliard wrote:
> Set CBOR2_BUILD_C_EXTENSION=1 to ensure c extensions are always built.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-cbor2/python-cbor2.hash | 4 ++--
>   package/python-cbor2/python-cbor2.mk   | 5 +++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
> index 8858fc72d3..6098273aa1 100644
> --- a/package/python-cbor2/python-cbor2.hash
> +++ b/package/python-cbor2/python-cbor2.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/cbor2/json
> -md5  a9518fd435d9eafd91063b3bf10d5c5b  cbor2-5.4.2.post1.tar.gz
> -sha256  9cf21d59604b9529d7877c8e0342a2ebaae1a07fe8ff5683dc75fec15847c797  cbor2-5.4.2.post1.tar.gz
> +md5  358b18e2a96ab96945e33417d5c8cb31  cbor2-5.4.3.tar.gz
> +sha256  62b863c5ee6ced4032afe948f3c1484f375550995d3b8498145237fe28e546c2  cbor2-5.4.3.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
> diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
> index dd007217d1..743ae4ef6f 100644
> --- a/package/python-cbor2/python-cbor2.mk
> +++ b/package/python-cbor2/python-cbor2.mk
> @@ -4,12 +4,13 @@
>   #
>   ################################################################################
>   
> -PYTHON_CBOR2_VERSION = 5.4.2.post1
> +PYTHON_CBOR2_VERSION = 5.4.3
>   PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
> -PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/49/74/2b9f9b76e2831f54d70e177a4e602e72cb86441632d1bcc15be1f04a73f6
> +PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/9d/c9/cfa5c35a62642a19c14bf9a12dfbf0ee134466be1f062df2258a2ec2f2f7
>   PYTHON_CBOR2_SETUP_TYPE = setuptools
>   PYTHON_CBOR2_LICENSE = MIT
>   PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
>   PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
> +PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
