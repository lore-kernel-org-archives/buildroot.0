Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F88C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 10:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 652DE81214;
	Sat, 12 Jul 2025 10:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0cTT8ijOoB0; Sat, 12 Jul 2025 10:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BFD480F36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BFD480F36;
	Sat, 12 Jul 2025 10:43:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBD171CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADC49607B2
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCW8fGE0vu2e for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 10:43:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1981660790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1981660790
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1981660790
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:43:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 561FE780504;
 Sat, 12 Jul 2025 12:43:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 12:43:31 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 12:43:31 +0200
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250710-loongarch-fabi-v2-2-72fcf95c8b65@flygoat.com>
References: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
 <20250710-loongarch-fabi-v2-2-72fcf95c8b65@flygoat.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7b0f1cb629fce8a57d9b644b8beb8b2a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752317012;
 bh=pU6zqtTkZLfVZWjZttGbS1IGnup6xgOHTK68ItWRlb0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S264aTQNWAROKJMKvr8ScWoezwBJ635dR47sR7mui+3F6q6OiM6Pyb4cVLX8w1h+6
 74xkgZqVNGYaOHK5p07EuA+pen+16EXb58F5QVpgTnbKca7iC1XGLJR6HIvw3FCpiC
 kEqJMo8owyZlGZnQj3HPnGEx2+M00DdWE21V3gV+fCkLN7cmBsKW/nqODvnsVJ6bc9
 hIz4tIBRfBVQrvGHxytVsKuroflzwZbmMLCnaxvBMQXOmnV6s3mIyOoWGFUKUZTFug
 u/wOIczw6tI1XKjZOYlTZQRTjhTs1p8lXBGPYlS6kAjQ7DQKe3ioaRK9/TdELjUU3d
 keDF9P7KIv6/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S264aTQN
Subject: Re: [Buildroot] [PATCH v2 2/3] arch/loongarch: Mark lp64f and lp64s
 as broken
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jiaxun,

Thanks for the patch.

On 10/07/2025 12:41, Jiaxun Yang wrote:
> Toolchain failed to bootstrap with LP64F and LP64S toolchain.
> 
> Mark it as broken at the moment to allow time for investigation.

Marking the lp64f and lp64s as broken is not sufficient to
prevent generating failing configurations.

When selecting BR2_LOONGARCH_FPU_32 or BR2_LOONGARCH_FPU_NONE,
there is no default ABI selected, gcc will then default to lp64d.

The following configuration:

     cat >.config <<EOF
     BR2_loongarch64=y
     BR2_LOONGARCH_FPU_NONE=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
     BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
     BR2_TARGET_ROOTFS_EXT2=y
     # BR2_TARGET_ROOTFS_TAR is not set
     EOF
     make olddefconfig
     make

still fails with message:

     lp64d/base ABI cannot be implemented with --with-fpu=none.

I believe BR2_LOONGARCH_FPU_32 and BR2_LOONGARCH_FPU_NONE should
be marked as broken too. Since only FPU_64 can be selected, then
only lp64d will be selected, which is a currently working
configuration.

Can you confirm and send an updated patch, please?

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/Config.in.loongarch | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
> index 
> 1f302364b13b10183638da230a4735a7d7b7f46e..c11d8dc79f0e76526948d2befbfae722fbc1b0ed 
> 100644
> --- a/arch/Config.in.loongarch
> +++ b/arch/Config.in.loongarch
> @@ -87,11 +87,15 @@ config BR2_LOONGARCH_ABI_LP64D
>  config BR2_LOONGARCH_ABI_LP64F
>  	bool "lp64f"
>  	depends on BR2_ARCH_IS_64
> +	# Failed to build host GCC initial, pending investigation
> +	depends on BR2_BROKEN
>  	depends on BR2_LOONGARCH_FPU_64 || BR2_LOONGARCH_FPU_32
> 
>  config BR2_LOONGARCH_ABI_LP64S
>  	bool "lp64s"
>  	depends on BR2_ARCH_IS_64
> +	# GCC can't find the right library path, pending investigation
> +	depends on BR2_BROKEN
>  endchoice
> 
>  config BR2_ARCH
> 
> --
> 2.49.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
