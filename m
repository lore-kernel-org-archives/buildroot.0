Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE9AC001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 19:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B6EA82F49;
	Wed, 26 Jul 2023 19:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B6EA82F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1buZG5ikCdvd; Wed, 26 Jul 2023 19:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE3F82FD5;
	Wed, 26 Jul 2023 19:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE3F82FD5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB9971BF421
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 19:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5526408C5
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 19:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5526408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKYpqRfq49AE for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 19:01:12 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 26 Jul 2023 19:01:12 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14A8C405DD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14A8C405DD
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 19:01:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([213.147.165.148]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3mz-1qIIoq40R1-00TSwj; Wed, 26
 Jul 2023 20:56:04 +0200
Message-ID: <d09dfc6f-dea1-c71a-7829-c5b6a5320a32@gmx.at>
Date: Wed, 26 Jul 2023 20:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
 <20230725173102.543874-3-sebastian.weyer@smile.fr>
Content-Language: en-US
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230725173102.543874-3-sebastian.weyer@smile.fr>
X-Provags-ID: V03:K1:yVVOT8eeseLI1Ggx2vDYiO40IeXkKfk8AM0rjn04mCObAoZVrkh
 EElB5rHLlPQP+1Hvm93FdsBBn4RV2+pWltddtyOBAwNKuYKZcPGtErSbfAfJgl3MyuJNiey
 AojnE6CDgbu2sUZ4HByirkfM7eVWiocdH9K8IKnaC1JiVfH/IIaR8Ov2yTUX7rpyfCRgkO7
 Kvnd2OXMDpTFwGeAFXbcw==
UI-OutboundReport: notjunk:1;M01:P0:0/hPTJGr6/0=;hieywXR48Lqtwo402pDc3LkF4GI
 UaYImKqyBBGhZX5yPG08BT4FfJpCtfO+WNAlvgBTW+ifOxhkD+OMbJkgtxPBNUJ8OzdcXpBhk
 nAnttgsJnpJI1tRM0ftJTJe3N9J6tmnjlY6hDWGnfjer4TZB37R3m8lco0vxNXDt0K3VoG6I4
 U/rhhdMVkCHHjLtoLmgkHCMQhWKEptjfZOJ0QzOAGALM3wph3Dt1TCatfbOdvZ3zTGkwtKTfh
 mXAOzUBnNyLCr7116vgATxTsrKA4KDADOL9H/ivoLpZGSrR0bq3XLffrZZwd3k1nYlCUI1UhM
 4zfxaCFr08BkHDVBfOFB7hRTGru5DEkl+ERqtQYJzgreeqGN0Maj9zH+1kPasIy4rVATsWQCg
 hjJ/zA1f859rLZflpEdTIQn0WR6FXjolBH/r/Tt46oGE1WlceUjC6XAYxf+A94mB5GCV/+L2X
 q6XyQh7WuItI+R2lx8CaR3AHxgZqXTKUvAYQbIsxw4Tq30ItRaoyww6uHMZ0asV2rQPniHD4C
 /C6PVObE4FzQOzIx2i2LulZ6aGNmmW3gbaI7r6cZ/Zkyu00UcvAP4al+mZ/P/mSaj5+rKBZmz
 hv7hKcqve8Jr1t3fXDnO+Ks6/g0FxgyCLFwF0t6I41HctpTYN4ZcXLMII1HdLusB1vkgJQBSZ
 ETEKvu30knpCff9eyxPHCdndF81/MtB16PVrhZRqG3IIzqWn8LdyR1rtGYofHIYjA6zYao3Oy
 0T55/04T1L4jJSmq2FMboCo7BrH3azIq3+56nlGi6ZCcIzJB6wDdFeqSbdBDfrRNXuAbGMDW3
 RDkCGNZvbP4sRnlzENiV+TP/ZDZNfGx927uupSHFAjtJ/HlPRuixhGMuMz5x1LcJt2HH/sjU5
 NEpvhopXdnMfOZMllYd2ZD3BOqcaJ8lKVvGzQoVo99cipAuET8aOwGACRdwsCF6MUTWlnJmWR
 +rx6bGyHeobEQlC4FDkV2biWGHQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1690398070; x=1691002870; i=dalang@gmx.at;
 bh=uhiSa1l51wErABgq/t7VQfjneVT3TVSUD6mpZCo+wbw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YGbREoW+iKahO3W1AoMKgQYhfgAwZ3QYTxPwQp3a6vA0RAcS5mSL3MSqN7yP1BMgl3dIZ0n
 JvjKNoAMhTRKXbmna24vlmOU0NxUg7P76zhPmScMGxLMrhc3bVxuRHcD4xUCOxfRVFjsaxTu8
 uZcsDv6eKg77SZHmIZpbwxey5OOKxIBYo67gAs8TNR/OwH/hhqlddw7FgTzzPzH2r9HiJg6vv
 yvqWsKIFwSU2U4MpDz8IznJiFdI+bQMU1UjV8++eX/JKbYKm2Ndeoa6L1VGr48gwju/Es4Ex1
 gfDR0iy0+yw0chh5xM+s/om8aTySmjJgCpcayP+Lu83yCvqhK8Aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=YGbREoW+
Subject: Re: [Buildroot] [PATCH v2 2/9] package/llvm-project/llvm: add llvm
 dump support
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 25.07.23 19:30, Sebastian Weyer wrote:
> From: Romain Naour <romain.naour@smile.fr>
>
> LLVM_ENABLE_DUMP required by mesa3d rusticl:
>
> https://docs.mesa3d.org/rusticl.html
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Acked-by: Daniel Lang <dalang@gmx.at>

> ---
>  package/llvm-project/llvm/Config.in | 6 ++++++
>  package/llvm-project/llvm/llvm.mk   | 7 +++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/package/llvm-project/llvm/Config.in b/package/llvm-project/llvm/Config.in
> index ebb0fca66a..4ee84b3bcc 100644
> --- a/package/llvm-project/llvm/Config.in
> +++ b/package/llvm-project/llvm/Config.in
> @@ -57,6 +57,12 @@ config BR2_PACKAGE_LLVM_BPF
>  	  Build BPF target. Select this option if you are going
>  	  to install bcc on the target.
>
> +config BR2_PACKAGE_LLVM_DUMP
> +	bool "enable dump"
> +	help
> +	  Build LLVM with dump functions even when assertions are
> +	  disabled.
> +
>  endif
>
>  comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
> diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
> index 556a2f8c35..6598d8b6c1 100644
> --- a/package/llvm-project/llvm/llvm.mk
> +++ b/package/llvm-project/llvm/llvm.mk
> @@ -228,6 +228,13 @@ HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=OFF
>  LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=OFF
>  endif
>
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=OFF
> +ifeq ($(BR2_PACKAGE_LLVM_DUMP),y)
> +LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=ON
> +else
> +LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=OFF
> +endif
> +
>  # Compiler-rt not in the source tree.
>  # llvm runtime libraries are not in the source tree.
>  # Polly is not in the source tree.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
