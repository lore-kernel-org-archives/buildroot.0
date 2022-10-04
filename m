Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4A8C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 23:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2070C410D0;
	Tue,  4 Oct 2022 23:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2070C410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxFU59IRIPJN; Tue,  4 Oct 2022 23:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA2B7410C2;
	Tue,  4 Oct 2022 23:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA2B7410C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2CA41BF45A
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 23:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A72F824CB
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 23:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A72F824CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aumXZizLy_02 for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 23:15:14 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42DF282443
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42DF282443
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 23:15:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.95,158,1661788800"; d="scan'208";a="213398433"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Oct 2022 07:08:06 +0800
IronPort-SDR: uTtGz77CarMkPG7xQmsFesF4izuWxf2GAniGIETEoxIy2YD7zdwQj9M8zoZpl7y9cxLU4PWIDM
 j1HAw1pDVTJkiyYHZ82RYRLDZ1bLJt2R7MV+wet02KkrkqwIRKEPr3NHejASwluA+QdV5gzAqf
 tQ6ry7tySnoAo3wTgzI8daY/GB6UF2n+eMvjvDou2tcvDP1J20v8ysmMwVbiuD2xDGw7/bIxa4
 5hToyzcIAD6UUht7YpKW9bKev0E1DNRbjSqBp6qCAHOW7a+sv+emvXUlP4+XQq1uPYgIhGCpiP
 2+PiSWcLSDazJ1c0AsxK16h2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 15:27:54 -0700
IronPort-SDR: g03cNzTij5A/fi71Oz5qwcjeRPdfX6vio/l7OtCR/+0O9XFrxXqVaJadA+p4tOq2XWFufjIAXz
 5/sDkCAXffIpl8FnE90FVCQe3JyJzlHACbfgNpyQQFpeSR7XeDQQeNpPPF3gMmOrvTD2eBT7ap
 CU0/ycHiqqHMkjysDNCCO/tFHQ2wxT/f08/jBh7Mgh/G24vokqFo4pnRmXh3dQP4cNb7k4liDZ
 zpM1qgK0VmjuhN2VMiQPanpSppUQNsEYTVBTEy9YPTRxDM+qtdxa3XYtxPEkTE6wM9XoGMn4Nq
 gGo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 16:08:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MhtfF6lMSz1RvTp
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 16:08:05 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5-a4nOGr6jmH for <buildroot@buildroot.org>;
 Tue,  4 Oct 2022 16:08:05 -0700 (PDT)
Received: from [10.225.163.106] (unknown [10.225.163.106])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MhtfD5LQxz1RvLy;
 Tue,  4 Oct 2022 16:08:04 -0700 (PDT)
Message-ID: <3cab481c-afd3-cbe1-835b-7c6807195b00@opensource.wdc.com>
Date: Wed, 5 Oct 2022 08:08:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20221004195039.931947-1-peter@korsgaard.com>
 <20221004195039.931947-9-peter@korsgaard.com>
Organization: Western Digital Research
In-Reply-To: <20221004195039.931947-9-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664925314; x=1696461314;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uAKuYI6Rao9oIw/BGy1eVL0IeIPTTRENDBR9sUnYsMY=;
 b=iSjk5g36D41ujZZIAS6FCh4a6EV6QtQhlkQTWC21IC//F5Fk/105XB0X
 ZpDZoIg8aTn+xU/ltAtbdd1mIh8RyDJTl66ZKg5TMtBmuYKa++VudpmPY
 Cw6odDa7O2qCxorA6imvkA/0iD3KDMnr8qllrU3/7IWbvew84WanaN/1B
 xYEo7jwDV7dznjclH4vPKyLmyDSiZfYRJEATUguDndPu4ZcW+3bfNQvqn
 DkL6ToaSGhXSi4Jl4xP8j2LkPX2i7GLhg35gwllvTza0widrcpNs5ZQTg
 VJ8keBIaeVAGmYH260l5mF/5Zj2NuD7qvLRf0oAzbr/vg7J9ytSRSaDDx
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1664924885; x=1667516886; bh=uAKuYI6Rao9oIw/BGy1eVL0IeIPTTRENDBR
 9sUnYsMY=; b=tmoZFztnYRrnDERAz5D+Xq45667C7aspROaeWu1PG6B3Y58zR6u
 196nIUxNzYOOsM5+4IwLK61bwQRWS9V2D0RSiZBxHUL+Nq/tZnJe+aavTarlwl0O
 8h6HnYjj2Q4CR+L5OXywPKIdloTlG5gUtnMqin+le3CUQKKVId8LIaN4nOugHkAP
 iExW+3JeDIXj4HY4DO6VbtBzQUhF924TJlFZ/I2dusL6DPIM4tiwUt1LODein7rP
 boXrDq1D6DUe0ttwopBLl8gJaZ96+FdsME/QZE8DGFLx7Sy+9P6/B5vag/0RIKyB
 swWC14XbyO62f7nMJHPdLlE/1EBbMmJ3wjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=iSjk5g36; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim
 header.b=tmoZFztn
X-Mailman-Original-Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
Subject: Re: [Buildroot] [PATCH 09/11] configs/{canaan,
 sipeed_maix}*: specify kernel headers version
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/5/22 04:50, Peter Korsgaard wrote:
> The defconfigs use a 5.19 kernel, so specify 5.19 kernel headers now that is
> available.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> ---
>  configs/canaan_kd233_defconfig            | 3 +++
>  configs/sipeed_maix_bit_defconfig         | 3 +++
>  configs/sipeed_maix_bit_sdcard_defconfig  | 3 +++
>  configs/sipeed_maix_dock_defconfig        | 3 +++
>  configs/sipeed_maix_dock_sdcard_defconfig | 3 +++
>  configs/sipeed_maix_go_defconfig          | 3 +++
>  configs/sipeed_maix_go_sdcard_defconfig   | 3 +++
>  configs/sipeed_maixduino_defconfig        | 3 +++
>  configs/sipeed_maixduino_sdcard_defconfig | 3 +++
>  9 files changed, 27 insertions(+)
> 
> diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
> index 3aa5dccf08..77b8abf531 100644
> --- a/configs/canaan_kd233_defconfig
> +++ b/configs/canaan_kd233_defconfig
> @@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> +# Linux headers same as kernel, a 5.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +
>  # Binary format
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
> index d2bac9e0b8..d73ba0266a 100644
> --- a/configs/sipeed_maix_bit_defconfig
> +++ b/configs/sipeed_maix_bit_defconfig
> @@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> +# Linux headers same as kernel, a 5.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +
>  # Binary format
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
> index e1c9dc417e..8a19996090 100644
> --- a/configs/sipeed_maix_bit_sdcard_defconfig
> +++ b/configs/sipeed_maix_bit_sdcard_defconfig
> @@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> +# Linux headers same as kernel, a 5.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +
>  # System
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
> index a7f0441e53..ccb563310e 100644
> --- a/configs/sipeed_maix_dock_defconfig
> +++ b/configs/sipeed_maix_dock_defconfig
> @@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> +# Linux headers same as kernel, a 5.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +
>  # Binary format
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
> index 6b7f8d9c68..d3d0f405e1 100644
> --- a/configs/sipeed_maix_dock_sdcard_defconfig
> +++ b/configs/sipeed_maix_dock_sdcard_defconfig
> @@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> +# Linux headers same as kernel, a 5.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +
>  # System
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
> index a68f9d3b72..c3bcf98f81 100644
> --- a/configs/sipeed_maix_go_defconfig
> +++ b/configs/sipeed_maix_go_defconfig
> @@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> +# Linux headers same as kernel, a 5.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +
>  # Binary format
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
> index a127872cd8..75300997b8 100644
> --- a/configs/sipeed_maix_go_sdcard_defconfig
> +++ b/configs/sipeed_maix_go_sdcard_defconfig
> @@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> +# Linux headers same as kernel, a 5.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +
>  # System
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
> index c52adb5db7..a30596af92 100644
> --- a/configs/sipeed_maixduino_defconfig
> +++ b/configs/sipeed_maixduino_defconfig
> @@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> +# Linux headers same as kernel, a 5.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +
>  # Binary format
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
> index baaa2bc7bb..add9369747 100644
> --- a/configs/sipeed_maixduino_sdcard_defconfig
> +++ b/configs/sipeed_maixduino_sdcard_defconfig
> @@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> +# Linux headers same as kernel, a 5.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +
>  # System
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
