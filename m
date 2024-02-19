Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B7AC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 20:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F36804060C;
	Mon, 19 Feb 2024 20:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7mai_4iHAgb; Mon, 19 Feb 2024 20:15:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6102C40B69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6102C40B69;
	Mon, 19 Feb 2024 20:15:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7FB71BF41C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5D5D60770
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BavFbRaPu5Mm for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 20:15:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B14D606A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B14D606A2
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B14D606A2
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 20:15:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41JKFW5p103196;
 Mon, 19 Feb 2024 14:15:32 -0600
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41JKFWNh018318
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Feb 2024 14:15:32 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Feb 2024 14:15:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Feb 2024 14:15:31 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41JKFV6p122219;
 Mon, 19 Feb 2024 14:15:31 -0600
Date: Mon, 19 Feb 2024 14:15:31 -0600
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240219201531.bekohv6hmfkdftct@dasso>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-7-dario.binacchi@amarulasolutions.com>
 <5f007c47-0c4c-438b-8978-4fe6e2515db1@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f007c47-0c4c-438b-8978-4fe6e2515db1@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708373732;
 bh=F/4nuYIl9c42T5wfPto1DqzXw5QaMcyH3dI9WwSzmFo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bcyrPsFiM6AdhC9okGqywi+AfAT8RBK+vq+tfQyR9WQeyySZBz4TsnMtjFzjtFcjr
 V8qoLihy7O5TKmcHIWRZv96t89NCSCEhhuP5NWiPIH2D9Mi/Qyg+AX0nbp+j+Uiw4P
 PnF3p5zavuohzgsv8Q6zlPQaj4dvb8GyxbVno/k4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=bcyrPsFi
Subject: Re: [Buildroot] [PATCH v4 06/20] boot/ti-k3-core-secdev: new package
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

Hi Romain, All,

On Mon, Feb 19, 2024 at 10:48:59AM +0100, Romain Naour wrote:
> Hello Dario,
> =

> Le 17/02/2024 =E0 17:02, Dario Binacchi a =E9crit=A0:
> > This is a security development package containing tools for
> > High-Security(HS) TI K3 platform devices.
> =

> Note: this tool can also handle TI "legacy" platform such AM57xx or AM43x=
x (not
> sure we really want do that).

While there are secure variants of those older platforms, it is very
much controlled/restricted and not something readily available. So not
something somebody easily can obtain to test, etc. Either way the secure
dev source package associated with 'ti-k3-core-secdev' here is also only
for K3 generation of devices and won't compatible with AM57xx or AM43xx
anyways.

> =

> Can you try without this package when using binman?
> This tool doesn't seems "future proof".
> =

> http://lists.busybox.net/pipermail/buildroot/2024-February/685820.html

Yes we should drop the package.

Thanks, Andreas


> Best regards,
> Romain
> =

> > =

> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > =

> > ---
> > =

> > Changes in v4:
> > - Remove the trailing '/' at the end of the url in the help of
> >   Config.in
> > - Fixed license issues
> > - Use $(BINARIES_DIR)/ti-k3-core-secdev as the directory where to
> >   install files.
> > =

> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >  DEVELOPERS                                    |  1 +
> >  boot/Config.in                                |  1 +
> >  boot/ti-k3-core-secdev/Config.in              |  9 ++++++++
> >  boot/ti-k3-core-secdev/ti-k3-core-secdev.hash |  3 +++
> >  boot/ti-k3-core-secdev/ti-k3-core-secdev.mk   | 22 +++++++++++++++++++
> >  5 files changed, 36 insertions(+)
> >  create mode 100644 boot/ti-k3-core-secdev/Config.in
> >  create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
> >  create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
> > =

> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 0d12c3abcb11..33d99ab2440f 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -753,6 +753,7 @@ F:	package/xinetd/
> >  N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >  F:	board/bsh/
> >  F:	board/stmicroelectronics/stm32f769-disco/
> > +F:	boot/ti-k3-core-secdev/
> >  F:	configs/imx8mn_bsh_smm_s2_defconfig
> >  F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
> >  F:	configs/stm32f769_disco_sd_defconfig
> > diff --git a/boot/Config.in b/boot/Config.in
> > index e5fdf7ad439e..18a7d268f95a 100644
> > --- a/boot/Config.in
> > +++ b/boot/Config.in
> > @@ -20,6 +20,7 @@ source "boot/s500-bootloader/Config.in"
> >  source "boot/shim/Config.in"
> >  source "boot/syslinux/Config.in"
> >  source "boot/ti-k3-boot-firmware/Config.in"
> > +source "boot/ti-k3-core-secdev/Config.in"
> >  source "boot/ti-k3-image-gen/Config.in"
> >  source "boot/ti-k3-r5-loader/Config.in"
> >  source "boot/uboot/Config.in"
> > diff --git a/boot/ti-k3-core-secdev/Config.in b/boot/ti-k3-core-secdev/=
Config.in
> > new file mode 100644
> > index 000000000000..f7b4e2962042
> > --- /dev/null
> > +++ b/boot/ti-k3-core-secdev/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_TARGET_TI_K3_CORE_SECDEV
> > +	bool "ti-k3-core-secdev"
> > +	depends on BR2_aarch64
> > +	help
> > +	  This package downloads and installs development tools for
> > +	  High-Security(HS) TI K3 platforms (which include AM62x,
> > +	  AM64x, AM65x and more).
> > +
> > +	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3
> > diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash b/boot/ti-k3=
-core-secdev/ti-k3-core-secdev.hash
> > new file mode 100644
> > index 000000000000..e3074a398d62
> > --- /dev/null
> > +++ b/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +sha256  b6d3bca0d561d055c6869c5564b06f2fb1b9f67e4ef180c2baf8a14a6a6afa=
06  core-secdev-k3-08.06.00.007.tar.xz
> > +sha256  3e5cf4f5ab9f0333f46cd68fabede3f21e55de1a9e3c6ad673f241f4514d83=
69  manifest/k3-secdev-0.2-manifest.html
> > diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk b/boot/ti-k3-c=
ore-secdev/ti-k3-core-secdev.mk
> > new file mode 100644
> > index 000000000000..f7655a0fefc8
> > --- /dev/null
> > +++ b/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
> > @@ -0,0 +1,22 @@
> > +######################################################################=
##########
> > +#
> > +# ti-k3-core-secdev
> > +#
> > +######################################################################=
##########
> > +
> > +TI_K3_CORE_SECDEV_VERSION =3D 08.06.00.007
> > +TI_K3_CORE_SECDEV_SITE =3D https://git.ti.com/cgit/security-developmen=
t-tools/core-secdev-k3/snapshot
> > +TI_K3_CORE_SECDEV_SOURCE =3D core-secdev-k3-$(TI_K3_CORE_SECDEV_VERSIO=
N).tar.xz
> > +TI_K3_CORE_SECDEV_INSTALL_IMAGES =3D YES
> > +TI_K3_CORE_SECDEV_LICENSE =3D BSD-3-Clause
> > +TI_K3_CORE_SECDEV_LICENSE_FILES =3D manifest/k3-secdev-0.2-manifest.ht=
ml
> > +
> > +TI_K3_CORE_SECDEV_INSTALL_DIR =3D $(BINARIES_DIR)/ti-k3-core-secdev
> > +
> > +define TI_K3_CORE_SECDEV_INSTALL_IMAGES_CMDS
> > +	mkdir -p $(TI_K3_CORE_SECDEV_INSTALL_DIR)
> > +	cp -dpfr $(@D)/keys $(TI_K3_CORE_SECDEV_INSTALL_DIR)/
> > +	cp -dpfr $(@D)/scripts $(TI_K3_CORE_SECDEV_INSTALL_DIR)/
> > +endef
> > +
> > +$(eval $(generic-package))
> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
