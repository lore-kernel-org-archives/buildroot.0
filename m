Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7D4CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 14:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 794AC80EB5;
	Mon,  2 Sep 2024 14:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpdHWCRJTyYf; Mon,  2 Sep 2024 14:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5360180EC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5360180EC4;
	Mon,  2 Sep 2024 14:33:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 991DC1BF471
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 14:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92E1140293
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 14:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id li_H8vYmjW0Z for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 14:33:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C655340286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C655340286
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C655340286
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 14:33:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.191]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KUT-1s0UmU1AvB-00wO3q; Mon, 02
 Sep 2024 16:32:47 +0200
Message-ID: <a9865fde-0c09-42dd-8cd2-d174412dce28@gmx.de>
Date: Mon, 2 Sep 2024 16:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Walle <michael@walle.cc>, buildroot@buildroot.org
References: <20240902112735.728574-1-michael@walle.cc>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240902112735.728574-1-michael@walle.cc>
X-Provags-ID: V03:K1:WcLMx1MEt9aI+RzMmPj3WjD+lhOLkuLl38N47LThErNgPIGKVdy
 r+RjYCbT0AdT+SssE1GC65lWFk2KfGMkDvgj1KDJUEFlBl0Ph0i1YYFMDpOBuVQTDBqrhqk
 /K37mcw3rrC/zQNqn4vHV+NnO6MtP4feaeA6CR6JEgSUhEnhyvpVcWeP54iqE/guETtFyW1
 1d7DUBCstpt58TITupvFQ==
UI-OutboundReport: notjunk:1;M01:P0:vgVlzT3jxrM=;ANfRy9Q7UxRtt/XIlIyZ64q8S0S
 B1ZobzXcDL7WA+4AJ3cQdcQSkLRO3jqFLdSqRJI+MPUBkrRaUmri9F0AAGlYOOAhme4Sj7aRw
 PC5rZXUA3bhSZu9acbnm4lpC0TUldiyPKIcNZW8ONgFeNXmNaO6hs5B772QKZx7Q5s+ER9uOn
 J6PbVenW9OLbTqdE4I5N/ayW8+8/IgnEPcH5n4fBhacDiBgHG+vadVn0gzj0znAU4tsc4e8dW
 z6N35X4Y6+inpLNQVjaKcjv2CG31lnp9HP5z1NU51oJgUHg8znLU9eU7SIRI8L+kQOwBpsIlx
 KwACW59fr9ZURsaYaWDJWWT2nDl3QMpDUSHOvB1F7ChQtjKPOPuvyOiMgty+Faz4/m/wWZe8T
 E0xb2whc2ij4iw7oh9oSMcG6A3dudt75+WpH2u90SyLb4Xr3gmYcFgXhMu9mjbP9ph0/kDoMn
 hi/PkMRyQwif4xnrrMsGQlLz2i3DDgKu3c5Fz1ulUDRvHy3l0l34YAe4vt4AS/8fAbFSlBFpm
 mMgrdRH4x4ZoZrer9wGUmgxfZBedDeaMWX176DKwJ1V+569wv/EekazNSr8bXSV6CsuAQwPmA
 83fkKby/819K8bNk01Tw/wPKlYz1+RWeNLYAbC2BM0TVKDBBHHOKKO7psL+tdd1YGsM7t9qRa
 GXnLPTDU02KOLdOzjvf5b75QnLQ/yQ/aFlnJah6EzEgmDzcagBOaSwW8fVv3QRyoN30sxZYc2
 pdcbww4VoVtMJ/TMyeax8wC7aQhAP5sMMyV/+kr808zVzJY/mu/m7t8mlzjYfTyMXrAk+u7b2
 9sDD6Pz30odIMyMvyo+EbVgQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725287567; x=1725892367; i=fiona.klute@gmx.de;
 bh=y7C3h3scC0VL1EOfr4bGuETDRgh9QukbJf0lQBFAisc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Jf8Ovb2jyMClVdEf3amwCnSA2h9IfrIJkl/amJRqJtmv2Gy+ZtHFhX6Lf8sFivA8
 icg8GSikdhAOsZmFj62isewSH2buMNrhl4V1WghZT+nEkKN9uBYeVWRTsQOLxGQJn
 IAiCYMEN12F1NW2NMioSvIquuE6Lj7xjaaaAWETIxXWEhoD5HZXtKRxFnphCKrwFc
 9iLxDJMtQJcOkSKnfvkfHNq9n3Ost7qa2F6QlSKmUxm8yfzTdeTm7g8upyMaL7hU4
 wD+wgl4SJDDc5SHuJ5Ep9q8xHBuzq0UwhuCRGuucRZyCvIC7mzSb3p9PPMQn1QGfy
 s1iYkNA2bV0uOPqYAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Jf8Ovb2j
Subject: Re: [Buildroot] [PATCH v2] linux: add support for device tree
 overlays
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 02.09.24 um 13:27 schrieb Michael Walle via buildroot:
> The linux kernel can build device tree overlays (.dtbo) itself. Add
> support to build and copy them along with the actual device trees.
> These can either be in-tree device tree overlays
> (BR2_LINUX_KERNEL_INTREE_DTSO_NAMES) or they can be provided outside of
> the kernel (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH). In the latter case, the
> overlay source files will be copied into the kernel tree first.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Regarding using the .dtso suffix (or the lack of here) in the
> config symbol: I guess BR2_LINUX_KERNEL_INTREE_DTS_NAME used to
> just a name in the good old days (and for arm32). But nowadays that
> "name" also need a path prefix which makes it kind of a mix between
> name and filename, i.e. freescale/imx8mm-evk. IMHO that looks a bit
> odd, but I don't care too much and for the sake of consistency the
> new config option also just use the "name" variant.
>
> v2:
>   - don't use the ".dtso" suffix, just use the name
>   - renamed BR2_LINUX_KERNEL_INTREE_DTBOS to
>     BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
>   - remove leftover $(error debug)
>   - rebased to latest next
>
>   linux/Config.in | 14 +++++++++++---
>   linux/linux.mk  |  7 +++++--
>   2 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/linux/Config.in b/linux/Config.in
> index 429a7eabef..e2432dadd0 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -417,12 +417,20 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
>   	  the trailing .dts. You can provide a list of
>   	  dts files to build, separated by spaces.
>
> +config BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
> +	string "In-tree Device Tree Overlay file names"
> +	help
> +	  Names of in-tree device tree overlay, without the trailing
> +	  .dtso which should be built and installed into the target
> +	  system, separated by spaces.
> +
>   config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
>   	string "Out-of-tree Device Tree Source file paths"
>   	help
> -	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
> -	  Source Include (.dtsi) files, separated by spaces. These files
> -	  will be copied to the kernel sources and the .dts files will
> +	  Paths to out-of-tree Device Tree Source (.dts), Device Tree
> +	  Source Include (.dtsi) and Device Tree Overlay Source (.dtso)
> +	  files, separated by spaces. These files will be copied to the
> +	  kernel sources and the .dts files will
>   	  be compiled from there.
>
>   config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 16d9f19470..a850353718 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -193,14 +193,17 @@ endif
>   LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
>
>   LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
> +LINUX_DTSO_NAMES += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES))
>
>   # We keep only the .dts files, so that the user can specify both .dts
>   # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
>   # copied to arch/<arch>/boot/dts, but only the .dts files will
>   # actually be generated as .dtb.
> -LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
> +LINUX_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
> +LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
> +LINUX_DTSO_NAMES += $(basename $(filter %.dtso,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
>
> -LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
> +LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))

This looks like the DTBOs will be installed to $BINARIES_DIR along with
the DTBs. At least on RPi platforms it'd be preferable to be able to put
them in an overlays/ directory, to make it easier to create the
structure expected by the firmware in a genimage config without
templating. I don't know how common this is across other platforms that
use DT overlays.

Would it be practical to add an option to install DTBOs in a
(configurable) subdirectory?

Either way thank you for working on this!

Best regards,
Fiona

>   ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
>   LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
