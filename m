Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29120C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 17:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF77840120;
	Thu, 15 Feb 2024 17:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5GILXmLrs2j; Thu, 15 Feb 2024 17:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A15F40163
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A15F40163;
	Thu, 15 Feb 2024 17:58:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65ECA1BF33D
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53A9C60F8D
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grq8j2sdq0Oq for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 17:58:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2831D60E0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2831D60E0A
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2831D60E0A
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 17:58:52 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id afzSrMfbya6zwag0Yrd4zc; Thu, 15 Feb 2024 18:58:50 +0100
Message-ID: <67a04065-f77b-4846-b331-c5092f2b5afc@benettiengineering.com>
Date: Thu, 15 Feb 2024 18:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20240214233028.1226645-1-kilian.zinnecker@mail.de>
 <20240214233028.1226645-3-kilian.zinnecker@mail.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240214233028.1226645-3-kilian.zinnecker@mail.de>
X-CMAE-Envelope: MS4xfIN6owCuwPwE2r7urV2B8UTSiYt3kqCMnqH8Lz9aRjhYgy+nA8gcZKYY0ZKJWfXKhgiVyYXkoh+fPZKhF6qyU1XYVUYRMeR5xsajPZi40sErEgigbqzz
 je65tiRHOfL5hOVdyoAs/1FN/wb0Nzpv0KEkmbjEyOWI9h/S7ReT1aFEHJd99ElMWnzCTzhH8Fv0FMWYtIpJn9Ixul4WYD3I9HBpPHiIbUfzp81mGUBGafG2
 BX5SXBoLyDOoXukC6pINDEnCfoWAJKK0ft9G5sqhHImRRotsp/053peCnAh1pb83/jcSly2BM85q7gCNblYPB16H1CYtQy5gpZv9RjlXaVY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708019930; bh=ZKNtIK3a+GnoVX3mxlN3lLAF6LNMBnmjc+lgcifD0/A=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=fOfABGl09MqcoQyLIoLUWNg4Fzx7VSj2MAwsEZLpjXtVCovkf42MKW+pkwV2RVS1b
 YF5a//zlDyLkeNHIvty8zOwpokXYBtw2W5BBpj+wWzhn5zgKWrWFci8NdLXYeKB240
 QJqTXGKL0X0O1FX3GbjAHdB82jSy6fRwOE/Yfot+wEy8Glrv6Thi2TYiMYJ6902Jh1
 xX4GxFQzZ4Fd+rg0HESZpDNKs2HsTE255cLSxTxgV59GV4pHv9LyH6XTnGmalyCgZi
 9cEm5MiScj/J2jZWA7MC9PbILYrFSLAqQ9Mgv8XXlKXZAsP0kUU6WgiumZEi/vz3Ma
 hibhswo5f/oEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fOfABGl0
Subject: Re: [Buildroot] [PATCH v4 2/3] package/xuantie-bins: new package
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

On 15/02/24 00:30, Kilian Zinnecker wrote:
> This patch adds a package for Xuantie binary blobs. The binary
> blobs are needed for the BeagleV-Ahead's SoC (TH1520). They contain
> an FPGA binary for power management and a binary for the audio
> system.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

looks good to me:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   DEVELOPERS                             |  1 +
>   package/Config.in                      |  1 +
>   package/xuantie-bins/Config.in         |  8 ++++++++
>   package/xuantie-bins/xuantie-bins.hash |  2 ++
>   package/xuantie-bins/xuantie-bins.mk   | 19 +++++++++++++++++++
>   5 files changed, 31 insertions(+)
>   create mode 100644 package/xuantie-bins/Config.in
>   create mode 100644 package/xuantie-bins/xuantie-bins.hash
>   create mode 100644 package/xuantie-bins/xuantie-bins.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b75a92739a..e9a9910d69 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1899,6 +1899,7 @@ F:	board/radxa/rock5b/
>   F:	configs/avnet_rzboard_v2l_defconfig
>   F:	configs/rock5b_defconfig
>   F:	package/rockchip-rkbin/
> +F:	package/xuantie-bins/
>   
>   N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>   F:	package/wqy-zenhei/
> diff --git a/package/Config.in b/package/Config.in
> index bf0fe078b9..b35cbc4038 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -656,6 +656,7 @@ endmenu
>   	source "package/wipe/Config.in"
>   	source "package/xorriso/Config.in"
>   	source "package/xr819-xradio/Config.in"
> +	source "package/xuantie-bins/Config.in"
>   endmenu
>   
>   menu "Interpreter languages and scripting"
> diff --git a/package/xuantie-bins/Config.in b/package/xuantie-bins/Config.in
> new file mode 100644
> index 0000000000..18f5df1453
> --- /dev/null
> +++ b/package/xuantie-bins/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_XUANTIE_BINS
> +	bool "xuantie-bins"
> +	depends on BR2_riscv
> +	help
> +	  This package provides binary blobs, needed for the
> +	  BeagleV-Ahead's SoC (TH1520). They contain an FPGA binary
> +	  (light_aon_fpga.bin) for power management and a binary for
> +	  the audio system (light_c906_audio.bin).
> diff --git a/package/xuantie-bins/xuantie-bins.hash b/package/xuantie-bins/xuantie-bins.hash
> new file mode 100644
> index 0000000000..5531a54617
> --- /dev/null
> +++ b/package/xuantie-bins/xuantie-bins.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  92d2fee4688dc0598329d56cf7962f344d30b70e261a4cd9939b0912f06df26a  xuantie-bins-1.2.1.tar.gz
> diff --git a/package/xuantie-bins/xuantie-bins.mk b/package/xuantie-bins/xuantie-bins.mk
> new file mode 100644
> index 0000000000..bccfc9587d
> --- /dev/null
> +++ b/package/xuantie-bins/xuantie-bins.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# xuantie-bins
> +#
> +################################################################################
> +
> +XUANTIE_BINS_VERSION = 1.2.1
> +XUANTIE_BINS_SITE = $(call github,beagleboard,xuantie-ubuntu,beaglev-$(XUANTIE_BINS_VERSION))
> +XUANTIE_BINS_LICENSE = PROPRIETARY
> +
> +XUANTIE_BINS_INSTALL_IMAGES = YES
> +XUANTIE_BINS_INSTALL_TARGET = NO
> +
> +define XUANTIE_BINS_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/bins/light_aon_fpga.bin
> +	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/bins/light_c906_audio.bin
> +endef
> +
> +$(eval $(generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
