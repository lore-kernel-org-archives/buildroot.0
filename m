Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7891BC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F848141B;
	Tue,  4 Jan 2022 17:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H7ZGbu7_za76; Tue,  4 Jan 2022 17:16:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 922D781403;
	Tue,  4 Jan 2022 17:16:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3311BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D23540190
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81GYx3LGRA_F for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:16:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 403634017B
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:16:52 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id f5so151172624edq.6
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=3ezgRcvNOxOmSxvL7msOM26jH2fGMsvLxUXpev1aJSc=;
 b=JdJSVmwmcDZhoiW6DU74i9/i9x97Nhw77W4KWqNZwZTtBqY5pQpYgo3gZnU1BbSIzx
 fOHhJa/ssT/1vfO8aoTalAogR/X/l8PJot9hyPV/yvwybaAbKOmlMh5Nm81E3eLBzRKE
 /11Q1CcOjWrvHa5sB5WY4FUx0T0N+J2Y599xOhvG8SsCd+VUIWP43xjdiInbAtjOyrYa
 21fI/wJ9dDb5nUlhV2rgQGPtfBS83OFXnwwDjqzM8mEnnz5CUJgbQuXgeAUFBHm8w3w/
 pMXoR5dsOdLiLrYnv6X/zbky9xO/cetfk6oYkw91ASOVol1f2vy/mJomfPNkRvJZD3eg
 leZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=3ezgRcvNOxOmSxvL7msOM26jH2fGMsvLxUXpev1aJSc=;
 b=0N11GE6XI8ZB34s9I3e7o9EAw1r5Qegwo3noZAoHk15rxX5p+VvZEzByX9rjRwi44L
 Bj3RyCq0VJ+943trB+CaTY+RInZm5AhCir4+Tb2rxl0+W3NrEtObpyTVGQbOsjBkxAo7
 Wmj3bXQ0L8gRilevuzNCgP2+HVzl+BMLgWqtvrGszLVbxDwVUXT3O0JfaW16j4HAiz15
 IMF6HMZ1zt04cuzkjih6lr/ffRGBnwaZrNBaaPBb+YzrTMyGycpav51ljZx+QSn1kLfG
 lo98lO2PATOuuhfuzvBdvBaNofreR1stGQGDJAHNzWGzvh9UenhSyArPxYPp9ByUQ6wZ
 8LPQ==
X-Gm-Message-State: AOAM533xke8JwuOzFVQOTW/2Nf4s9eF9ukCD+0K0RqJLPILdYRR240/t
 31V94AMF1pVWxZKYkUe2L+igvA==
X-Google-Smtp-Source: ABdhPJzix12pUkukVLlQiHqeyK+Rus1aqB9qadZee2nHf2S8U5cPkbe3wFz/pFi0UCDTj0XU1UzMTA==
X-Received: by 2002:a17:906:2c1b:: with SMTP id
 e27mr13482066ejh.611.1641316610324; 
 Tue, 04 Jan 2022 09:16:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 4sm11572333ejc.168.2022.01.04.09.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:16:50 -0800 (PST)
Message-ID: <ca0f9046-093a-194e-ad8f-01de07f0d3a1@mind.be>
Date: Tue, 4 Jan 2022 18:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220101213948.265173-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101213948.265173-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] support/config-fragments/autobuild: fix
 riscv64 toolchain configs
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 22:39, Julien Olivain wrote:
> commit b3c66481e1f1503fcbf193d0c780271e880ad500 replaced RISC-V LP64
> toolchains by RISC-V LP64D. The config symbols
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE and
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE were marked as legacy.
> Those changes were not reflected in the autobuild toolchain configs in
> support/config-fragments/autobuild/bootlin-riscv64-{glibc,musl}.config
> 
> When testing a package with the command:
> 
>      ./utils/test-pkg --all --package somepackage
> 
> bootlin-riscv64-{glibc,musl} toolchain are always skipped. The build
> logfile contains:
> 
>      [...]
>      Value requested for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN not in final .config
>      Requested value:  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>      Actual value:
> 
>      Value requested for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE not in final .config
>      Requested value:  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE=y
>      Actual value:     # BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE is not set
> 
> This commit update the autobuild config fragments for RISC-V 64bit
> toolchains so they can be used by test-pkg.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  While reviewing this, I noticed that 
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE in fact never existed, so I 
sent a patch to fix that as well [1]. Unfortunately, I forgot to Cc Thomas on 
that, so Thomas consider yourself CCed now :-)

  Regards,
  Arnout


> ---
>   .../config-fragments/autobuild/bootlin-riscv64-glibc.config   | 4 ++--
>   .../config-fragments/autobuild/bootlin-riscv64-musl.config    | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/support/config-fragments/autobuild/bootlin-riscv64-glibc.config b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
> index f6c6fcaa36..433a6e89f7 100644
> --- a/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
> +++ b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
> @@ -1,5 +1,5 @@
>   BR2_riscv=y
> -BR2_RISCV_ABI_LP64=y
> +BR2_RISCV_ABI_LP64D=y
>   BR2_TOOLCHAIN_EXTERNAL=y
>   BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> -BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE=y
> diff --git a/support/config-fragments/autobuild/bootlin-riscv64-musl.config b/support/config-fragments/autobuild/bootlin-riscv64-musl.config
> index 2b6a6e56da..fee1f29f4a 100644
> --- a/support/config-fragments/autobuild/bootlin-riscv64-musl.config
> +++ b/support/config-fragments/autobuild/bootlin-riscv64-musl.config
> @@ -1,4 +1,4 @@
>   BR2_riscv=y
> -BR2_RISCV_ABI_LP64=y
> +BR2_RISCV_ABI_LP64D=y
>   BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
