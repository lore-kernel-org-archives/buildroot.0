Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25B4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9005182C7C;
	Wed, 27 Apr 2022 17:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vxqjaUXf26bD; Wed, 27 Apr 2022 17:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82B4E82B21;
	Wed, 27 Apr 2022 17:15:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A817E1BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4C05403FF
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ha9BmqojI_-B for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:15:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5321B4017B
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:15:23 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id y3so4687730ejo.12
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yyfEGQTbHbWaeAuw9tmaqhgCZ6x3x+8TY2AFVs+3Rtk=;
 b=Kf3lx19RBCNhvXa++KQbXrEP4lZhOMSdFAHZr2SVtXYL1Kx288en+8Ijsk2nVG4VGH
 /biHFhTBT3u/k/sMWaKS4RboMnSpG3U6oIxGYYDKFvPUYgd1rbzPR/gUjxDAHLtP6eR6
 duQleG4DDouvYLaDHwH6adBu0jhH5b5j2FyHUpzWdu+IgggQ6FCXAG90PBCb19QlZLKA
 7HfbupVm6wHfNdA50kV1gb11bEts2ZdD1AqRvj1lVOzH2asTtnbYOs5CpPA9KpXtan6X
 5w5ecusFuLr2meKOwxLNlFCxKM6Bovo1vmZ2CErXZ4KuKkk6g7QsPfRG21NYTYs254o+
 z/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yyfEGQTbHbWaeAuw9tmaqhgCZ6x3x+8TY2AFVs+3Rtk=;
 b=BADF3J9CL7e26AjfMHdVDrTV54j1YG0pHQp7A4O6bYqsD05LB8CHB59IRlXEk/gOi2
 FYvJHuZ1DFerjF25IIlmSCUAdiChJSvJhVHCZsuuztjBTskf5jWfkb9ZPZ9jg5jlyb96
 qRaXU8baMuXrpz2I3J4pLOVDx7r+uwI68pFi92X915R8iS7R2LbXgeXvoEFker2iN7gz
 4Sl440M8dzhU82Co4OGNdFWfvBK01wilYY0NfvA1SN+61LUki/YtiSsW/3bWmbj/IkP9
 gyf2z1kUXmZngcA6kU8sjHj7kQyrBj/g+ke73mJa5r+XidKXoYdasUaAW3BCN6D1MjXf
 y+eA==
X-Gm-Message-State: AOAM532XB4uAhbCiODWQ4g01H2a5qdiY/a9ohjrmLNxbujsLBoFK23Qh
 5Hpc2KxvYhdivcLYG7X0PxytUQ==
X-Google-Smtp-Source: ABdhPJx1ZLrUll4XUnZ+TZ82LoTIM2cfKo6efdNW1b14lsX2u1YriGzYoRxDeNvzI0349wSkstANTg==
X-Received: by 2002:a17:906:5793:b0:6f3:d546:1764 with SMTP id
 k19-20020a170906579300b006f3d5461764mr741690ejq.247.1651079721361; 
 Wed, 27 Apr 2022 10:15:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a170906944e00b006f38c33b6e3sm5189697ejx.68.2022.04.27.10.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:15:20 -0700 (PDT)
Message-ID: <a49af87d-50c8-ab0f-9189-0e41f40eca37@mind.be>
Date: Wed, 27 Apr 2022 19:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220425080503.769954-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425080503.769954-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to
 version 3.20.1
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
 Asaf Kahlon <asafka7@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/04/2022 10:05, Michael Nosthoff via buildroot wrote:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/protobuf/protobuf.hash               | 2 +-
>   package/protobuf/protobuf.mk                 | 2 +-
>   package/python-protobuf/python-protobuf.hash | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> index 60e64f54d4..f37b2dee40 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
>   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -sha256  645192532f28254152b51c01868efdf9b766b1dbe49c77cccd6efcdb2d7c7bc2  protobuf-cpp-3.19.1.tar.gz
> +sha256  dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9  protobuf-cpp-3.20.1.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 80764f0216..c4c33ba7da 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,7 +7,7 @@
>   # When bumping this package, make sure to also verify if the
>   # python-protobuf package still works and to update its hash,
>   # as they share the same version/site variables.
> -PROTOBUF_VERSION = 3.19.1
> +PROTOBUF_VERSION = 3.20.1
>   PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
>   PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
>   PROTOBUF_LICENSE = BSD-3-Clause
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> index 2bfef96676..ddfa48b491 100644
> --- a/package/python-protobuf/python-protobuf.hash
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  2286615a3ae3e24c3524d171b6728b77b72cd2f3aab905f6a8d3fcaf6209dd00  protobuf-python-3.19.1.tar.gz
> +sha256  d3449b4df32ca155f8cd71051db916b2bf74cc925760e269c0acf09b48ec1cb8  protobuf-python-3.20.1.tar.gz
>   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
