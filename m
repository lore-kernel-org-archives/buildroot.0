Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E8BC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F7DB424D6;
	Wed,  5 Feb 2025 11:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qUgHOKjobN4; Wed,  5 Feb 2025 11:30:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F945424D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F945424D4;
	Wed,  5 Feb 2025 11:30:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7499D12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6256E41413
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qndrBNzdbOiB for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:30:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 095EB413FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 095EB413FA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 095EB413FA
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:30:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1917F43147;
 Wed,  5 Feb 2025 11:30:26 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:30:25 +0100
To: Brian Cain via buildroot <buildroot@buildroot.org>
Cc: Brian Cain <brian.cain@oss.qualcomm.com>
Message-ID: <20250205123025.54ed3562@windsurf>
In-Reply-To: <20241219053053.2389046-14-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-14-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsrhhirghnrdgtrghinhesohhsshdrqhhurghltghomhhmrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738755026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42O+P/oUD2wvfAs/BSzlhCOHgSeKQ7Z2XC+vi1dG1rg=;
 b=OIZuKHru159Hd+J9xi6aZNaFss+Scbkm1k6TW3M/+kk+wHUekJL3KrTkA2FPbum5Sm3Yp1
 dZajDJmtbXNZdw+BWgL9wd9WMUWfwgPMjXHXkps1vBVrnL23++WjfpaKo4VtAbu9TxHnA+
 U2py4AuwdCOIsWNXfncbGi+wf1UZFp87HfQZgoOKCYU+1OMmTh/cjLONuUS56r5lwZmo6H
 PuC+yThmriyJH529BPDn/M+tbnrB9bbf9tVcBRMZcI5BDihsxQ3e2Clw2g4WvIgQbnFxG/
 uo6Cn+p8Ux4oKR1CI5A4lowrUOqD4TgBYn09suvXrNSInutvMZ9qLoopyQRXdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OIZuKHru
Subject: Re: [Buildroot] [RFC v2 13/14] configs: switch hexagon QEMU to
 SHARED
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 18 Dec 2024 21:30:52 -0800
Brian Cain via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/configs/qcom_dsp_qemu_defconfig b/configs/qcom_dsp_qemu_defconfig
> index cc9b7157ad..dbfc8f1adf 100644
> --- a/configs/qcom_dsp_qemu_defconfig
> +++ b/configs/qcom_dsp_qemu_defconfig
> @@ -1,6 +1,6 @@
>  BR2_hexagon=y
>  BR2_HEXAGON_v73=y
> -BR2_STATIC_LIBS=y
> +BR2_SHARED_LIBS=y

Put this in the initial patch introducing the defconfig.

>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_CLANG=y
> @@ -28,11 +28,16 @@ BR2_PACKAGE_BASH=y
>  BR2_PACKAGE_ZSH=y
>  
>  BR2_PACKAGE_LIQUID_DSP=y
> +BR2_PACKAGE_DAV1D=y
> +BR2_PACKAGE_CMAKE=y
> +BR2_PACKAGE_LUA=y

No custom packages in upstream defconfigs: they are supposed to be minimal.

>  BR2_PACKAGE_GNURADIO_FFT=y
>  
> +BR2_RELRO_NONE=y

If relro breaks with Clang, then the option needs to have a dependency
on !clang.

>  BR2_PACKAGE_XINETD=n
>  BR2_PACKAGE_COREUTILS=y
> -BR2_PACKAGE_HEXAGONMVM=y
> +BR2_PACKAGE_HEXAGONMVM=n

Spurious change?

>  BR2_TARGET_ROOTFS_TAR_GZIP=y
>  BR2_TARGET_ROOTFS_INITRAMFS=y

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
