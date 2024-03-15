Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A81C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 20:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 615B760F20;
	Fri, 15 Mar 2024 20:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mRs7bB6s089; Fri, 15 Mar 2024 20:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B19DE60F75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B19DE60F75;
	Fri, 15 Mar 2024 20:31:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D85B1BF30A
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 20:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A9A160F36
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 20:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1HpZLJE2ssFJ for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 20:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD2F160F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD2F160F8C
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD2F160F8C
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 20:31:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33e5978fc1bso1258315f8f.3
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 13:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710534686; x=1711139486;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+CyWRwY3VcE3LSuMzvYTf2VbPqolnuV5/MEOWBCHL/U=;
 b=PIpQ6CrFYR+JNFfQQcfefGV7A1Kwkzn4+DxJEEXqIdPWgXF/r0X1D4Nbd94T03DkIN
 1tCODjNEXHvixvRrqsK8akVj72qxjI3zZyop6VV+qPMcGVvmADL8TJkXe1vJQ/O0No6K
 qvrbQK2pmPP8uNdz7GDE4nKTUewaSDw3JHNcWntl1ufXaLSwmiwtQOFb6LcIVoT52ObV
 yc2445mKxnP8MRhoi1ctsLJv1r28mvAd3QBDuK7uFVKoNv60pTYsCYj8kfbeWm4ta3Gc
 WzJvEM/gI5KjFCrExIQ/xEyVNZdtHOswcbdrB3LpPWq+zcPSmscjJ5L1uzYrTOqG1lO1
 kAwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7AVfQQ9rkyTWFrNZaoWgBFR7jc3XZ39JA/DK+x88GUjKfje+fCMS2yaoheexjMOTAdrb73dQBcmEeZFp8jzgQcE5WmykpnQ==
X-Gm-Message-State: AOJu0YwAIpnI5NaXcqs4T2HMjo5ykDclhREUVhmJ26HKOD48FC4RNOI3
 BK0I47bGrkufoL4xu0033u1wUx8inKd5tIGMGxbFK/bRSOsF4tto08cMrwIjVufnhJr92J3d28h
 k
X-Google-Smtp-Source: AGHT+IExnLTzUEAJa59n+cUSUBMt2PmYx2CsUORW7sJDsz+5ZzLeYMdNS0t8oBo7xg5p+oJd23zadg==
X-Received: by 2002:a5d:4252:0:b0:33b:62c0:6181 with SMTP id
 s18-20020a5d4252000000b0033b62c06181mr3975968wrr.42.1710534685723; 
 Fri, 15 Mar 2024 13:31:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a5d58d7000000b0033ec5ca5665sm3908777wrf.95.2024.03.15.13.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 13:31:24 -0700 (PDT)
Message-ID: <c9c83001-b3a9-4c45-91d0-024f43c76125@mind.be>
Date: Fri, 15 Mar 2024 21:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
References: <20240313161939.3295928-1-festevam@gmail.com>
In-Reply-To: <20240313161939.3295928-1-festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710534686; x=1711139486; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+CyWRwY3VcE3LSuMzvYTf2VbPqolnuV5/MEOWBCHL/U=;
 b=EupROg3E9inLJiGjDjYmfgMC9dCNdmtb8+eHZ6e2uIK7UorGTQdQsJ0WdwBOCRh8tM
 1KPSAerFBDdzy3Y1TCMfCRCz9aPfHby0HhGe8TTD8mg4tLOGVpb/gx5fmb5x/wk+5Xwz
 VFu0tD2cKB8q6GkfWMgJyN1jszIZ3KZm/LHbnYLd1GRDnM+trZYRQqSKX+VU9LMk9ZMY
 JPhtE1Nyi/dufF/ZmHDfWW4RZlqWVNh3fNkJ0yNHPPh+lRmNyBBwIb8toILvosn13FzO
 qbGMxxiD+d/DEN0XtcAvvzbLJ/WhB5uOUIUrbgNvy/QYtS+cNf/RtHBHLlYOLtxalsk1
 aRdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EupROg3E
Subject: Re: [Buildroot] [PATCH] configs/imx7d-sdb: bump the kernel version
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2024 17:19, Fabio Estevam wrote:
> Bump the kernel version to 6.6.21.
> 
> Also pass the nxp/imx/ path due to the devicetree reorganization
> in kernel 6.6.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/imx7d-sdb_defconfig | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
> index cf4da342c150..e7f3df81568a 100644
> --- a/configs/imx7d-sdb_defconfig
> +++ b/configs/imx7d-sdb_defconfig
> @@ -3,8 +3,8 @@ BR2_arm=y
>   BR2_cortex_a7=y
>   BR2_ARM_FPU_NEON_VFPV4=y
>   
> -# Linux headers same as kernel, a 6.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # system
>   BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> @@ -12,10 +12,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.34"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
>   BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
