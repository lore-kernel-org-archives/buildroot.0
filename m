Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EBF606A324
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eHuq+0lJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A39C740776;
	Thu, 22 Oct 2026 09:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuEe7CxcMgnI; Thu, 22 Oct 2026 09:36:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7982C4077B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661785;
	b=aDHLE339Zf+fAfNJbk1ApoKsL3WHrNaeN7tTJ+hkJInB8BH7umNQQTBgjCI48c94auzl
	 rBIIx+VtJQVaGpo2t5CRMrRCxRTw6DHQqdTTzKasdlnqdAoe7gMD45LE/qGG1IxLJxZM8
	 ZI/x+dSsWx/CDAYv7cdixcCGssqtCRqk4OupZt9gnguvtA4FHsjfE38hcZDR+4tyIcanX
	 3oqtEg1C37J73PoazJ7saJbE1zj7eqoS3CDAKyajy+Ue3wDdePJBKJ+Bm6rDwYIHmaYRy
	 ZxSXoAFKE8I1jP21MmtdPoIV6QO8N/yRT9+9IG3sQ044UUdS/fOlZY4yioAK4YHtcrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661785;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=GYzbvYPpDRl/9XzaltyLLLAHEneRfoqTBTpAYATQeEk=;
	b=lK/D5L37C2G+QnA1q2U02KVVjjSUB+6nO0XuNIMVHupNAKaXFLzvoycAOAqq0t6a3/IK
	 sXZ/3iXNmb84PSR7o10z6U3c3eHbObgRPsEfLoNkQLxnanAVt+CaW7FQefUPbpUvUHQS5
	 EUEQqbbhCGgFbzDsEYwyMlZ2hhhb1D4+xFAupdKiicwlySIaEs5Lb6Jve/e4OG3ymWhQP
	 py/cvvD4ylRLseJ8mmuktirVpf+XNCnl8XqpkA9WRbU9mKyGbPVxEJ7mDagzVaxwZJDLj
	 Qz9v2wnu6r0kA82QRnBVQHCK5a8m+WLLu6zXIf9eUaBufQz49ogpSL8qZagmu01XZuA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661785;
	bh=GYzbvYPpDRl/9XzaltyLLLAHEneRfoqTBTpAYATQeEk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eHuq+0lJdGPsXuQiAefZcJ7+qN2+Oxd379q56JiIVVfFPjbEukQv3cD5yVLnysZpJ
	 WSVwm6ixRRUlHUkRdrcKcUy6b1AU742RHZ6ZOq7qlmttmqTTpKqghY0gp77AEIouRA
	 yV0PdWAEo9necIyza3MiDUcBv0IHXVJKScVAWPojgX93D8OdjF4iaLvXPGkUk0hCtO
	 CIoc607HWJJsyqvVl7gJ5ESuABDFlVOB+PUfAa1Bqu3msepADJ0iiXhLQj2A0IugsI
	 NzCbbH3o520Vvvva65o7sl/GyAwm/vUp2G3oZbC2/Pl1kQ2A6JnXI5X5dxP3wC9TxF
	 TP7jw/KM4cBvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7982C4077B;
	Thu, 22 Oct 2026 09:36:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B6AA95C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00CE6811D9
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbH6oqNZrgJl for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:36:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A8A51811D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661783;
 b=lyHaMviWsdiQ8NZzF6DPFyZ47ZhcVuh9WH9p18y1qcTI/Gl7H9JmIIrjSqlFjUpl2VUA
 IvMpK+7Fok3++1uLPY2HYuguV8UDU1y8hnAinNQc286x06ArEPK59COTv9qaGG6v2SEjx
 YvaHOBwohrmzXQ7LmFbC4LX362UV3pfuLT3r91jyO2g4P23fgACOIY927Fq6GbEArHQG2
 tkxNvL2bdq2lyaFq+MFfYizR6CpyrXq8bur6QlEB8PKTNanlmyxdpvWEU0iO2Ro9sJNYz
 aHlmFH5kBSw+6oLwSewWimrqWojmjega1f0HAPftEKADz37qCntNwYlOwERRqfz7UgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661783;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=1G5UHvXFKaeoIoILgUui1IWJv44Rzx1epDoXdj6TCqE=;
 b=oOnodTChdTDzH0o9AwOoZkP8a2OH+ntYtp3vd2Aw6TOZhUaNAX3MKds77UZcrvxpw7Bb
 07Qjrz2DWZnKtfHEgLwft5lQjdTEJJXLI6YD0d8dq3SI7V5VwWsMDU2hwLKES5DKgmz1K
 3zaJIkpYO89MOhxvQZVaT8SJslpTvn1vLTVW0wFIQQdq6gH8NtPhG3sJ/+x/C50yk3o4m
 21RgtVEXPl9x5BoUTexNQXvHVmjeNMbTWqfzWijEwE6Si4kddK09tqAvtudG6r4iJz9NZ
 Az0CxZIj9uaiAhqDuVsKHXRSBBFfuJK1WTgTNV+GTbC1eQvBHJB2RulM0qnhqQsSYtg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b="h/G1nA/C"; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8A51811D8
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:36:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 54EDBB97A554; Thu, 22 Oct 2026 11:36:19 +0200 (CEST)
Message-ID: <562ad192-b09a-4470-a02e-e3b0d5b2af00@rnout.be>
Date: Thu, 22 Oct 2026 11:36:17 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261020202639.1094960-1-ju.o@free.fr>
 <20261020202639.1094960-4-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20261020202639.1094960-4-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/4] arch/Config.in: change default target
 architecture to AArch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 20/10/2026 22:26, Julien Olivain via buildroot wrote:
> This commit switches the default target architecture in arch/Config.in
> from i686 to AArch64. AArch64 is now one of the most common
> architecture on embedded Linux systems. The default CPU for this
> architecture remains the Cortex-A53 (Armv8.0).
> 
> While at it, this commit also refreshes the .defconfig to:

  Do we even need this .defconfig file? Isn't that a leftover from very, very, 
very old Kconfig?

> - align to this new default,
> - remove stale options (BR2_alpha, BR2_cris, BR2_ia64)
> - add the missing options
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  I'm the one who proposed the change to aarch64 as default, so

Acked-by: Arnout Vandecappelle <arnout@rnout.be>


  Regards,
  Arnout

> ---
>   .defconfig     | 60 ++++++++++++++++++++------------------------------
>   arch/Config.in |  2 +-
>   2 files changed, 25 insertions(+), 37 deletions(-)
> 
> diff --git a/.defconfig b/.defconfig
> index d25c62e104..56785b2bc3 100644
> --- a/.defconfig
> +++ b/.defconfig
> @@ -1,50 +1,38 @@
>   #
> -# Automatically generated make config: don't edit
> -# Mon Feb 18 09:11:56 2008
> +# Automatically generated file; DO NOT EDIT.
> +# Buildroot 2026.08 Configuration
>   #
>   BR2_HAVE_DOT_CONFIG=y
> -# BR2_alpha is not set
> +
> +#
> +# Target options
> +#
> +# BR2_arcle is not set
>   # BR2_arm is not set
>   # BR2_armeb is not set
> -# BR2_cris is not set
> -# BR2_ia64 is not set
> -BR2_i386=y
> +BR2_aarch64=y
> +# BR2_aarch64_be is not set
> +# BR2_hppa is not set
> +# BR2_i386 is not set
> +# BR2_loongarch64 is not set
>   # BR2_m68k is not set
> +# BR2_microblazeel is not set
> +# BR2_microblazebe is not set
>   # BR2_mips is not set
>   # BR2_mipsel is not set
> +# BR2_mips64 is not set
> +# BR2_mips64el is not set
> +# BR2_or1k is not set
>   # BR2_powerpc is not set
> +# BR2_powerpc64 is not set
> +# BR2_powerpc64le is not set
> +# BR2_riscv is not set
> +# BR2_s390x is not set
>   # BR2_sh is not set
>   # BR2_sparc is not set
>   # BR2_sparc64 is not set
>   # BR2_x86_64 is not set
> -# BR2_x86_i486 is not set
> -# BR2_x86_i586 is not set
> -BR2_x86_i686=y
> -# BR2_x86_pentiumpro is not set
> -# BR2_x86_pentium_mmx is not set
> -# BR2_x86_pentium_m is not set
> -# BR2_x86_pentium2 is not set
> -# BR2_x86_pentium3 is not set
> -# BR2_x86_pentium4 is not set
> -# BR2_x86_prescott is not set
> -# BR2_x86_nocona is not set
> -# BR2_x86_core2 is not set
> -# BR2_x86_k6 is not set
> -# BR2_x86_k6_2 is not set
> -# BR2_x86_athlon is not set
> -# BR2_x86_athlon_4 is not set
> -# BR2_x86_opteron is not set
> -# BR2_x86_opteron_sse3 is not set
> -# BR2_x86_barcelona is not set
> -# BR2_x86_geode is not set
> -# BR2_x86_c3 is not set
> -# BR2_x86_winchip_c6 is not set
> -# BR2_x86_winchip2 is not set
> -BR2_ARCH="i686"
> +# BR2_xtensa is not set
> +BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT=y
> +BR2_ARCH="aarch64"
>   BR2_ENDIAN="LITTLE"
> -BR2_GCC_TARGET_TUNE="i686"
> -BR2_GCC_TARGET_ARCH="i686"
> -
> -#
> -# Target options
> -#
> diff --git a/arch/Config.in b/arch/Config.in
> index 7bfa174b5f..0f1697597e 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -17,7 +17,7 @@ config BR2_ARCH_HAS_FDPIC_SUPPORT
>   
>   choice
>   	prompt "Target Architecture"
> -	default BR2_i386
> +	default BR2_aarch64
>   	help
>   	  Select the target architecture family to build for.
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
