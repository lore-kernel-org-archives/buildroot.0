Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D694CD4F26
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 11:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1D4940535;
	Sat, 20 Jun 2026 11:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIoaGD4Jxffa; Sat, 20 Jun 2026 11:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D776440556
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781954620;
	bh=1mBh8F3p6+H6H+QltcypCxZneGSaL8s70KJibOZqj8w=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ajPZiJa3qYYFTSJyJ6p/P7fFc+AtW6SyG+pDO5L9DgPp3yDgRx3ioaYjCV4dVd89G
	 Cug1PoujaET3hTpxbE7jgIsVOjqc6vkDGjMPzAYd29dNzr9Xu37iXaNfAgswdyJUqO
	 ywnjgytOMOTp3vvO5yFjqIZVht6+3LRBi85MhMN78sl9Mrz8nahwUlEF81PBm4xn+5
	 zqptcEKu6LXATU4wR09SR82GFdJYYGIsi07yZQuUn57suvlPwyHs1LeoLPC8+gYtnp
	 bJUZ9R3dM8eDYL9Juq6m8//ax3kzFbBCILKDJuXd8wyGdyJ6fJEOUIqqWPlNAgeovn
	 Sc8MGZCyipIfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D776440556;
	Sat, 20 Jun 2026 11:23:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66501367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 11:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4453B40556
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 11:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOn9p8MiZjNg for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 11:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC85E40535
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC85E40535
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC85E40535
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 11:23:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1xSrQh1TMC-013UyU; Sat, 20
 Jun 2026 13:23:35 +0200
Message-ID: <9cd435ae-5de6-40f8-b584-bf97018f4fcf@gmx.de>
Date: Sat, 20 Jun 2026 13:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260620053330.7619-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260620053330.7619-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:Qf5/2GEhJ5bbvpDmogu3aixElpWMZ35J3F6t8Jw385MDWuL/dva
 V7j2AbXxB1H2vF3vFlSfX+MMcKto0j6FoGi9+c58+46zKLfgvTI8ZN/IPmCRTlZRHv58F/X
 HPYGzcbMi8Uom9Jobayowc7KYypAoHgCZIIR2i/i/clpaGkTZmJd4l5u6577iz63Qkqq98R
 dWUakHM7lsaYDGDDrDVhQ==
UI-OutboundReport: notjunk:1;M01:P0:OcYKkYDfBX8=;6aCcha3BmZra6lL5wzNzFdNJ5ZP
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781954615; x=1782559415; i=fiona.klute@gmx.de;
 bh=nawykigA4IV/ByA2NNKsRwBJE9SzwAa2GQVRCt34E1Y=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=DZjcTUs2p9jwLQitw6dAeB1dkV/59/vwIxtSaVSdEJVDr9oPFVyYC76KmHF25IX5
 dAr17tb+1Pyun87gMKnbr5mh1OLgtzVT8fYZvXdbQn+40AXjfAGjACPEPhDxUvxlv
 LUzg90qN5YaCKOl5iyHMf1LLc/JxgQ11duvckt/T1Lg6RLdeqFOiCqL+8SSCBQzvp
 z5j3jyJqmO/eoTEUL/NN/PHpZibnuSGFXKoDAxnIwZBQVadTl1I+g6gbZVDdfhHMo
 9sUpgNar24NZ90E9e9Hmil/Py4sb6v0czmuLSj6X2Sl07/wqM4ZIMX/ZJUHipJB96
 fgVZkHL37T2e1cYTyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=DZjcTUs2
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.6.x, 6.1.x, 5.15.x, 5.10.x, 7.1.x, 7.0.x, 6.18.x series
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 20.06.26 um 07:33 schrieb Bernd Kuhls:
> Update the latest kernel releases to:
>   - 7.1 -> 7.1.1
>   - 7.0.12 -> 7.0.13
>   - 6.18.35 -> 6.18.36
>   - 6.12.93 -> 6.12.94
>   - 6.6.142 -> 6.6.143
>   - 6.1.175 -> 6.1.176
>   - 5.15.209 -> 5.15.210
>   - 5.10.258 -> 5.10.259
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Accepted into master, thank you!

> ---
>   linux/{7.1 => 7.1.1}                         |  0
>   linux/Config.in                              |  2 +-
>   linux/before-6.17/linux.hash                 | 10 +++++-----
>   linux/from-6.17/linux.hash                   |  6 +++---
>   package/linux-headers/{5.10.258 => 5.10.259} |  0
>   package/linux-headers/{5.15.209 => 5.15.210} |  0
>   package/linux-headers/{6.1.175 => 6.1.176}   |  0
>   package/linux-headers/{6.12.93 => 6.12.94}   |  0
>   package/linux-headers/{6.18.35 => 6.18.36}   |  0
>   package/linux-headers/{6.6.142 => 6.6.143}   |  0
>   package/linux-headers/{7.0.12 => 7.0.13}     |  0
>   package/linux-headers/{7.1 => 7.1.1}         |  0
>   package/linux-headers/Config.in.host         | 16 ++++++++--------
>   13 files changed, 17 insertions(+), 17 deletions(-)
>   rename linux/{7.1 => 7.1.1} (100%)
>   rename package/linux-headers/{5.10.258 => 5.10.259} (100%)
>   rename package/linux-headers/{5.15.209 => 5.15.210} (100%)
>   rename package/linux-headers/{6.1.175 => 6.1.176} (100%)
>   rename package/linux-headers/{6.12.93 => 6.12.94} (100%)
>   rename package/linux-headers/{6.18.35 => 6.18.36} (100%)
>   rename package/linux-headers/{6.6.142 => 6.6.143} (100%)
>   rename package/linux-headers/{7.0.12 => 7.0.13} (100%)
>   rename package/linux-headers/{7.1 => 7.1.1} (100%)
> 
> diff --git a/linux/7.1 b/linux/7.1.1
> similarity index 100%
> rename from linux/7.1
> rename to linux/7.1.1
> diff --git a/linux/Config.in b/linux/Config.in
> index b328d87de1..e79708d6d0 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "7.1" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "7.1.1" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
> index 4ebc486eac..688b99ded6 100644
> --- a/linux/before-6.17/linux.hash
> +++ b/linux/before-6.17/linux.hash
> @@ -1,10 +1,10 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  492648a87c0b69c5ac7f43be64792b9000e3439550d4e82e4a14710c49094fa3  linux-6.12.93.tar.xz
> -sha256  b2f6607a75cd27b2e368cf2d25e1637e1e0da9dfed4cda536658879eee6f2b70  linux-6.6.142.tar.xz
> -sha256  37e984a9e449eb15023b3063c3fd6f64fdd1d83af5bb6a944cd7244f40beca85  linux-6.1.175.tar.xz
> +sha256  e998a232b9418db3301cb58468e291a4f41d6ab8306029b30d991f56251dc8d2  linux-6.12.94.tar.xz
> +sha256  dace1f8dc9c0dbf5df14f47e3229cd62c298e83049681731ef229f2ba7592932  linux-6.6.143.tar.xz
> +sha256  aa19772dba40e9737356c00d0671cdedbe26cc895eff062868f0a1f688ae44f6  linux-6.1.176.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  346d77c7eac2cd8d719a2530b4f858bf99bc956b25f80995fd214f8aef821eb4  linux-5.15.209.tar.xz
> -sha256  9e7ccb1efc5796e6f8398b778a8b25f7e227e7c54ef5caf6377b8c37d66fb4e5  linux-5.10.258.tar.xz
> +sha256  910ba46ae15e7495a9624f89d7f11b24ccc8bc1ee4b3abdd502e75b055290a01  linux-5.15.210.tar.xz
> +sha256  aa5e8e580a555e55176658b78fb6759f9c84654462b735119d4e819b5c46b609  linux-5.10.259.tar.xz
>   # Locally computed
>   sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
>   sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index 9aa69b6e96..33ee9dc232 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,9 +1,9 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
> -sha256  691f44797fbe790dc8a321604c927087526ad27b6d649925d60f8eed0a2564a0  linux-7.1.tar.xz
> -sha256  57edc9a41efc1ca6b797afa8f4a587a30da2af6bca7356eb56e1e1a4ada265da  linux-7.0.12.tar.xz
> +sha256  5215fa3541dc7e7f5bcd51bf7e57f169cec6fce508ca54e3dc85fdee14371d7d  linux-7.1.1.tar.xz
> +sha256  3c81edd0f716aca3dd48dff691681827580cc53d35a8eec3be47d346d1f89913  linux-7.0.13.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  f78602932219125e211c5f5bfd84edcfd4ec5ce88fc944f8248413f665bef236  linux-6.18.35.tar.xz
> +sha256  fbab86c9f471c81075b280cca30bd85d790c060063a1245859b6344b07c9c44e  linux-6.18.36.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/5.10.258 b/package/linux-headers/5.10.259
> similarity index 100%
> rename from package/linux-headers/5.10.258
> rename to package/linux-headers/5.10.259
> diff --git a/package/linux-headers/5.15.209 b/package/linux-headers/5.15.210
> similarity index 100%
> rename from package/linux-headers/5.15.209
> rename to package/linux-headers/5.15.210
> diff --git a/package/linux-headers/6.1.175 b/package/linux-headers/6.1.176
> similarity index 100%
> rename from package/linux-headers/6.1.175
> rename to package/linux-headers/6.1.176
> diff --git a/package/linux-headers/6.12.93 b/package/linux-headers/6.12.94
> similarity index 100%
> rename from package/linux-headers/6.12.93
> rename to package/linux-headers/6.12.94
> diff --git a/package/linux-headers/6.18.35 b/package/linux-headers/6.18.36
> similarity index 100%
> rename from package/linux-headers/6.18.35
> rename to package/linux-headers/6.18.36
> diff --git a/package/linux-headers/6.6.142 b/package/linux-headers/6.6.143
> similarity index 100%
> rename from package/linux-headers/6.6.142
> rename to package/linux-headers/6.6.143
> diff --git a/package/linux-headers/7.0.12 b/package/linux-headers/7.0.13
> similarity index 100%
> rename from package/linux-headers/7.0.12
> rename to package/linux-headers/7.0.13
> diff --git a/package/linux-headers/7.1 b/package/linux-headers/7.1.1
> similarity index 100%
> rename from package/linux-headers/7.1
> rename to package/linux-headers/7.1.1
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 0b02c183c1..a890c8f161 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -476,14 +476,14 @@ endchoice
>   
>   config BR2_DEFAULT_KERNEL_HEADERS
>   	string
> -	default "5.10.258"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.209"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.175"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.142"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.93"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.35"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.0.12"	if BR2_KERNEL_HEADERS_7_0
> -	default "7.1"		if BR2_KERNEL_HEADERS_7_1
> +	default "5.10.259"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.210"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.176"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.6.143"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.94"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.18.36"	if BR2_KERNEL_HEADERS_6_18
> +	default "7.0.13"	if BR2_KERNEL_HEADERS_7_0
> +	default "7.1.1"		if BR2_KERNEL_HEADERS_7_1
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
