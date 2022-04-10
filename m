Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A71C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370D760D55;
	Sun, 10 Apr 2022 14:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNKBIxNBR1Tq; Sun, 10 Apr 2022 14:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1BF60BD6;
	Sun, 10 Apr 2022 14:39:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6D11BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE4A883F8B
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmlJenX3N2Or for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:39:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEC5583FC8
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:39:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 21so2130082edv.1
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ys9LHxP0rkXUo185dkapTTWmMga/OYdvNA1dwXB4qAg=;
 b=R9YOZ0XowqLnnmZRMtISVmNU2k/OSdgiEnn/J0jqY7FM4JrwH8CjQVSzw+VmmvgNna
 P473CZX6g64AQ2CDHkUX8628tmYuEL5hmjGD3q7xrVRiJ0HlwFpFNsMlv+zy5GNClIAP
 GwhIk9VMvAMPch4g6NYcGOr/1qRrs1SOAGAD5Kn4H1Psa4/isH0ZpwknNVbeyvTe37cL
 D4ZQuics/agTnrlIsxDCZKsfKn2+fImiwzgCqBKyuvgQxjsogLwRIs2rUH8axfzYvHsl
 KRDtrMOrfdgCFJOIRMi9Mpa6gmwCyha75bxYSsgL0OhfUSoHm+4t2MbtrB4Y1BLag7TZ
 ilQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ys9LHxP0rkXUo185dkapTTWmMga/OYdvNA1dwXB4qAg=;
 b=o1kM8luwGFszO9/JMzJjzVucFhrYHdBkjQBPlq4UXSP/9FBQcgbledhD/Kr4Mr7jel
 rQ6V9x3cBAoHRqYzo2nhXk43Ke3gSytI5uocGunIQxjo2ha9bZxuV2eQ6XlUtqB6cPcH
 ZTEEcOTNOPtR5bPiQlIvApRqeTkYY5kZo4Wz5tUrPQFqFp/yPitY1Nf4JvHiQry5qwtz
 9mv0uRHNKFO/KRSvKSr4Aikf8j5bzwPunV0sUSsaVAcNAezgFs9MFXyr5SDEtQYq6ISH
 QTOa9gCnzp7JbmtYUqhmuaepUrmoru6QvO2mnaK8jq0QwNglYqrD/yQbch4M4e3fCHKA
 uuxA==
X-Gm-Message-State: AOAM533ixCoRX/EbS4KIQOqjQcSKG+c/vnQi+3Mq5oNj/Sm8WQobDyI/
 IzWsAPAcEhwSEJTN/FZNAHVaduXmxcy3/A==
X-Google-Smtp-Source: ABdhPJxZO52AS4itXcKnycEUHvxHahgXbgbGCDif2SNVU8YSJYu8ub/6Z3Kh2pCS27g9Y85hGusfhA==
X-Received: by 2002:a05:6402:5201:b0:419:4c82:8f11 with SMTP id
 s1-20020a056402520100b004194c828f11mr28478847edd.133.1649601551364; 
 Sun, 10 Apr 2022 07:39:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfdfdac005sm10845714ejc.174.2022.04.10.07.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:39:10 -0700 (PDT)
Message-ID: <92b4b36f-f59c-40b7-6f8d-2ef2cea82305@mind.be>
Date: Sun, 10 Apr 2022 16:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220404005725.564691-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404005725.564691-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/{rustc,
 rust-bin}: add s390x target arch support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 02:57, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rust-bin/rust-bin.hash | 3 +++
>   package/rustc/Config.in.host   | 2 ++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
> index 9f8788a295..ec1c09b7ea 100644
> --- a/package/rust-bin/rust-bin.hash
> +++ b/package/rust-bin/rust-bin.hash
> @@ -88,6 +88,9 @@ sha256  a85f5f42918e8b140d7093ba49fc46a21625863538c95d2db03f831cc445f025  rust-s
>   # From https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
>   # Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
>   sha256  2d7276fe261478c377913177dcec3e0aeed84f2c567db0ae8e415efee7bb9ce0  rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz.asc
> +sha256  e990778d618a213a0825625277505850e222df9ab5b514fec927fbf2d2d21a66  rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz
>   # From https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.sha256
>   # Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.asc
>   sha256  7a7cd002c63179f3f47d64b1140c180986322a7cc0d31de61d7c4728cedacba0  rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index 80d1d1a3d8..d38b57386c 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -53,6 +53,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
>   			BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
>   			BR2_RISCV_ISA_RVD && BR2_RISCV_ISA_RVC && \
>   			BR2_TOOLCHAIN_USES_GLIBC
> +	# s390x-unknown-linux-gnu
> +	default y if BR2_s390x && BR2_TOOLCHAIN_USES_GLIBC
>   	# x86_64-unknown-linux-musl
>   	default y if BR2_x86_64 && BR2_TOOLCHAIN_USES_MUSL
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
