Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8B9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4BCF40283;
	Sun, 27 Mar 2022 16:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hmwKAQKX44I; Sun, 27 Mar 2022 16:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17E0E401ED;
	Sun, 27 Mar 2022 16:28:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D07F41BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEEE8818EC
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6SMGNPxJ8Ij for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:28:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A926818CD
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:28:15 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b15so14431081edn.4
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H39X6zT/8JQPqZzjqWT/ChWuisSKcEWruvqS6WQg1Jg=;
 b=bbRxrnbxNMMOo6rwJ5FlnlTLOZGwkzLv6alLzFl5tuz1LkVaIuPeHFQTo62083YVzP
 xLrlCSnVPEDQsBKKKfitRcW9JINXgqD6yN7GzDXN7ntczI6WdBUHuUHb62J31CI5YJnf
 eyVQ1MnRG8RrLAWTt+GAkZcWq1VpUYK7okrLREnp698fHXZ8yC9zb+86UawCdaxMiq8E
 dkseub+RaVQc4AZIH2W+ZCbsTEgMkviTLdZqjcGkBAmuzdXz5Jxp9T4nF4aes/Gcte7g
 z6nQEwFc6keQa6DKWzac6icMgj/ZtH5GgVSg4l5Q+26whVeudkdt7KJvvBW3ey4rHv3g
 TutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H39X6zT/8JQPqZzjqWT/ChWuisSKcEWruvqS6WQg1Jg=;
 b=q+V4kuojQwzchwUrfSLYP4TfuBajAz4x9dBQVq31G0xxHbZdNEpjWoQ75JGaNBFfEe
 bO9qLzwzosVaL2t8KuQs/0QLV5fCUPwtfU/UlWNQNWeRuZBzvftIqvHHvn7EyL5r78Gb
 1m35bqAgq6li+ZSpu3GWrTIhTjSUkVHBhXptWmzQCTSU1ggb++CdgjkPQYWziXAMpOp0
 /Twv7h84XHV7EPR479qf0wT09Gt20YTvns4iNScxdJ9NwoTyMw6+zxH0r4kshojNksz7
 z6I5vlW82J4qwmsVCXdXARaoJUIMKpa/K+qKHhYDldaHbY50kVK0FRdEu7Jx38+1xruO
 hRjg==
X-Gm-Message-State: AOAM5318YWIgXJqJeLTbJloAlydOjeuTDJ6GVNCoKbCStR5HmCWTj0WV
 mEXZIR5b8xj0fsgbs++0mbNpxg==
X-Google-Smtp-Source: ABdhPJxfESrNRAk/mUInuePSE6Crz9ecZyWP7IHE/fbrqn0MNy4NLJBimBFTB5aeVKvX32kFz9RhZw==
X-Received: by 2002:a05:6402:1111:b0:416:2ac8:b98e with SMTP id
 u17-20020a056402111100b004162ac8b98emr11095222edv.236.1648398493587; 
 Sun, 27 Mar 2022 09:28:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 eq7-20020a056402298700b00419d8d46a8asm790143edb.39.2022.03.27.09.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:28:13 -0700 (PDT)
Message-ID: <0463edce-bf9b-ecd1-2f6d-cc728a64409d@mind.be>
Date: Sun, 27 Mar 2022 18:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220324071817.1270488-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220324071817.1270488-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-txaio: bump to version
 22.2.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2022 08:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-txaio/python-txaio.hash | 4 ++--
>   package/python-txaio/python-txaio.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
> index 5e05f02d3a..f06c14b21f 100644
> --- a/package/python-txaio/python-txaio.hash
> +++ b/package/python-txaio/python-txaio.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/txaio/json
> -md5  7e80b80ed7797245a5eef803043bdede  txaio-21.2.1.tar.gz
> -sha256  7d6f89745680233f1c4db9ddb748df5e88d2a7a37962be174c0fd04c8dba1dc8  txaio-21.2.1.tar.gz
> +md5  9b692af4c4fce73cadd36374c138936b  txaio-22.2.1.tar.gz
> +sha256  2e4582b70f04b2345908254684a984206c0d9b50e3074a24a4c55aba21d24d01  txaio-22.2.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
> diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
> index 750d9e3d3d..1a8a888963 100644
> --- a/package/python-txaio/python-txaio.mk
> +++ b/package/python-txaio/python-txaio.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TXAIO_VERSION = 21.2.1
> +PYTHON_TXAIO_VERSION = 22.2.1
>   PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
> -PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/c5/39/2e715062283f8443d8ceeea32276db71741664d78d43c3edd3675498e926
> +PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/6d/4b/28313388dfb2bdedb71b35b900459c56ba08ccb7ad2885487df037808c06
>   PYTHON_TXAIO_LICENSE = MIT
>   PYTHON_TXAIO_LICENSE_FILES = LICENSE
>   PYTHON_TXAIO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
