Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CA7C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC60460B27;
	Tue,  6 Feb 2024 16:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC60460B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLKA7fqZbctt; Tue,  6 Feb 2024 16:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B8E160586;
	Tue,  6 Feb 2024 16:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B8E160586
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 969551BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EE9442037
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EE9442037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5DnMm7yXw7h for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:56:10 +0000 (UTC)
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D34BE42010
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D34BE42010
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XOjurLaDOoTDCXOjvr1YcL; Tue, 06 Feb 2024 17:56:07 +0100
Message-ID: <08b6187c-94f2-4cbc-b0e8-0066ca687796@benettiengineering.com>
Date: Tue, 6 Feb 2024 17:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kilian.zinnecker@mail.de, buildroot@buildroot.org
References: <20231204231212.36450-1-kilian.zinnecker@mail.de>
 <20231204231212.36450-2-kilian.zinnecker@mail.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231204231212.36450-2-kilian.zinnecker@mail.de>
X-CMAE-Envelope: MS4xfOywZkBy1aCFcW0MZ2q/DrE+0kxSpNU9ZvKteYf2clWmwWRJEcQj6vP99mmba6LSNh1NPYd30WDOZYthFU79wLHmj/pWxL3gdRUDKq97HpvcNNppLDi1
 uD02sUygrSuq2lPZQIyMzxQbtX+nj9kRaPIFE1jEJqsjWvHFD9EredEqoXjkEXLA6GXbLVLDnKGjmf0yi1kpoEgHR+a78qSALKQtRQihNqKnKKydPGrM+gmC
 X6SbK80mTyrSddVYfgGLsvvcTOkLvu292TNzyO0uA9NqUrL1KeqKVOeutL2eqZBnvKB4/exqx3UwGzUWvV4+5LsrVqAJsxqMf8Sux/DSPX0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707238567; bh=wS/knIX5aEENR2dNtUGhVbn9kFZYKRcYI9gBS5es70s=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=GW1o8I+P7z83rv7nf5shfBIc8reuPPYZ1/nfUVBHNKTBLepAPd8hVHOrBLUz99s7u
 UvisL7zqoQSebY4njzqFacv59Wj70+Heh+yNqbqtrIP2TpIOzCyJOJ7Il25b5I0MlX
 0kA5XMRh/0ZRR9FmrCKu1LKJ8HAt1ieNKbSZS9RHhRy0IQvsf73QxOFqTAgQAReVte
 EJ7+lTAnqHKUjn1+k1groU80RsJEPTE3+GQHiM62QrMqvSGPz8XKdEStMfuso4iuTe
 auGyyA9pbJs8VE5zwIeBiZ+149Y7AT6+HZCTIs1j5vCVLHcNQEls6PtM/SLM/bMmdw
 5VyHBuPR774XA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=GW1o8I+P
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xuantie-bins: new package
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
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yegor, Kilian,

On 05/12/23 00:12, yegorslists--- via buildroot wrote:
> From: Kilian Zinnecker <kilian.zinnecker@mail.de>
> 
> This patch adds a package for Xuantie binary blobs. These binaries
> are needed for the BeagleV-Ahead.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>   DEVELOPERS                             |  5 +++--
>   package/Config.in                      |  1 +
>   package/xuantie-bins/Config.in         |  6 ++++++
>   package/xuantie-bins/xuantie-bins.hash |  1 +
>   package/xuantie-bins/xuantie-bins.mk   | 27 ++++++++++++++++++++++++++
>   5 files changed, 38 insertions(+), 2 deletions(-)
>   create mode 100644 package/xuantie-bins/Config.in
>   create mode 100644 package/xuantie-bins/xuantie-bins.hash
>   create mode 100644 package/xuantie-bins/xuantie-bins.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f504ca8d36..4d18bc49d4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1839,9 +1839,10 @@ N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
>   F:	package/libcamera/
>   
>   N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
> -F:	package/rockchip-rkbin/
> -F:	configs/rock5b_defconfig
>   F:	board/radxa/rock5b/
> +F:	configs/rock5b_defconfig

can you please provide a separate patch to alphabetize?

> +F:	package/rockchip-rkbin/
> +F:	package/xuantie-bins/
>   
>   N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>   F:	package/wqy-zenhei/
> diff --git a/package/Config.in b/package/Config.in
> index fcc09b07c4..3772e2ac81 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -653,6 +653,7 @@ endmenu
>   	source "package/wipe/Config.in"
>   	source "package/xorriso/Config.in"
>   	source "package/xr819-xradio/Config.in"
> +	source "package/xuantie-bins/Config.in"
>   endmenu
>   
>   menu "Interpreter languages and scripting"
> diff --git a/package/xuantie-bins/Config.in b/package/xuantie-bins/Config.in
> new file mode 100644
> index 0000000000..a04497ce6b
> --- /dev/null
> +++ b/package/xuantie-bins/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_XUANTIE_BINS
> +	bool "xuantie-bins"
> +	depends on BR2_riscv
> +	help
> +	  This package provides binary blobs, needed for the
> +	  BeagleV-Ahead's SoC (TH1520).

Can you please describe a bit what those binaries are meant for?

> diff --git a/package/xuantie-bins/xuantie-bins.hash b/package/xuantie-bins/xuantie-bins.hash
> new file mode 100644
> index 0000000000..4d1ec297c9
> --- /dev/null
> +++ b/package/xuantie-bins/xuantie-bins.hash
> @@ -0,0 +1 @@
> +sha256  608e9fec79823996004f65ba692a76d741307b0de23552d147ad1b567e7054dc  xuantie-bins-0a2e02bb53758cc12448d8670e65c854528a96b4-br1.tar.gz
> diff --git a/package/xuantie-bins/xuantie-bins.mk b/package/xuantie-bins/xuantie-bins.mk
> new file mode 100644
> index 0000000000..3a5611cf36
> --- /dev/null
> +++ b/package/xuantie-bins/xuantie-bins.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# xuantie-bins
> +#
> +################################################################################
> +
> +XUANTIE_BINS_VERSION = 0a2e02bb53758cc12448d8670e65c854528a96b4
> +XUANTIE_BINS_SITE = https://github.com/beagleboard/xuantie-ubuntu.git
> +XUANTIE_BINS_SITE_METHOD = git
> +XUANTIE_BINS_LICENSE = PROPRIETARY
> +
> +XUANTIE_BINS_INSTALL_IMAGES = YES
> +XUANTIE_BINS_INSTALL_TARGET = NO
> +
> +XUANTIE_BINS_FPGA_BIN_FILENAME = "bins/light_aon_fpga.bin"
> +XUANTIE_BINS_AUDIO_BIN_FILENAME = "bins/light_c906_audio.bin"
> +
> +define XUANTIE_BINS_INSTALL_IMAGES_CMDS
> +	$(foreach f, \
> +		$(XUANTIE_BINS_FPGA_BIN_FILENAME) \
> +		$(XUANTIE_BINS_AUDIO_BIN_FILENAME) \
> +		, \
> +		$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/$(f)
> +	)
> +endef

Being only 2 files to be installed I'd prefer to see 2 lines instead of
foreach loop. Can you please change it accordingly?

Thank you
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
