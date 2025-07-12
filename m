Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D978C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 11:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40A6682105;
	Sat, 12 Jul 2025 11:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aftl9rL5OibT; Sat, 12 Jul 2025 11:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BEDF82106
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BEDF82106;
	Sat, 12 Jul 2025 11:50:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B76EB1CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8D178210B
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdWBwq6NW7lZ for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 11:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9EDA82103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9EDA82103
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9EDA82103
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:50:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E9D20B00563;
 Sat, 12 Jul 2025 13:50:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 13:50:22 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 13:50:22 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Michael Walle
 <michael@walle.cc>, Bryan Brattlof <bb@ti.com>
In-Reply-To: <20250711120544.315926-1-heiko.thiery@gmail.com>
References: <20250711120544.315926-1-heiko.thiery@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <102698839fae8d39fcc32a1fd1c4976a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752321027;
 bh=cMhaj3DmfvfY08anLRfihNU9GSrmBZH6IdUS4dU23c4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EHxR/avHXDlphQKAvCBRoB5BESeoMYrEAxAMN1Ny2zI+zqoF4dF7PDbZRDZUAcyzu
 t082i0V6VNFtrAZQrH4aSBaRf+y2MUyqdPXGH8vTs5xdA0+0GANcXLMKzDofQvd2fG
 RUQXlmNnetsbwSmXBas3NcHOvX0+esL4ewMCgVO+OZr0DitOaYKMnb5SoXj9zmlXIO
 ecsHlcZnOZjGLxK4JM61TGFWhiL27s1cEs0td1n4FXnzRGEzrbMOtjxSw0g+EuW6KX
 2RjlljbAqbipEs+h/UpgHRToD8T06Gdno52IRsXJUGGVGNCrRmgNyoDYY7jWwtAegR
 Mdf6zPThgIaWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EHxR/avH
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add option for
 Chips&Media Wave 521C
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Heiko,

Thanks for the patch.

On 11/07/2025 14:05, Heiko Thiery wrote:
> Add an option to install the firmware files for Chips&Media Wave 521C
> video processor used in the TI K3 architecture.
> 
> This "cnm/wave521c_k3_codec_fw.bin" file has been present in 
> linux-firmware
> since version 20221109.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/linux-firmware/Config.in         | 6 ++++++
>  package/linux-firmware/linux-firmware.mk | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in 
> b/package/linux-firmware/Config.in
> index 54910df6fd..778dfef8a0 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -33,6 +33,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU
>  	help
>  	  Firmware files for AMD GPU video cards.
> 
> +config BR2_PACKAGE_LINUX_FIRMWARE_CNM_WAVE521C_K3_CODEC
> +	bool "Chips&Media Wave 521C codec IP for K3"
> +	help
> +	  Firmware files for the Chips&Media Wave521C decoder
> +	  needed by the Linux TI j721s2-wave521c driver.
> +
>  config BR2_PACKAGE_LINUX_FIRMWARE_I915
>  	bool "Intel i915 video card firmware"
>  	help
> diff --git a/package/linux-firmware/linux-firmware.mk 
> b/package/linux-firmware/linux-firmware.mk
> index b9fd471e85..904c14ba10 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -25,6 +25,11 @@ LINUX_FIRMWARE_DIRS += amdgpu
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amdgpu
>  endif
> 
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CNM_WAVE521C_K3_CODEC),y)
> +LINUX_FIRMWARE_FILES += cnm/wave521c_k3_codec_fw.bin
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.cnm

Running "make linux-firmware-legal-info" with this firmware selected
fails with error:

     cp: cannot stat 
'/buildroot/output/build/linux-firmware-20250627/LICENSE.cnm': No such 
file or directory

This is because the license file is named LICENCE.cnm
(with 'C' instead of 'S'). See:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/LICENCE.cnm?h=20250627

Also, there is a warning that there is no hash for that file. Could
you make to also add the hash for this new file, please? In:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/linux-firmware/linux-firmware.hash

> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
>  LINUX_FIRMWARE_DIRS += i915
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
> --
> 2.39.5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
