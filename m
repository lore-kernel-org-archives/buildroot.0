Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCABBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94C1C82796;
	Tue,  4 Jan 2022 17:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id at0E5rFRWjVf; Tue,  4 Jan 2022 17:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA20682784;
	Tue,  4 Jan 2022 17:14:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5946B1BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 480828267C
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8MW8wehQqml for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:14:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5920C81412
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:14:19 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o6so151158218edc.4
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fFFsXUILnmxxxz7Rtkd5GhpX9pfg9SBqFOndf1Gbe4o=;
 b=h5jRC1GU5JuFB8rhwbDI8Vch4cwqm+nziLfAO8QkygJqBDAS92umbUgF/rnWseZC32
 V+vdtiyxbY/sC63Lh2JeiP3AOuE3i2MlOAuDn64QIPsp63TKgvRjzu0v+5n2x6q6Bidm
 nsuWj/cfs8v9LGGhEPnXZaRxn9v9fxjZUhWqd5aMBZlxxsTjnb448mIUkLAZFg1hst0O
 IzQB50X5UDbZzaU1yDRfKGg06B1MOUqwmnlZSJ4WAmS6xh7yLEEtsNc0WgDxrs+wOCqp
 okQotK0BYkzeb+EY/ep4eMEgihC8Adcwo8KwuB87oyennA76zdu+wrDfOuaSeHjIghA/
 Y/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fFFsXUILnmxxxz7Rtkd5GhpX9pfg9SBqFOndf1Gbe4o=;
 b=ubOB31v+Jw2ZArf9N3hmY3xNLzLLwcqyXRBdnAtqzjDEwPoZlNTrhFPAZEG/HsILUN
 w1H8jPTSfZk1DaL+Sw7BCRZgUBDl9qcGdPlPpMh9Hj+yxABoDofCeOWAhP0q73n+G+Po
 u23oYpTJ0eEsO+LwQKgDBd1FXqbzC/HYV/RU7n5bbl9n/sOIhiqee0YM0gCo+k+JkEpj
 zmG0Rp4cFBpBFVba4CbZvqMFl88k82tNmOkviOAFRCm7wmVsvsrATbw5Mhv2d7R/UB82
 GGsG76TgTL61T/ORP6S2a2IOXX+KvMytglziKO3dq6YUlnqwPP4YFALyUdPuLy6hUIZm
 02eA==
X-Gm-Message-State: AOAM5317PCfuur92SAXNKe318Y/G2cn2+AjuKTdhKCiVbRV2/divcFZJ
 aSz/cOKU9EEK9qfGJilG5ckEcA==
X-Google-Smtp-Source: ABdhPJz5HolZgz7uZRALuBf/asqhrGa/+L7VRd9lNopvnFQX6nz3UDhubwoQAjADTdTo22S55xnWCA==
X-Received: by 2002:a50:ff10:: with SMTP id a16mr48800482edu.275.1641316457650; 
 Tue, 04 Jan 2022 09:14:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g9sm6824278ejo.222.2022.01.04.09.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:14:17 -0800 (PST)
Message-ID: <37a88641-b1b7-fc77-8f97-83492e9875e3@mind.be>
Date: Tue, 4 Jan 2022 18:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220101213346.408623-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101213346.408623-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version
 5.4.2
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



On 01/01/2022 22:33, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-cbor2/python-cbor2.hash | 4 ++--
>   package/python-cbor2/python-cbor2.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
> index 879463c2ce..9910e632a2 100644
> --- a/package/python-cbor2/python-cbor2.hash
> +++ b/package/python-cbor2/python-cbor2.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/cbor2/json
> -md5  87b3ad8a9dd8875fa46c6ec06e3fb0ba  cbor2-5.4.1.tar.gz
> -sha256  a8bf432f6cb595f50aeb8fed2a4aa3b3f7caa7f135fb57e4378eaa39242feac9  cbor2-5.4.1.tar.gz
> +md5  b3a6085ee1a9e11ddec305f7a7bc5956  cbor2-5.4.2.tar.gz
> +sha256  e283e70b55a049ff364cc5e648fde587e4d9b0e87e4b2664c69e639135e6b3b8  cbor2-5.4.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
> diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
> index af42d0344a..4cc09a219f 100644
> --- a/package/python-cbor2/python-cbor2.mk
> +++ b/package/python-cbor2/python-cbor2.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_CBOR2_VERSION = 5.4.1
> +PYTHON_CBOR2_VERSION = 5.4.2
>   PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
> -PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/9e/25/9dd432c051010faea6a702cb85d0b53dc9d5414513866b6a73b3ac954092
> +PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d4/ca/b96be94f694155ce58823c38cf8fd1aa620bdc91e2c801713cdb4167b6aa
>   PYTHON_CBOR2_SETUP_TYPE = setuptools
>   PYTHON_CBOR2_LICENSE = MIT
>   PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
