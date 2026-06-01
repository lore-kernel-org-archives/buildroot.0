Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD97CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F756066F;
	Mon,  1 Jun 2026 19:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7bCZjmMqqCN; Mon,  1 Jun 2026 19:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CC506067A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780340464;
	bh=Gi9+7gm1lpOc+DPTExJuz7oy6ik8F8pIbrpEw0Rs+lU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sKmzSTRbsa2RLh5HH/7tUd8U00D7ZDWoa1k8tMcYyxuPLIVqs3f0xARB/TwAeyGM/
	 NSbOgkxdvznXeML73b8YssC9lz7JaagIbWZxTSxCbd1XJs4pQvcidLK18TD+I8vB6R
	 t59SIdocNxerY3i32+7D+Aa1eDxywHiaOuC9N6YswtC362Ge1jMIA/5Xc4ElTd5hYJ
	 InnEAYPNWS44w++aVf892O7EyJN+wMhZXYtIM9vCeocfXdeZxp6eg1eXn3F8cJPpon
	 Sv6lSV+9yGNzho83r8KugRj15ceCoOvSP6uM0VxuMzK7BUzJEucBzmi6+AKi+8p+6+
	 wkU/FdonM5ZPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC506067A;
	Mon,  1 Jun 2026 19:01:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80122F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65CBE400F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uqk0Ai7FQsE6 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 525CB400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 525CB400D6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 525CB400D6
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8644B97C77E; Mon,  1 Jun 2026 21:00:57 +0200 (CEST)
Message-ID: <6bab2ff4-1b05-4db8-997e-25675cf173ed@rnout.be>
Date: Mon, 1 Jun 2026 21:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pengji Li <wjjsn@qq.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
References: <tencent_EA74B36C1735A9BED38BAF20690480CAAA08@qq.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <tencent_EA74B36C1735A9BED38BAF20690480CAAA08@qq.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780340460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=3Rcf/B7BZr+NmQFVmapsAN/Fnq3c0F6fT0w4dXDww1c=;
 b=Q8x6ggC58SHCFQqnkngadoNbQ6NNwmoe9O4dsBi8LONag2xJ3SfyNg6S+DYRT4h8LDlxrk
 ZGx2e44JkWca38HUxQVTRh3xObOhICKLwz4i83bH5aqwxJBaP55Tvhgp8l3hC83aWV9j8R
 OWp8sM5iewls5w4QzdhGz55jUmCPkT3ScqSLBi1W0aTy9t3YGGD7M9G9DHLGAH/FXNW5eh
 Z4uItucR5itxA6UW990uRs3L0Hs+eVkpsDe3PIxjFqenuwpisr4Wyj7GVVtAcv6zkQH0Dz
 5v7AiO875OyQ3yewJxWME2sUmDsftP850XpPgwf2Dopa1EsXg3IjOIWHZt7HHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Q8x6ggC5
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: respect LoongArch SIMD
 selection
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/06/2026 12:55, Pengji Li via buildroot wrote:
> OpenCV probes the host compiler for LSX/LASX by trying to compile a
> small test program with '-mlsx' / '-mlasx'. With Buildroot's toolchain
> this probe succeeds even when the target CPU lacks the matching ISA
> extension, and the resulting libraries then contain LSX/LASX
> instructions. This causes SIGILL at runtime on, e.g., the LA264.
> 
> Map Buildroot's BR2_LOONGARCH_SIMD_* selection to OpenCV's
> CPU_BASELINE / CPU_DISPATCH knobs:
> 
>    BR2_LOONGARCH_SIMD_NONE  -> no baseline, no dispatch
>    BR2_LOONGARCH_SIMD_LSX   -> baseline = LSX,  no dispatch
>    BR2_LOONGARCH_SIMD_LASX  -> baseline = LSX,  dispatch = LASX
> 
> The block is gated on BR2_loongarch64, so the existing auto detection
> remains in effect for every other architecture.
> 
> Signed-off-by: Pengji Li <wjjsn@qq.com>
> ---
>   package/opencv4/opencv4.mk | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index 695355c308..0e2567eb6f 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -120,6 +120,41 @@ OPENCV4_CONF_OPTS += \
>   	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF) \
>   	-DENABLE_VFPV3=OFF
>   
> +# LoongArch: OpenCV probes the host compiler for LSX/LASX by trying to
> +# compile a small test program with '-mlsx' / '-mlasx'. With Buildroot's
> +# toolchain this check succeeds even when the target CPU does not have
> +# the matching ISA extension, and the resulting OpenCV libraries end up
> +# containing LSX/LASX instructions, causing SIGILL at runtime on CPUs
> +# such as the LA264.
> +#
> +# Trust Buildroot's own LoongArch SIMD selection (BR2_LOONGARCH_SIMD_*)
> +# as the source of truth and translate it to OpenCV's CPU_BASELINE /
> +# CPU_DISPATCH knobs (OpenCV knows LSX and LASX on LoongArch):
> +#
> +#   BR2_LOONGARCH_SIMD_NONE  -> no baseline, no dispatch
> +#   BR2_LOONGARCH_SIMD_LSX   -> baseline = LSX,  no dispatch
> +#   BR2_LOONGARCH_SIMD_LASX  -> baseline = LSX,  dispatch = LASX
> +#                              (LASX implies LSX; OpenCV's own upstream
> +#                              combination matches BR2's choice above.)
> +#
> +# We only enter this block on LoongArch, so the existing OpenCV auto
> +# detection still applies for all other architectures.
> +ifeq ($(BR2_loongarch64),y)

  This condition isn't really needed, the below conditions imply it. However, it 
doesn't hurt and it makes things clearer.

  Applied to master, thanks.
  Regards,
  Arnout

> +ifeq ($(BR2_LOONGARCH_SIMD_NONE),y)
> +OPENCV4_CONF_OPTS += \
> +	-DCPU_BASELINE= \
> +	-DCPU_DISPATCH=
> +else ifeq ($(BR2_LOONGARCH_SIMD_LSX),y)
> +OPENCV4_CONF_OPTS += \
> +	-DCPU_BASELINE=LSX \
> +	-DCPU_DISPATCH=
> +else ifeq ($(BR2_LOONGARCH_SIMD_LASX),y)
> +OPENCV4_CONF_OPTS += \
> +	-DCPU_BASELINE=LSX \
> +	-DCPU_DISPATCH=LASX
> +endif
> +endif
> +
>   # Cuda stuff
>   OPENCV4_CONF_OPTS += \
>   	-DBUILD_CUDA_STUBS=OFF \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
