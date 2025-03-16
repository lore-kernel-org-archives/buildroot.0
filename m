Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F57C282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 21:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDED860756;
	Sun, 16 Mar 2025 21:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIRFMKwpN47E; Sun, 16 Mar 2025 21:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE56060762
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE56060762;
	Sun, 16 Mar 2025 21:52:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB3F4D5
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 21:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 905A060762
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 21:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oo1MMydMgb97 for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 21:52:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3346E606F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3346E606F3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3346E606F3
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 21:52:09 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:5419:6efd:b79f:c072])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4B81220039E;
 Sun, 16 Mar 2025 22:52:00 +0100 (CET)
Date: Sun, 16 Mar 2025 22:52:00 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: Vladimir Oltean <olteanv@gmail.com>, buildroot@buildroot.org, 
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, 
 Romain Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <nrnb4esfx7ipazrmv2wrbeecme5tgeeeh77kqs5okma3gz4s4f@mbqilfrx6ymx>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-7-olteanv@gmail.com>
 <e97fba5fb8387c2e671d5e47aeaac1d2@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e97fba5fb8387c2e671d5e47aeaac1d2@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742161926;
 bh=AX5ovQhEgTkm7K8Xu6VMiKQ27/LUkaZmaNuI4z2/M0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nFBZpHc1jC1VCE6ZZgwFEmzb/F3y5GXRivfj3MF5O0+W0vvZp+++BdqmYhu8OGDQn
 lZqCykf+facvkuc4Di4c1O0MQBvOsXssIPLVeaNErUDj6OAGN7S4TOZAw+EL0gqDyV
 xJibRJ7NDGrBQUbnCn132bKpXSlh5gFY6qhxjTWkS1Z/0sBB/D75qZ7liD0gk1QSRr
 wtSW60zsYHLQq1WMgaoOIoygGZpHTuyLXg7ROSyQLUHAHnxlntnFGSOpdWtOmOeDWD
 tRi0WS86XMg93LYa/TK2PsBLCUZqs47BN70gUrmSkXiZVNBPjw/TXrmMLcWsHDi42K
 8cPzM1yNPA0BQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nFBZpHc1
Subject: Re: [Buildroot] [PATCH 06/15] package/qoriq-mc-utils: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien, Vladimir,

In fact, I believe it requires another minor rework too, mostly for the API version, see below:

> > +config BR2_PACKAGE_QORIQ_MC_UTILS_DPC
> > +	string "Data Path Configuration (DPC) file"
> > +	help
> > +	  The DPC file contains the settings defining the behavior
> > +	  of the MC firmware. Its source code follows the device
> > +	  tree syntax and is compiled to a device tree blob, which
> > +	  is the file that must be specified here.
> 
> If the DPC file is mandatory, could you add a note about that here?
> (and possibly give an example?)

+1, yes a depency can be added so we enforce the host `dpc`, something like:
```
 config BR2_PACKAGE_QORIQ_MC_UTILS
        bool "qoriq-mc-utils"
+       select BR2_PACKAGE_HOST_DTC
```

Or a bit more elaborated.

> > +	$(MAKE) -C $(@D)/config/
> 
> You will then need to add the Buildroot host path during the
> make invocation. Here, we should have:
> 
>     PATH=$(BR_PATH) $(MAKE) -C $(@D)/config/

@Julien, is it the proper way of doing it ? How to be sure that we'll be
using the buildroot's dpc and not the one from the host based on
ordering of BR_PATH ?

I'd rather prefer a clean Makefile assuming:
  https://github.com/nxp-qoriq/mc-utils/pull/1
+       DTC=$(HOST_DIR)/bin/dtc $(MAKE) -C $(@D)/config/


Then, there is an issue with the version of the API. I faced it since I
needed to use something that was not the 10.39.0

Vladmir,

on top of Julien's comments, I believe that we need to be able to
configure the version API indepently of the tag version. Somethink like:
...
QORIQ_MC_UTILS_VERSION = xyz
+QORIQ_MC_UTILS_LATEST_API_VERSION = mc_release_10.39.0
+
+# Assuming than any git sha version leads to using the latest version
+ifneq ($(findstring mc_release_,$(QORIQ_MC_UTILS_VERSION)),)
+  QORIQ_MC_UTILS_API_VERSION = $(QORIQ_MC_UTILS_VERSION)
+else
+  QORIQ_MC_UTILS_API_VERSION = $(QORIQ_MC_UTILS_LATEST_API_VERSION)
+endif
+
+$(info QORIQ_MC_UTILS_API_VERSION uses $(QORIQ_MC_UTILS_API_VERSION))
+
+QORIQ_MC_UTILS_SITE = $(call github,nxp-qoriq,mc-utils,$(QORIQ_MC_UTILS_VERSION))
...

Then, once we set this version, we can build the dplib API too:
 define QORIQ_MC_UTILS_BUILD_CMDS
+       DTC=$(HOST_DIR)/bin/dtc $(MAKE) -C $(@D)/config/
+       $(MAKE) -C $(@D)/api/$(QORIQ_MC_UTILS_API_VERSION)/
 endef


> > +define QORIQ_MC_UTILS_INSTALL_IMAGES_CMDS
> > +	$(INSTALL) -D $(@D)/config/$(call
> > qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC)) $(BINARIES_DIR)/dpc.dtb
> > +	$(INSTALL) -D $(@D)/config/$(call
> > qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL)) $(BINARIES_DIR)/dpl.dtb
> 
> The _INSTALL_IMAGES_CMDS fails if either
> BR2_PACKAGE_QORIQ_MC_UTILS_DPC, or BR2_PACKAGE_QORIQ_MC_UTILS_DPL
> are empty, which is their default in Kconfig.
> 
> If it is really mandatory to have values set for those
> configuration variables, maybe you could add an explicit error message?
> See for example:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc2/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk#L30

Moreover, the Config.in help should explain that the dpc and dpl names should be a
{dpc-*,dpl-*}*.dtb file not a .dts file such as:
BR2_PACKAGE_QORIQ_MC_UTILS_DPC="lx2160a/LX2160A-QDS/dpc.13.dtb"
BR2_PACKAGE_QORIQ_MC_UTILS_DPL="lx2160a/LX2160A-QDS/dpl-eth.13.dtb"

> Can you send an updated version of the patch, please?

Thanks Vladimir.

It that can help, enclosed my local update that I was using in order to
run it quickly from your package:
+++ b/package/qoriq-mc-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QORIQ_MC_UTILS
        bool "qoriq-mc-utils"
+       select BR2_PACKAGE_HOST_DTC
        help
          The Management Complex (MC) is a key component of the
          networking subsystem named DPAA2 (Data Path Acceleration

--- a/package/qoriq-mc-utils/qoriq-mc-utils.mk
+++ b/package/qoriq-mc-utils/qoriq-mc-utils.mk
@@ -5,13 +5,29 @@
 ################################################################################

 QORIQ_MC_UTILS_VERSION = ba4be529fa5b315049f237c8bdd123a90da94266
-QORIQ_MC_UTILS_SITE = $(call github,nxp-qoriq,mc-utils,mc_release_$(QORIQ_MC_UTILS_VERSION))
+QORIQ_MC_UTILS_LATEST_API_VERSION = mc_release_10.39.0
+
+# Assuming than any git sha version leads to using the latest version
+ifneq ($(findstring mc_release_,$(QORIQ_MC_UTILS_VERSION)),)
+  QORIQ_MC_UTILS_API_VERSION = $(QORIQ_MC_UTILS_VERSION)
+else
+  QORIQ_MC_UTILS_API_VERSION = $(QORIQ_MC_UTILS_LATEST_API_VERSION)
+endif
+
+$(info QORIQ_MC_UTILS_API_VERSION uses $(QORIQ_MC_UTILS_API_VERSION))
+
+QORIQ_MC_UTILS_SITE = $(call github,nxp-qoriq,mc-utils,$(QORIQ_MC_UTILS_VERSION))
 QORIQ_MC_UTILS_LICENSE = BSD-3-Clause
 QORIQ_MC_UTILS_INSTALL_IMAGES = YES
 QORIQ_MC_UTILS_INSTALL_TARGET = NO

+# XXX it shall not be needed
+BR_NO_CHECK_HASH_FOR += $(QORIQ_MC_UTILS_SOURCE)
+
+QORIQ_MC_UTILS_DEPENDENCIES = host-dtc
+
 define QORIQ_MC_UTILS_BUILD_CMDS
-       $(MAKE) -C $(@D)/config/
+       DTC=$(HOST_DIR)/bin/dtc $(MAKE) -C $(@D)/config/
+       $(MAKE) -C $(@D)/api/$(QORIQ_MC_UTILS_API_VERSION)/
 endef

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
