Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2712EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 21:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D183C82B8C;
	Mon, 25 Apr 2022 21:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRoc_F6FCQq6; Mon, 25 Apr 2022 21:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44A6C82B2F;
	Mon, 25 Apr 2022 21:37:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EEB21BF3A6
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED21A60E86
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKihAvoiXyvO for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 21:37:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1733360E85
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 21:37:51 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l7so32247623ejn.2
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rvgZnavy9sjNAvk0XyOv7iYL3yD81s54774iWe3F05g=;
 b=K7rUnXuN6U0e/BqFzY2RQzfXkpAjP9rbelledQqwyv2VABCvW8eLYA/koDg8QXiLWY
 de0gJgGVcgKlX3wBBbfFDNmOGJWsjARU1Cg9IXjrmhKj+9Rst8W8/mb3Dd3nIB4TdomM
 XYYJxessDs9TBIpEASR59Hz8mN7dbQxBEf155SmMtzm750E/a0PMF1idw7LLQygXj3pp
 fV83XNPl30tBjOC3qNKN+3yHsRYZ90sjbk8g7qTeSYY3vmbzWD7jwKTIL2BJBQLwoZr1
 F2Ll82mGZiPiF5Otjw8Lii8mIh5/4xHM40mmQKWLrN0Tpb7GBGYmbpLl1XK+xMrTRffT
 bgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rvgZnavy9sjNAvk0XyOv7iYL3yD81s54774iWe3F05g=;
 b=OAeCjyl2eUExjPHxxM4Zq7sfdys+O4NYP+ZjpyPMxkWX1jznSlzQQ7MAWalwhX+AR6
 jOXyjrNOm/eiVVGKXKj4VGgNRfybISKwGy1XeQzb6VIfEzawAUpfucUKAkJQa521ZeLz
 DkmOE0vlZPgY+hupWoVYrpq+w6geRJTqOdVOEtxMnBQVC5mpNBABtzq5N9U9lq7QSxHg
 XaD+dOfpYhN3UueeY9M1Wp29dyiG5MxRffz9ZVyuXD3vII5eNOJcFcZA3Zn4hZC5AOK4
 OxD2t5K7ARksQipb4qT6FQ0FYG2r9rin/1RlYEqiosyfXb8XRTa+sfbNw3MouWHcVAD7
 UJjQ==
X-Gm-Message-State: AOAM5305/OYkmjzB8gcJdbUrreg4sVcT8lQ++RJSUhLzR4I0WY08c7Wi
 3pibvsW6iLXYUFrffcxict3HoA==
X-Google-Smtp-Source: ABdhPJynk2eIZ+EKdtatp55Y90KZPQiwJXtUVQjX81BzocLFluA2lWigDxMod29QZYh5Xn3KvYmQwA==
X-Received: by 2002:a17:907:7f0f:b0:6f0:24b6:3f6d with SMTP id
 qf15-20020a1709077f0f00b006f024b63f6dmr18022253ejc.254.1650922670307; 
 Mon, 25 Apr 2022 14:37:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090666c700b006e8688d5fcbsm3985389ejp.135.2022.04.25.14.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:37:49 -0700 (PDT)
Message-ID: <f2289739-57a7-268c-ebc1-1ba41d8c2d41@mind.be>
Date: Mon, 25 Apr 2022 23:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
 <20220424213958.1747120-4-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424213958.1747120-4-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v7 4/5] package/python-tomli: bump to
 version 2.0.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2022 23:39, James Hilliard wrote:
> This package now requires flit and must use the flit-bootstrap setup
> type for the host build since it is a dependency of
> host-python-pypa-build.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>


  Applied to master, thanks.

  While testing this series, I noticed that the following gives an error (this 
was already the case in the original series; I haven't checked how it was before 
your series was applied - for tomli, it certainly wouldn't happen because it 
would still be using setuptools, but maybe for other flit packages, I don't know).

make python-tomli
make python-tomli-dirclean
make python-tomli
...
FileExistsError: File already exists: 
/home/arnout/src/buildroot/output/target/usr/lib/python3.10/site-packages/tomli/__init__.py

  Would be nice to get that fixed...

  Regards,
  Arnout

> ---
> Changes v6 -> v7:
>    - only use flit-boostrap for host-python-tomli
> ---
>   package/python-tomli/python-tomli.hash | 4 ++--
>   package/python-tomli/python-tomli.mk   | 7 ++++---
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
> index 1a274c8a40..8368f9ee13 100644
> --- a/package/python-tomli/python-tomli.hash
> +++ b/package/python-tomli/python-tomli.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/tomli/json
> -md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
> -sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
> +md5  d4341621d423a7ca6822e23d6d52bb9a  tomli-2.0.1.tar.gz
> +sha256  de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f  tomli-2.0.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
> diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
> index b8c20ca736..b803d67466 100644
> --- a/package/python-tomli/python-tomli.mk
> +++ b/package/python-tomli/python-tomli.mk
> @@ -4,12 +4,13 @@
>   #
>   ################################################################################
>   
> -PYTHON_TOMLI_VERSION = 1.2.0
> +PYTHON_TOMLI_VERSION = 2.0.1
>   PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
> -PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
> -PYTHON_TOMLI_SETUP_TYPE = distutils
> +PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3
>   PYTHON_TOMLI_LICENSE = MIT
>   PYTHON_TOMLI_LICENSE_FILES = LICENSE
> +PYTHON_TOMLI_SETUP_TYPE = flit
> +HOST_PYTHON_TOMLI_SETUP_TYPE = flit-bootstrap
>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
