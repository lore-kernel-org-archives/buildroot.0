Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC67C4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 21:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8EA2610B6;
	Tue,  5 Dec 2023 21:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8EA2610B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZR_tIfWH0WN; Tue,  5 Dec 2023 21:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18316613C6;
	Tue,  5 Dec 2023 21:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18316613C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEC1F1BF35E
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 21:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D485F404C5
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 21:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D485F404C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uASmZsKE6urq for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 21:43:10 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE5C0403EC
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 21:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE5C0403EC
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33339d843b9so130239f8f.0
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 13:43:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701812588; x=1702417388;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SMO+NACR2lLXtFkxacFPnzgGT89oGIkmpFjmv2jqgQ8=;
 b=ZjJ6LzZozl4vxKk/70UC06EX7eIXpJA5Ey0L3dcUJXRNQkT7tT1JYDu5Zzhc5ikGiF
 JHkx9b5JHIFN3NwcMS9+fvWz+92K2z27ei1AMzWpU5hFORPGKb7tns9xA/1kPpeTYJKx
 20Vk1gxQwRsUD1Qf8vO2lFD9Y3E8XN2yYe/U1F56srP6VuBx/JEFfJREd60njOGDn6dI
 D6An40e6oNhM23FBtDPmVa+wVx1Ry9+WqdQesCfTV50NAWnzRDIVYNfxWD1fT8u7Qxgx
 cR+/nZVkoyhtJAGVAcz3RUWovsgu+amZtLDK491qXJZ4oK2IcNPoWbtYsGRi/bCIFMLt
 +DDg==
X-Gm-Message-State: AOJu0YwG3kUffNBE6dPapfZWyNEhK5IsZ176aGRqyE/rcWA8Mr7FICYd
 /Qss60w3YPuPMEJMfIqXHGk=
X-Google-Smtp-Source: AGHT+IFrvfuBK1eFVDc4Jtwh8hBHbH2O3w9BeXXeLys1IIssAtFXHgAOuPTsqwVyMYv4/fEhLt8Rtg==
X-Received: by 2002:a5d:64cd:0:b0:333:48a2:b051 with SMTP id
 f13-20020a5d64cd000000b0033348a2b051mr3596501wri.121.1701812587558; 
 Tue, 05 Dec 2023 13:43:07 -0800 (PST)
Received: from p1g2 (2a01cb000fac0c0088f09ee77063439d.ipv6.abo.wanadoo.fr.
 [2a01:cb00:fac:c00:88f0:9ee7:7063:439d])
 by smtp.gmail.com with ESMTPSA id
 j28-20020adfb31c000000b003333d46a9e8sm9548633wrd.56.2023.12.05.13.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 13:43:06 -0800 (PST)
Date: Tue, 5 Dec 2023 22:43:05 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <ZW-ZaX3SRi8mnSdP@p1g2>
References: <20231011110932.4425-1-sebastien.szymanski@armadeus.com>
 <20231011110932.4425-4-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231011110932.4425-4-sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701812588; x=1702417388; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SMO+NACR2lLXtFkxacFPnzgGT89oGIkmpFjmv2jqgQ8=;
 b=Yt2FjT1T52cwRCmOLVd/E+PP8y/2rvtr9RbLfK2C8bZS7vj3vVk2/Jkt1gKwZRyRD3
 VSKbWKyWykm0RUr4+pToPL31a2wexeZisffD5mbcH5A+j+MY39KYltgYfWAAyADcFeXY
 Z05/WXEwWq3eIn+Yw8nkeMQkK0GJMgmW9wQbI7J95EX7irz1xzod6VVZylgb5CaeZyPl
 LfjAeEa+LBaMeYQFxWWuD/5U2sC0XBjpi8D9cYXn2YRk8Hfof7XYS3g8Ec0mLpcAvNWr
 yWy4G765l3T/1IXGnzcuFHg+SHCHC/IPEzm/XUINonsfonN/JuuPkWE3uOwd1106837I
 qjgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yt2FjT1T
Subject: Re: [Buildroot] [PATCH 3/4]
 package/freescale-imx/firmware-sentinel: new package
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Wed, Oct 11, 2023 at 01:09:31PM +0200, S=E9bastien Szymanski wrote:
> This package provides firmware blobs for the i.MX9 Edgelock secure
> enclave (ELE).

This actually not only for i.MX 9 but also for i.MX 8ULP.
I suggest adding the release this version comes from (6.1.36-2.1.0).

> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/freescale-imx/Config.in               |  1 +
>  .../freescale-imx/firmware-sentinel/Config.in | 34 +++++++++++++++++++
>  .../firmware-sentinel/firmware-sentinel.hash  |  4 +++
>  .../firmware-sentinel/firmware-sentinel.mk    | 27 +++++++++++++++
>  4 files changed, 66 insertions(+)
>  create mode 100644 package/freescale-imx/firmware-sentinel/Config.in
>  create mode 100644 package/freescale-imx/firmware-sentinel/firmware-sent=
inel.hash
>  create mode 100644 package/freescale-imx/firmware-sentinel/firmware-sent=
inel.mk
> =

> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Conf=
ig.in
> index 192b1c0d70d1..4d31bcc4f4cf 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -126,6 +126,7 @@ source "package/freescale-imx/imx-vpu/Config.in"
>  source "package/freescale-imx/imx-vpu-hantro/Config.in"
>  source "package/freescale-imx/imx-vpuwrap/Config.in"
>  source "package/freescale-imx/firmware-imx/Config.in"
> +source "package/freescale-imx/firmware-sentinel/Config.in"
>  source "package/freescale-imx/imx-sc-firmware/Config.in"
>  source "package/freescale-imx/imx-seco/Config.in"
>  source "package/freescale-imx/imx-vpu-hantro-daemon/Config.in"
> diff --git a/package/freescale-imx/firmware-sentinel/Config.in b/package/=
freescale-imx/firmware-sentinel/Config.in
> new file mode 100644
> index 000000000000..9ceecd5a39dc
> --- /dev/null
> +++ b/package/freescale-imx/firmware-sentinel/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_FIRMWARE_SENTINEL
> +	bool "firmware-sentinel"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
> +	help
> +	  Firmware blobs for the i.MX9 Edgelock secure enclave (ELE).

ditto.

> +	  This library is provided by Freescale as-is and doesn't have
> +	  an upstream.

s/Freescale/NXP/

> +if BR2_PACKAGE_FIRMWARE_SENTINEL
> +
> +choice
> +	prompt "i.MX Sentinel Firmware Release"
> +	help
> +	  Select the appropriate ahab container image to install
> +	  to match the iMX asics revision.
> +
> +	  Note - mismatches result in a failure to boot
> +
> +config BR2_PACKAGE_FIRMWARE_SENTINEL_A0
> +	bool "A0"
> +
> +config BR2_PACKAGE_FIRMWARE_SENTINEL_A1
> +	bool "A1"
> +
> +endchoice

I don't think this is the right approach as this package exists for
several CPU types (8ULP & 93).
Moreover, for the 8ULP, which I plan on adding soon-ish, there is even
more revisions which are used in more than 1 package (firmware-upower).
Also, that revision really is a Silicon version more than a firmware
release like the title suggests.

Overall, my suggestion would be to move the Silicon version to
freescale-imx/Config.in to be selected at the same time the CPU is
selected. Also, the default Silicon revision should always be the
latest.

> +config BR2_PACKAGE_FIRMWARE_SENTINEL_AHAB_CONTAINER_IMAGE
> +	string
> +	default "mx93a0-ahab-container.img" if BR2_PACKAGE_FIRMWARE_SENTINEL_A0
> +	default "mx93a1-ahab-container.img" if BR2_PACKAGE_FIRMWARE_SENTINEL_A1
> +
> +endif # BR2_PACKAGE_FIRMWARE_SENTINEL
> diff --git a/package/freescale-imx/firmware-sentinel/firmware-sentinel.ha=
sh b/package/freescale-imx/firmware-sentinel/firmware-sentinel.hash
> new file mode 100644
> index 000000000000..1a9ff0543250
> --- /dev/null
> +++ b/package/freescale-imx/firmware-sentinel/firmware-sentinel.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  269480417a8ae9aa4cc4101ab947287fc33455a931021dbdc4d9badb5212bceb=
  firmware-sentinel-0.11.bin
> +sha256  de37a0bcbf1717b910c1a53ea6eab853c404e61e8143bb6c081d39f532571e54=
  COPYING
> +sha256  c800aaca3a7e9f470d99d7cde0a48c95982ed601d4c306f7b8f43f3710054f28=
  SCR.txt
> diff --git a/package/freescale-imx/firmware-sentinel/firmware-sentinel.mk=
 b/package/freescale-imx/firmware-sentinel/firmware-sentinel.mk
> new file mode 100644
> index 000000000000..f68467194cbc
> --- /dev/null
> +++ b/package/freescale-imx/firmware-sentinel/firmware-sentinel.mk
> @@ -0,0 +1,27 @@
> +########################################################################=
########
> +#
> +# firmware-sentinel
> +#
> +########################################################################=
########
> +
> +FIRMWARE_SENTINEL_VERSION =3D 0.11
> +FIRMWARE_SENTINEL_SITE =3D $(FREESCALE_IMX_SITE)
> +FIRMWARE_SENTINEL_SOURCE =3D firmware-sentinel-$(FIRMWARE_SENTINEL_VERSI=
ON).bin
> +
> +FIRMWARE_SENTINEL_LICENSE =3D NXP Semiconductor Software License Agreeme=
nt
> +FIRMWARE_SENTINEL_LICENSE_FILES =3D COPYING SCR.txt
> +FIRMWARE_SENTINEL_REDISTRIBUTE =3D NO
> +
> +FIRMWARE_SENTINEL_INSTALL_IMAGES =3D YES
> +
> +define FIRMWARE_SENTINEL_EXTRACT_CMDS
> +	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_SENTINEL_DL_DIR)/$(FIRMWARE_SENTIN=
EL_SOURCE))
> +endef
> +
> +FIRMWARE_SENTINEL_AHAB_CONTAINER_IMAGE =3D $(call qstrip,$(BR2_PACKAGE_F=
IRMWARE_SENTINEL_AHAB_CONTAINER_IMAGE))
> +
> +define FIRMWARE_SENTINEL_INSTALL_IMAGES_CMDS
> +	cp $(@D)/$(FIRMWARE_SENTINEL_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/ahab=
-container.img
> +endef
> +
> +$(eval $(generic-package))

The rest of the patch looks good!

Thanks,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
