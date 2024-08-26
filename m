Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E46C5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 00:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C26780F89;
	Mon, 26 Aug 2024 00:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2W16yzzQ9xV; Mon, 26 Aug 2024 00:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3653080F0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3653080F0F;
	Mon, 26 Aug 2024 00:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93F631BF954
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 00:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8269C40290
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 00:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIBoUQcNOt4g for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 00:47:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E29ED401F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E29ED401F3
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E29ED401F3
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 00:47:08 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EB71435282F0; Mon, 26 Aug 2024 02:47:05 +0200 (CEST)
Date: Mon, 26 Aug 2024 02:47:05 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Hans Ulli Kroll <linux@ulli-kroll.de>
Message-ID: <ZsvQifWVBX+MsZlF@waldemar-brodkorb.de>
References: <20240825134224.1443593-1-linux@ulli-kroll.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240825134224.1443593-1-linux@ulli-kroll.de>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724633225; bh=6Mxz3zv5ZYa07CtJ9ozBqe94OKMZnC49oxPB3CHwd2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LGLlzuEMcaxBiWNGBuoKU/dVzGw1tBQLb2SUOFNd6qluIiaPHmT5ks7qd8+g5mq82
 H8ISN3WCX8GR+vAvci9lguosT19OTp7bve4+RyqO0stGoLFqx3PHrYkTioh7NllwvL
 ESZU9Eur6GSkylGju37WGBQg6nYYhrMOOH44GqUiaBHTPBLK5EwUZYmQWgGaa1ygHZ
 6aTVgxKEVgGQNogB0eV4+OI/kI28i/aMHUPH+4LBuVRclo01pSEP8PQ7D2ey9/eJeo
 /kVHHw0Dr2eH/GGOJI5NrWoRa7h7b5CnWLao3MPgHlm0KKe9gKXGabBufhjulWXU4j
 OALpQLxNVT93Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=LGLlzuEM
Subject: Re: [Buildroot] [PATCH] toolchain:uclibc-ng:enable gnu hash for non
 mips platforms
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

the subject must be changed to "package/uclibc: enable gnu hash for
non mips"

Hans Ulli Kroll wrote,

> In toolchain-wrapper.mk we use both sysv and gnu hash style for all 
> platforms, except MIPS which uses sysv only.
> 
> However uClibc-ng has some extra knob to enable gnu hash via Kconfig, 
> which is set by default off.
> 
> This leads to wrong symbol resolving on armv5 and output of devices,
> here on Pogoplug 4 detected with lcpci 3.10.
> 
> Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>
> ---
>  package/uclibc/uclibc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index de834bac4f..f48ebe6a16 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -205,6 +205,12 @@ define UCLIBC_X86_TYPE_CONFIG
>  endef
>  endif
>  
> +ifneq ($(UCLIBC_TARGET_ARCH),mips)
> +define UCLIBC_LDSO_GNU_HASH_SUPPORT
> +	$(call KCONFIG_ENABLE_OPT,LDSO_GNU_HASH_SUPPORT)
> +endef
> +endif
> +
>  #
>  # Debug
>  #
> @@ -403,6 +409,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
>  	$(UCLIBC_SH_TYPE_CONFIG)
>  	$(UCLIBC_SPARC_TYPE_CONFIG)
>  	$(UCLIBC_POWERPC_TYPE_CONFIG)
> +	$(UCLIBC_LDSO_GNU_HASH_SUPPORT)
>  	$(UCLIBC_X86_TYPE_CONFIG)
>  	$(UCLIBC_DEBUG_CONFIG)
>  	$(UCLIBC_ENDIAN_CONFIG)
> -- 
> 2.46.0

The rest looks good to me.
Reviewed-by: Waldemar Brodkorb <wbx@openadk.org>

best regards
 Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
