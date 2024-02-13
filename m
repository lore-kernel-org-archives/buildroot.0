Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06047C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99034415DE;
	Tue, 13 Feb 2024 17:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIVn52Y_TUzx; Tue, 13 Feb 2024 17:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55F67409D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F67409D3;
	Tue, 13 Feb 2024 17:49:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7C31BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7E9D408C6
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdtRzvwBln_M for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:49:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FC79405EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC79405EB
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FC79405EB
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:49:05 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZwtzraGmFPNlaZwtzrykaw; Tue, 13 Feb 2024 18:49:03 +0100
Message-ID: <aa040b4f-bcc1-45a7-bace-c94e9dc2a113@benettiengineering.com>
Date: Tue, 13 Feb 2024 18:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20240211120857.6622-1-kilian.zinnecker@mail.de>
 <20240211120857.6622-2-kilian.zinnecker@mail.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240211120857.6622-2-kilian.zinnecker@mail.de>
X-CMAE-Envelope: MS4xfAeXkvzWeWIcwgC7rgHB8UXYno9TvUig2AXB/fOivTB/Ohf8LCFc4iJQ5x8V0k7p9Jhr3p4pRHAM26bIf5HHrNhDYD8mu5/Dfb1/qIPo6ZYzKZNhdG3K
 yC/EgHZ1A3OLhUq0Omze6n2be+XyHEc/Ec78y+LQdQmkXEF+WoMKmFqItoLjDS9LPH+MaKYnjZOXsy9kQY7HFjjrcO8XrStDBbK2oVxGFlEk/pR8FhqglMfz
 QSJdrTiEJzg4xbL4zdU1nRb+bj3j/Hx6ieznmGxuRLwae494KOeIxPrL48mGuO2tZ+AXNZ7jykXS0Sa8tnC/qAyyFt1hUffgeb4aYUeOucQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707846543; bh=io62Tk5w701g//ocfLML2vczriEUbEbZT/6Zz0w+ssA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=RPSdBpVclpKb5DxBgQbX4u7thIK4bO0yhTHQqMk8ttyVkaR5Pm/35J8BpBmrwLMuD
 X32AfOGBZOc6CkTFu+7+7T3T7XHEGXS4MpEKujQrm6+uyFexER79dQ9hMw7axXvChx
 W2r1FkAasm5v30lhTNPtaP0Cc5gcQ2sqnc06RvUnpvE12LhRuu5IGVhahzmNGpunMN
 /D0qBHWl9uOpHk9nlH9TSuUaioe1OXwaqtEOXKoPpU6Suvf9pU3H9XupD18nA80JU3
 ZkgUQLFjGCDE3Jmm4k9Efvncqzc1Xp5XxjR18OQjoZG4lUHR8cL4mx37hOQwvkph+M
 8mWu8DIpIdKug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=RPSdBpVc
Subject: Re: [Buildroot] [PATCH v3 1/2] package/xuantie-bins: new package
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

Hi Kilian,

On 11/02/24 13:08, Kilian Zinnecker via buildroot wrote:
> This patch adds a package for Xuantie binary blobs. These binaries
> are needed for the BeagleV-Ahead.

Please report here the same description you point in Config.in

> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>   DEVELOPERS                             |  1 +
>   package/Config.in                      |  1 +
>   package/xuantie-bins/Config.in         |  8 ++++++++
>   package/xuantie-bins/xuantie-bins.hash |  1 +
>   package/xuantie-bins/xuantie-bins.mk   | 23 +++++++++++++++++++++++
>   5 files changed, 34 insertions(+)
>   create mode 100644 package/xuantie-bins/Config.in
>   create mode 100644 package/xuantie-bins/xuantie-bins.hash
>   create mode 100644 package/xuantie-bins/xuantie-bins.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1c6c84b05b..fa0596fd6b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1894,6 +1894,7 @@ F:	board/radxa/rock5b/
>   F:	configs/rock5b_defconfig
>   F:	configs/avnet_rzboard_v2l_defconfig

Can you please send a patch to alphabetize the 2 lines above?

>   F:	package/rockchip-rkbin/
> +F:	package/xuantie-bins/
>   
>   N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>   F:	package/wqy-zenhei/
> diff --git a/package/Config.in b/package/Config.in
> index 91a6f1de00..5e28fb6e88 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -657,6 +657,7 @@ endmenu
>   	source "package/wipe/Config.in"
>   	source "package/xorriso/Config.in"
>   	source "package/xr819-xradio/Config.in"
> +	source "package/xuantie-bins/Config.in"
>   endmenu
>   
>   menu "Interpreter languages and scripting"
> diff --git a/package/xuantie-bins/Config.in b/package/xuantie-bins/Config.in
> new file mode 100644
> index 0000000000..40388edd06
> --- /dev/null
> +++ b/package/xuantie-bins/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_XUANTIE_BINS
> +	bool "xuantie-bins"
> +	depends on BR2_riscv
> +	help
> +	  This package provides binary blobs, needed for the
> +	  BeagleV-Ahead's SoC (TH1520). They contain an FPGA binary
> +          (light_aon_fpga.bin) for power management and a binary for
> +          the audio system (light_c906_audio.bin).

the 2 lines above have 4 useless empty spaces, please remove them

> diff --git a/package/xuantie-bins/xuantie-bins.hash b/package/xuantie-bins/xuantie-bins.hash
> new file mode 100644
> index 0000000000..4d1ec297c9
> --- /dev/null
> +++ b/package/xuantie-bins/xuantie-bins.hash
> @@ -0,0 +1 @@
> +sha256  608e9fec79823996004f65ba692a76d741307b0de23552d147ad1b567e7054dc  xuantie-bins-0a2e02bb53758cc12448d8670e65c854528a96b4-br1.tar.gz
> diff --git a/package/xuantie-bins/xuantie-bins.mk b/package/xuantie-bins/xuantie-bins.mk
> new file mode 100644
> index 0000000000..6db18685bc
> --- /dev/null
> +++ b/package/xuantie-bins/xuantie-bins.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# xuantie-bins
> +#
> +################################################################################
> +
> +XUANTIE_BINS_VERSION = 0a2e02bb53758cc12448d8670e65c854528a96b4
> +XUANTIE_BINS_SITE = https://github.com/beagleboard/xuantie-ubuntu.git
> +XUANTIE_BINS_SITE_METHOD = git

Here ^^^ please use github helper instead of this, like:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/openswan/openswan.mk#L8

> +XUANTIE_BINS_LICENSE = PROPRIETARY
> +
> +XUANTIE_BINS_INSTALL_IMAGES = YES
> +XUANTIE_BINS_INSTALL_TARGET = NO
> +
> +XUANTIE_BINS_FPGA_BIN_FILENAME = "bins/light_aon_fpga.bin"
> +XUANTIE_BINS_AUDIO_BIN_FILENAME = "bins/light_c906_audio.bin"

The 2 lines above are useless now since you use them only once so please
drop them

> +
> +define XUANTIE_BINS_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/$(XUANTIE_BINS_FPGA_BIN_FILENAME)
> +	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/$(XUANTIE_BINS_AUDIO_BIN_FILENAME)
> +endef
> +
> +$(eval $(generic-package))

Can you please send a V4 with such corrections?

Thank you

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
