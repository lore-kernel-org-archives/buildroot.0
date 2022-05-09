Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D07C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 22:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03700408D4;
	Mon,  9 May 2022 22:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULqdJaXEvPwd; Mon,  9 May 2022 22:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0FAE408BB;
	Mon,  9 May 2022 22:14:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9C8B1BF36B
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 22:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B201D408BB
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 22:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a17P21CTjI8u for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 22:14:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A47F5408B6
 for <buildroot@buildroot.org>; Mon,  9 May 2022 22:14:26 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e5e433d66dso16302880fac.5
 for <buildroot@buildroot.org>; Mon, 09 May 2022 15:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UXcTm+5vtE3dH3oi6DeIM8bAIICmbZqLjLs9Nyuie3I=;
 b=gBNGKhe1t+GixXmdugtUt4t2WvgkkAhYmLKSI6oK9G/BXSp+Y8vouKTMnbahNeMzzZ
 FNfHsgpsqnYe2OATSa8DzJH7MfTQZVNWuWedHjCLfYC+cgT+35PxOvpzt5qqnzicqpyv
 XxHnvuzP31hB/fTcub5wwOQPZYu17HRexWQJU6OfklqJOaqbeUSTu3qXO4u27HKxY0kC
 aK/fyymtVdtKud+PhVoDzShbpXEPFh3+DJQYkjWUpO/ezuEwarxJXiqmJz/xqyiQidqn
 4wEpNIX1hcQVVuPx+wv6Peguvomagg2RsiKwG/V1jxumXKiqrHeVDy9HpQYUAOBUUc8k
 JisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UXcTm+5vtE3dH3oi6DeIM8bAIICmbZqLjLs9Nyuie3I=;
 b=sgv6zem6iYbfvUOIIxBVSwIX8bVlnid8tp36dLbXmrj/khUvS/caCLMmy02QLObh0y
 ZFebFzBYdFjQtOr8lyeDtvjUFyiT6ebKAVzC1gOv/WI4Wt0RlN208i7bmzqACZ7ZjOqu
 QfAT7U0FgsCGtjnLTHldI156P3r7HGzr1dFtUIdD4r8+ONba+cREEzgGZ6TZxCvYmKRi
 AFjTKKOO+k49g5uzx32H5bAXD2eylLXxzude9KHd3zjDrZ3X7UnWOXiCtbCaphdoFpjf
 AppTR7kLnnG87p9nAZ5pYk7N6W/StDuMawXb2w7geQ3t4zmpbC6Bs8hvbBi48lsXQxNT
 9+rQ==
X-Gm-Message-State: AOAM533hNIETwtCM6io/psfM8MCUlcompfcGfzViyVQTQtVeavKhKcye
 dDgMm7d79cMi8C+9gWQic/hypJ1Kx949cGwcq/o=
X-Google-Smtp-Source: ABdhPJzF9yBoLex5ctUD2L3Pq6G6dUOMxPC+yE2Ub4aX8wGvlUMCjiA5TjuLXK+V8r1irv7nHVRLHsIsFOJv3HceUq4=
X-Received: by 2002:a05:6870:9729:b0:ec:6f64:1e5e with SMTP id
 n41-20020a056870972900b000ec6f641e5emr8467672oaq.99.1652134465646; Mon, 09
 May 2022 15:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220509190650.1348657-1-gsmecher@threespeedlogic.com>
In-Reply-To: <20220509190650.1348657-1-gsmecher@threespeedlogic.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 9 May 2022 16:14:14 -0600
Message-ID: <CADvTj4r7tz9jEQv+6nkTkj=h9xP8fuvWnE0QZ1my6pNOZcaeMA@mail.gmail.com>
To: Graeme Smecher <gsmecher@threespeedlogic.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-orjson: bump version to
 3.6.8.
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, May 9, 2022 at 1:07 PM Graeme Smecher
<gsmecher@threespeedlogic.com> wrote:
>
> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> ---
>  package/python-orjson/python-orjson.hash | 2 +-
>  package/python-orjson/python-orjson.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
> index 5ef2726d82..2c00164702 100644
> --- a/package/python-orjson/python-orjson.hash
> +++ b/package/python-orjson/python-orjson.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  python-orjson-3.6.7.tar.gz
> +sha256  2b0259ff26455c4f9ad2290b49ba184a35e98eea4839f0d6d5c2b7d91383b3d9  python-orjson-3.6.8.tar.gz
>  sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
>  sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
> index 5de4b2c5fa..cfcaedc280 100644
> --- a/package/python-orjson/python-orjson.mk
> +++ b/package/python-orjson/python-orjson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -PYTHON_ORJSON_VERSION = 3.6.7
> +PYTHON_ORJSON_VERSION = 3.6.8
>  PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))

This package should be using the python package infrastructure instead of cargo,
I went ahead and converted it here:
https://patchwork.ozlabs.org/project/buildroot/patch/20220509221055.335263-2-james.hilliard1@gmail.com/

I just needed to add the maturin pep517 backend here:
https://patchwork.ozlabs.org/project/buildroot/patch/20220509221055.335263-1-james.hilliard1@gmail.com/

>  PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
>  PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> --
> 2.35.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
