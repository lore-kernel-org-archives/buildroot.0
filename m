Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A34C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9EAA4179A;
	Wed,  5 Feb 2025 10:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OU68ISdNmXjh; Wed,  5 Feb 2025 10:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67DD4417A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67DD4417A7;
	Wed,  5 Feb 2025 10:33:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 682A612A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BEA280FA1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nuGnCmp_dmmQ for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1802480A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1802480A82
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1802480A82
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:33:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so45130645e9.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 02:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738751595; x=1739356395;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PNTANkgmUCDTH6s2ecuWn4SOrhmmwi4WzMSY9MU4iCY=;
 b=IVBNmQPoKRgvSy4jaQnybzTBDqrc6B8AsPpb0QR2mjI7qpu8uRbHUtSy/cNCO0dsNv
 CCUkbsiO6MSWlMo5AtqtbXYmGwU3t5p2FkcpK50pUUyoOm1Sxk9ucN3YIdHUNDpLVi6e
 SBtS7EC+Vuj2GjaPv1DBO0cZV+bglwOEvBtZmkHjmPPOgEJkXObrBp7vFGCSveSGbgQ/
 +zChj4pWQvEWRX7qmKsLJrBVjYkcsBhYaULymMvHVG6Ld0AcJ6EJSUSc6xKPhtPEnUoX
 m8+ZMac0zqujwBwyqv71tBXhZ+8+ljA/Vt7zGZTZzpm1lbZ/q3dmks/GtO4XGZPppCF8
 BQXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD5rlS+Le0VyR/9JCjOwUYBQ2zsph/uiseVvTTMrlrW+mW1HNJnHZ6R2Nxk6ESOglWtNvCZf5Jugc=@buildroot.org
X-Gm-Message-State: AOJu0YyHfWRZRGljZb7MrKDzGzWNFB9zScCavbG8NTLqJve6CBrs83U0
 JuTcsU3jpT+56ZSDSbZJYJQUOrDEj0xjfBNu/MV47DKToqxVwd3/ROq+UBWAsPw=
X-Gm-Gg: ASbGncvSL6w9y977KL9INWGEicZEoxM1VfKNNGTilTbdLVavgIC1x0ssSwwmni0Kj6t
 z0/coqr9icznFBieWiZwDOz1ev1ShSEGzRqBBSQoUBTcmOklnhcBhIBx27BH2w83O19TKx6i12R
 LaWn/IXgJUvC5TmkKGsqaSs3aekHv5IoUbs9ledNFfrxPTnKTtySHiT3JK8tbEfiVrq+piTroGw
 VhXqL1XagDX6Op5nMohB223T25YLl0EG5W1Igi5veR6ucKQJcszed5SFJ+R0UZxGcM+DAgEqAf+
 976lcW0eQu2bNnsvEHBmEkwlR1xEbfgCkyUNhkYaSxFBb2U=
X-Google-Smtp-Source: AGHT+IFEEJlOBB8dM6tzfL2kfNIsY6qtpy3so2dMgbyIf5k9I6tzBWIk+dvZ2qnTPcGgchOME7RKKw==
X-Received: by 2002:a05:600c:5112:b0:434:f1e9:afb3 with SMTP id
 5b1f17b1804b1-4390d43127bmr16027045e9.3.1738751594116; 
 Wed, 05 Feb 2025 02:33:14 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d933789sm16919005e9.4.2025.02.05.02.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:33:13 -0800 (PST)
Message-ID: <f2073884-da55-4f02-8bb4-a39702bc4794@mind.be>
Date: Wed, 5 Feb 2025 11:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>, yann.morin@orange.com,
 Thomas Perale <thomas.perale@mind.be>
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
Content-Language: en-GB
In-Reply-To: <20250204143227.1233163-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738751595; x=1739356395; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PNTANkgmUCDTH6s2ecuWn4SOrhmmwi4WzMSY9MU4iCY=;
 b=FBaCRimnuzW4ivHs1l/EIzIvySNvgAnB8TUhNRILaXjcleJtPeG82OmIC7z944V/kD
 qml5kQ/LAoPyGsHmcJhyDy9us+Ntt2cZXof316tFTCVh993FBc245pOyva2Czfwcs3Bc
 Dy3upXmbllJa4NiRp1RhRU5hegI4gdCtUBZ25ywmXHpMwwm62cpPMZbMhOZHfDaJ6VgY
 nydTK9dSe2hkdIN+OOPmd9lfZufWLXyGCLsrn6FrQ/cLl6tLcqOy3Y+UKuLZRgZfOyUa
 ++Xzn78cotQUhdO/X090FE0QbxxuUJmzTD4tw9UGvPqw5gqSMQY0Tt7KA4TB8UPHLm4v
 hztA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FBaCRimn
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Fiona,

On 04/02/2025 15:32, Fiona Klute wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Go forces use of the Gold linker on aarch64 due to a bug in BFD (the
> default GNU linker) that is fixed in Binutils >= 2.41 [1]. All
> toolchains provided by Buildroot have the fix, and none of them
> provide Gold, so the forced setting breaks dynamic linking in
> Buildroot. Set EXTLDFLAGS to use BFD instead.
> 
> Additionally disable PIE on musl to fix "read-only segment has dynamic
> relocations" errors during linking [2].
> 
> [1] https://github.com/golang/go/issues/22040
> [2] https://github.com/golang/go/issues/17847
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> This patch requires Yann E. Morin's patch that introduces
> PACKAGE_EXTLDFLAGS:
> https://patchwork.ozlabs.org/project/buildroot/patch/876f3a7bb6a2375193fc8f06ab856d2449f83727.1699547993.git.yann.morin@orange.com/

  After all this discussion, could you respin this as:

- a series where Yann's patch is 1/2. It's quite confusing for us maintainers to 
have a patch that depends on another patch, unless when it's part of a series. 
You can just apply that patch on your branch, add your own signed-off-by, and 
include it in your own series;
- add the use-ld=bfd as part of the golang infrastructure;
- I'm not sure about the PIE part yet, but you can try building any other CGO 
package with a musl toolchain and if it fails as well it needs to be in the infra.


  Regards,
  Arnout


> Based on the linked issue the --no-pie linker flag should be needed
> only for musl, but I'd be grateful if anyone could test with glibc.
> 
>   package/containerd/containerd.mk | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index ee07c22495..cb648f87a9 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -49,6 +49,20 @@ ifneq ($(BR2_PACKAGE_CONTAINERD_CRI),y)
>   CONTAINERD_TAGS += no_cri
>   endif
>   
> +ifeq ($(BR2_aarch64),y)
> +# Go forces use of the Gold linker on aarch64 due to a bug in BFD that
> +# is fixed in Binutils >= 2.41 (so all versions provided by
> +# Buildroot). Forcing Gold will break with toolchains that don't
> +# provide it, so override the flag and use BFD.
> +# See: https://github.com/golang/go/issues/22040
> +CONTAINERD_EXTLDFLAGS += -fuse-ld=bfd
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +# Go exe build with PIE doesn't work with musl.
> +# See: https://github.com/golang/go/issues/17847
> +CONTAINERD_EXTLDFLAGS += -Wl,--no-pie
> +endif
> +endif
> +
>   define CONTAINERD_INSTALL_INIT_SYSTEMD
>   	$(INSTALL) -D -m 0644 $(@D)/containerd.service \
>   		$(TARGET_DIR)/usr/lib/systemd/system/containerd.service

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
