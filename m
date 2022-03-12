Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF14C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F212660E58;
	Sat, 12 Mar 2022 17:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESFBllfop3_L; Sat, 12 Mar 2022 17:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 208A560E52;
	Sat, 12 Mar 2022 17:00:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 141501BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0730403AA
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2WgQ3AhNka0 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:00:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 108694023D
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:00:39 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c25so12368032edj.13
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1eVELOGCR9mAG5VIcDrTtlNyQD3k0+zlmu7o0q34f2M=;
 b=SYiDAyKnW6xIBuLZDUwmyF9kHyK9qM2F70HcBby5+1VSW3C6u91RyDeg/fjV9rEx+S
 PAsGJ/r1GrMLsRg/SweSiaHsY2G662yqZWjhFz83BnSRT++wAwN+uGynKvNbZMFwnLmc
 DH11tiH+3n1TCmzxhVI7Zuw+tuNIYnxXp9ex4+jJ7TIUBzHUCrTkrjAsox2zA8L/HIr6
 rxDC3ARNCUIDkn4UZnZBAgRDFVJ//c79V9159JeQuJXe7FiNVhJqqZpdxjcWW9G2BB3o
 +mfRwx05bOZDbbzrfVLtNt54Ppc6bnBPV5WdfTPDcim4xLefQhDJCED7GhpD7NIj4vg5
 pJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1eVELOGCR9mAG5VIcDrTtlNyQD3k0+zlmu7o0q34f2M=;
 b=esu2KZFbYoSo11hgvE4KUXyK0Oex63q5LiRPXeFdHBDwNeLAO9cjeaViZZnD1RNKQw
 G0xyJHCymrKG7S6zZLQuNuItciMxxcqImJIgWz4dEckFNU4OX0leo7LEv/DwSgF+Ccxt
 xEA1OZFjVQEnYqnIakMBIxhgQizURk0YeOQRbGWRHe/A6cybKyfYG6cWT6kNd6cwPQsC
 XbKwItzBOcegUvKXcpjz+N0aCWZzVZ4v2sQTIEUIW+fiJxdQ+XUb8+DPQgpRpeQiqkBk
 Y7o7Ubk47WxLwTjSzCZDDZspGzcEgpln+Dp1ksr88z26coZr2oaLPZ1Oecgj1K6B+dKN
 YOGQ==
X-Gm-Message-State: AOAM530f1CNOCk/m/9ZOO5ynljhvIUJ7Hk5Amr/g5RjmVXlBmnPqm1mn
 c1wTzHdHFT0uOjAFTZWRONftzAtPwdo2FA==
X-Google-Smtp-Source: ABdhPJw/bD72swUg+ok06FytRXuNt7CVXiS7WuVBvfIPBjz9yx/RUMY13jzfiGg+PMIxb4beI8z1aw==
X-Received: by 2002:a05:6402:3490:b0:416:8b97:b1f7 with SMTP id
 v16-20020a056402349000b004168b97b1f7mr13349811edc.36.1647104438307; 
 Sat, 12 Mar 2022 09:00:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a17090664d700b006db59e6a243sm4596437ejn.53.2022.03.12.09.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:00:37 -0800 (PST)
Message-ID: <81d17b09-3922-0e8c-6acf-a36432dc382e@mind.be>
Date: Sat, 12 Mar 2022 18:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220221082724.2744765-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220221082724.2744765-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH/next] package/grpc: bump to version 1.44.0
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2022 09:27, Michael Nosthoff via buildroot wrote:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/grpc/grpc.hash | 2 +-
>   package/grpc/grpc.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
> index 3da1d9a323..6db2acd759 100644
> --- a/package/grpc/grpc.hash
> +++ b/package/grpc/grpc.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  9647220c699cea4dafa92ec0917c25c7812be51a18143af047e20f3fb05adddc  grpc-1.43.0.tar.gz
> +sha256  8c05641b9f91cbc92f51cc4a5b3a226788d7a63f20af4ca7aaca50d92cc94a0d  grpc-1.44.0.tar.gz
>   sha256  277adcc1dcef8359b1efb48e628635f88b40be8fbd64e82fd0169930d135d7a5  LICENSE
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index 5d8201f12f..23b92f1750 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GRPC_VERSION = 1.43.0
> +GRPC_VERSION = 1.44.0
>   GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
>   GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
>   GRPC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
