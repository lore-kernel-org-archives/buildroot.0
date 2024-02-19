Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD63C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 20:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 457F740B6F;
	Mon, 19 Feb 2024 20:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJfBKiuJre-1; Mon, 19 Feb 2024 20:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C74B940B73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C74B940B73;
	Mon, 19 Feb 2024 20:19:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15B3C1BF41C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F506607C4
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhK3RYTHIKb8 for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 20:19:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECDAA607A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECDAA607A7
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECDAA607A7
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 20:19:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41JKJ9pH124460;
 Mon, 19 Feb 2024 14:19:09 -0600
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41JKJ9kW005501
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Feb 2024 14:19:09 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Feb 2024 14:19:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Feb 2024 14:19:08 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41JKJ8Kv004363;
 Mon, 19 Feb 2024 14:19:08 -0600
Date: Mon, 19 Feb 2024 14:19:08 -0600
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240219201908.zqxhfa5bewy6lohx@dasso>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-8-dario.binacchi@amarulasolutions.com>
 <8dca9e04-832f-4ffc-b6b0-d1deed31259b@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8dca9e04-832f-4ffc-b6b0-d1deed31259b@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708373949;
 bh=kGZCyvBQSQCJyVLR03mBWZJQavoWi0j8f986M8bOQ1Q=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=B+QdC4egRqkntaGGuWswjbKX8WJAdBPxekUJy6Y4vwp7LdlSlueqjb1yrxp0u65Ed
 3NOSEgjFEy+IsP9BrjYgmDy245lnItw+/uQkVTcTCltEQK7UWbop05g7+p/cgb1IzF
 7lNpoFEskaMFhQ/WFsO2CsNZ5ncfQtgC7W2dg3jk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=B+QdC4eg
Subject: Re: [Buildroot] [PATCH v4 07/20] boot/ti-k3-image-gen: manage HS
 hardware
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 19, 2024 at 10:58:26AM +0100, Romain Naour wrote:
> Hello Dario,
> =

> Le 17/02/2024 =E0 17:02, Dario Binacchi a =E9crit=A0:
> > The patch sets the configurations required by TI HS systems. Some of th=
ese
> > configurations (i. e. HS SYSFW image signing key, HS Software Revision)
> > are provided by the ti-k3-core-secdev package in the binaries directory.
> =

> Such keys has been added to u-boot v2023.10:
> =

> https://git.ti.com/cgit/security-development-tools/core-secdev-k3/tree/ke=
ys
> =

> https://source.denx.de/u-boot/u-boot/-/commit/d5b1ef30d7ffabb9f57d5c62b9f=
0608837af0f4f
> =

> Do we need something else from ti-k3-core-secdev package that is not alre=
ady
> provided by u-boot?

No, we don't need anything from that. If you look at TI's current SDKs/Yocto
builds this package is not used at all. The TI goal is to do things in a
standard upstream way (in upstream) as much as possible, hence we are
trying to move away from all these "vendor quirks" however possible.

Regards, Andreas



> =

> Best regards,
> Romain
> =

> > =

> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > =

> > ---
> > =

> > no changes since v3:
> > =

> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >  boot/ti-k3-image-gen/Config.in          |  1 +
> >  boot/ti-k3-image-gen/ti-k3-image-gen.mk | 16 ++++++++++++++--
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> > =

> > diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Conf=
ig.in
> > index d76cef82e911..38d1598d9fc0 100644
> > --- a/boot/ti-k3-image-gen/Config.in
> > +++ b/boot/ti-k3-image-gen/Config.in
> > @@ -2,6 +2,7 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
> >  	bool "ti-k3-image-gen"
> >  	depends on BR2_TARGET_TI_K3_R5_LOADER
> >  	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
> > +	select BR2_TARGET_TI_K3_CORE_SECDEV if BR2_TARGET_TI_K3_IMAGE_GEN_SEC=
TYPE_HS_FS || BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
> >  	# We need FIT support in uboot-tools, which is why we select a
> >  	# host package
> >  	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> > diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image=
-gen/ti-k3-image-gen.mk
> > index 64be9a18f2c4..74b4fcb4bf89 100644
> > --- a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> > +++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> > @@ -29,10 +29,21 @@ TI_K3_IMAGE_GEN_FW_TYPE =3D $(call qstrip,$(BR2_TAR=
GET_TI_K3_IMAGE_GEN_FW_TYPE))
> >  TI_K3_IMAGE_GEN_SOC =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC=
))
> >  TI_K3_IMAGE_GEN_SECTYPE =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN=
_SECTYPE))
> >  =

> > -TI_K3_IMAGE_GEN_SYSFW =3D $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_=
IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
> > +ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP),y)
> > +TI_K3_IMAGE_GEN_SYSFW =3D \
> > +	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IM=
AGE_GEN_SECTYPE).bin
> > +else
> > +TI_K3_IMAGE_GEN_DEPENDENCIES +=3D ti-k3-core-secdev
> > +
> > +TI_K3_IMAGE_GEN_SYSFW =3D \
> > +	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IM=
AGE_GEN_SECTYPE)-enc.bin \
> > +	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IM=
AGE_GEN_SECTYPE)-cert.bin
> > +endif
> >  =

> >  define TI_K3_IMAGE_GEN_CONFIGURE_CMDS
> > -	cp $(BINARIES_DIR)/ti-sysfw/$(TI_K3_IMAGE_GEN_SYSFW) $(@D)
> > +	$(foreach t,$(TI_K3_IMAGE_GEN_SYSFW),\
> > +		cp $(BINARIES_DIR)/ti-sysfw/$(t) $(@D)/
> > +	)
> >  endef
> >  =

> >  define TI_K3_IMAGE_GEN_BUILD_CMDS
> > @@ -40,6 +51,7 @@ define TI_K3_IMAGE_GEN_BUILD_CMDS
> >  	$(BR2_MAKE) -C $(@D) \
> >  		SOC=3D$(TI_K3_IMAGE_GEN_SOC) \
> >  		SOC_TYPE=3D$(TI_K3_IMAGE_GEN_SECTYPE) \
> > +		TI_SECURE_DEV_PKG=3D$(BINARIES_DIR)/ti-k3-core-secdev \
> >  		CONFIG=3Devm \
> >  		CROSS_COMPILE=3D$(HOST_DIR)/bin/arm-none-eabi- \
> >  		SBL=3D$(BINARIES_DIR)/r5-u-boot-spl.bin \
> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
