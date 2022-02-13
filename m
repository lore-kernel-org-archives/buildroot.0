Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671A8C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2007C60A9C;
	Sun, 13 Feb 2022 11:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lW7UtCiLF7ox; Sun, 13 Feb 2022 11:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A3766058F;
	Sun, 13 Feb 2022 11:28:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C812D1BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2B2060A9C
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6s05m7AHSKG for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:28:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A32060087
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:28:24 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z21so1820636edb.13
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vnfdLdH++yInj4c5L4D3XgyVWb6pvKUKvsUen5Ep3GQ=;
 b=QzRKLREgS4W+XsjKi0lwnfazhV0z2GErBGRtxmMOpz0yUtYW6RUA5FXvD2sOObuOd3
 Z3kXFplK9pKB7PO9BXd9rqqA+fiOOZYl097N5mskpE88jJJiFmva1aZcr54w0vS89kKk
 UfLrt6b4d2xaTjEYOKKCO+Cf8B7M+lpvrBH5KTkAoP5tWaUZx2PnxvxWXr04aaSsyIeJ
 gSG0oXmhtDXfLCvQt6vWz8Vi/o+kc+Wp9Lu9PZUdK2Y/2Ok8AV4Fn7zHx2bn1kNvYXB1
 wrfoQoyvvP01ZVNu8jTLmXZivHScNM7u5n33ZG1yYU1qk1Xi9U6mUoLI/Z7PRSCjwEkz
 uJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vnfdLdH++yInj4c5L4D3XgyVWb6pvKUKvsUen5Ep3GQ=;
 b=NGMesclLoa8nW6pxBWesYM5Ghs8/kI1MD6jUgFKpyn30ur/Vu402a0BJoAde8y48h1
 ussrGbpfmD0lwwTtQITsxhQT+27vPU18fz0uje2/4xQKq6SLDXQFVqsSKsA2wyXyeYYJ
 zBAh8g9hirHV0tHT6Oz5EAg5hJgP+XvvOQNdri4q4l7RPUfSovz3sGXPDQXb9Wc5WALp
 xJwLPgEqcTUrG4FB067wRMKIDCiDFrAwNP5wJk6S0AVRkw81C1BXgY/muyDVWe3fcoMb
 5KpcukXHt1Z0YeCx3ZQLr5M8oCvMTDaVUj4cumwddFZtQRkf9fhccEfYeyfqBcRRJv1I
 EqXA==
X-Gm-Message-State: AOAM5301nI2QnXB3VawmjCzVJzhAZHWX93Aq4OjvnLIKrlQVkJNN8KpL
 f7iUId/89xXvEhZ7ycbEMdf6/w==
X-Google-Smtp-Source: ABdhPJxxPl4d+R+rDOamjIf+rlyIzosoGvK4fS6xu9RDt4sdmUqDu7Kp7miTYGlmL9q/19EZOg8baw==
X-Received: by 2002:a05:6402:5113:: with SMTP id
 m19mr10407106edd.325.1644751702740; 
 Sun, 13 Feb 2022 03:28:22 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f19sm9555803edr.96.2022.02.13.03.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 03:28:22 -0800 (PST)
Message-ID: <79f8e0b9-8979-44d3-c0ce-0d67c101c32d@mind.be>
Date: Sun, 13 Feb 2022 12:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220202040619.2197495-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220202040619.2197495-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python{3}-pycryptodomex: bump
 to version 3.14.0
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



On 02/02/2022 05:06, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master after dropping the python3 part, thanks.

  Regards,
  Arnout

> ---
>   package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
>   package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
>   package/python3-pycryptodomex/python3-pycryptodomex.mk | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
> index 9512f185a8..920cec2518 100644
> --- a/package/python-pycryptodomex/python-pycryptodomex.hash
> +++ b/package/python-pycryptodomex/python-pycryptodomex.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
> -md5  dcf0d13044c700410bdce31a5afdf6d0  pycryptodomex-3.13.0.tar.gz
> -sha256  63443230247837dd03c5d4028cae5cb2e6793a9ae110e321798bee48a04ff3e9  pycryptodomex-3.13.0.tar.gz
> +md5  18f571832bbfbf0f4516ccef009f2dfb  pycryptodomex-3.14.0.tar.gz
> +sha256  2d8bda8f949b79b78b293706aa7fc1e5c171c62661252bfdd5d12c70acd03282  pycryptodomex-3.14.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
>   sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
> diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
> index 92780327a1..7821052b43 100644
> --- a/package/python-pycryptodomex/python-pycryptodomex.mk
> +++ b/package/python-pycryptodomex/python-pycryptodomex.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   # Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
> -PYTHON_PYCRYPTODOMEX_VERSION = 3.13.0
> +PYTHON_PYCRYPTODOMEX_VERSION = 3.14.0
>   PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
> -PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/7a/21/f399ba8dfd6e40eee444151af3237af22788b8b16077c75ec0419125f619
> +PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/a6/b3/a5e59cd3ad65d4dc470a3a63381d0495885cf1ac7659c83c6bc9e9e79df6
>   PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
>   PYTHON_PYCRYPTODOMEX_LICENSE = \
>   	BSD-2-Clause, \
> diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
> index 06a46cdf63..35469df85a 100644
> --- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
> +++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   # Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
> -PYTHON3_PYCRYPTODOMEX_VERSION = 3.13.0
> +PYTHON3_PYCRYPTODOMEX_VERSION = 3.14.0
>   PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
> -PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/7a/21/f399ba8dfd6e40eee444151af3237af22788b8b16077c75ec0419125f619
> +PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/a6/b3/a5e59cd3ad65d4dc470a3a63381d0495885cf1ac7659c83c6bc9e9e79df6
>   PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
>   PYTHON3_PYCRYPTODOMEX_LICENSE = \
>   	BSD-2-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
