Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E1AC54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B624540438;
	Tue, 19 Mar 2024 21:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVBko-Qz9Mdz; Tue, 19 Mar 2024 21:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC7E405CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CC7E405CB;
	Tue, 19 Mar 2024 21:38:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99C651BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 927A44018C
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbgrE7bnI7jy for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 21:38:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 105B04013A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 105B04013A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 105B04013A
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 21:38:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BFFF313F88F;
 Tue, 19 Mar 2024 22:38:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 22:38:08 +0100
Date: Tue, 19 Mar 2024 22:38:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZfoFwGTKdPAF6d9C@landeda>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240304153253.732708-3-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710884302;
 bh=/oRgHEX6HkMmfuu/Qw8qquL3eTwXBPQ3iRWDiURerSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r4Q8WOejJXfmLZktT1p5nA47rWnbo2JcNFWJlwxdJ2Srw1spXXZDaXsgtTpuDERuW
 TNRJa1GSA3CMpj52k62J449R7VPINX2i5oXNwShOidakzfAIPHUbIkZ1dtMUmIVUAp
 4EY6DXqn0SYWaiYh7q1lgWlKD5CINwP/iJ6ecpllT+6k1xGgckj/5ukI+uBx8A78Ts
 nDyN5Vv26E631HDjjOGZXK3rbHtPGH+t2Y0uP4ZiSyv8UQRdHC6m50FhG8oFrIpbfl
 R9pTBU8wo/XeHrmZx+nXc/xcFy5srW4m5ZcyqPTeR8bS3/X9wLWX9NUkcILBzonzek
 y281GnQVXQ8gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r4Q8WOej
Subject: Re: [Buildroot] [PATCH v9 02/22] configs/ti_am64x_sk_defconfig: fix
 BR2_TARGET_OPTEE_OS_PLATFORM setting
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-03-04 16:32 +0100, Dario Binacchi spake thusly:
> Using PLATFORM=k3 can leads to a runtime boot crash on some K3 SoC (e.g.
> j721e) because the optee flavor is missing.
> 
> We could use BR2_TARGET_OPTEE_OS_PLATFORM=k3 and
> BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=am64x but we actually can use
> BR2_TARGET_OPTEE_OS_PLATFORM=k3-am64x as explained in the optee-os
> Makefile [1]:
> 
>   # If $(PLATFORM) is defined and contains a hyphen, parse it as
>   # $(PLATFORM)-$(PLATFORM_FLAVOR) for convenience
> 
> This is how meta-ti set the optee-os platform:
> 
>   meta-ti]$ git grep OPTEEMACHINE
>   meta-ti-bsp/conf/machine/am437x-hs-evm.conf:OPTEEMACHINE = "ti-am43xx"
>   meta-ti-bsp/conf/machine/am57xx-hs-evm.conf:OPTEEMACHINE = "ti-am57xx"
>   meta-ti-bsp/conf/machine/beagleplay.conf:OPTEEMACHINE = "k3-am62x"
>   meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf:OPTEEMACHINE = "ti-dra7xx"
>   meta-ti-bsp/conf/machine/include/am62axx.inc:OPTEEMACHINE = "k3-am62x"
>   meta-ti-bsp/conf/machine/include/am62pxx.inc:OPTEEMACHINE = "k3-am62x"
>   meta-ti-bsp/conf/machine/include/am62xx.inc:OPTEEMACHINE = "k3-am62x"
>   meta-ti-bsp/conf/machine/include/am64xx.inc:OPTEEMACHINE = "k3-am64x"
>   meta-ti-bsp/conf/machine/include/am65xx.inc:OPTEEMACHINE = "k3-am65x"
>   meta-ti-bsp/conf/machine/include/j7200.inc:OPTEEMACHINE = "k3-j721e"
>   meta-ti-bsp/conf/machine/include/j721e.inc:OPTEEMACHINE = "k3-j721e"
>   meta-ti-bsp/conf/machine/include/j721s2.inc:OPTEEMACHINE = "k3-j784s4"
>   meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
>   meta-ti-bsp/conf/machine/include/j784s4.inc:OPTEEMACHINE = "k3-j784s4"
> 
>   meta-ti uses the OPTEEMACHINE to set optee-os platform [2].
> 
> [1] https://github.com/OP-TEE/optee_os/blob/4.0.0/Makefile#L37
> [2] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23
> 
> Suggested-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Changes in v6:
> - Update commit message
> 
> Changes in v5:
> - Drop BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR option
> 
> Added in v4
> 
>  configs/ti_am64x_sk_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
> index 4bfd31f0c8d3..097175bd8f39 100644
> --- a/configs/ti_am64x_sk_defconfig
> +++ b/configs/ti_am64x_sk_defconfig
> @@ -21,7 +21,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
>  BR2_TARGET_OPTEE_OS=y
> -BR2_TARGET_OPTEE_OS_PLATFORM="k3"
> +BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
>  BR2_TARGET_TI_K3_IMAGE_GEN=y
>  BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
>  BR2_TARGET_TI_K3_R5_LOADER=y
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
