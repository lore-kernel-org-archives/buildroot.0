Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB97AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 09:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 407B360C28;
	Mon, 12 Dec 2022 09:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 407B360C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9t33Wdbd4_h; Mon, 12 Dec 2022 09:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AD8360B35;
	Mon, 12 Dec 2022 09:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AD8360B35
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28A251BF9C6
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 041A360C1C
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 041A360C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNCQMqcVrblc for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 09:35:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC82060C24
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC82060C24
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:35:14 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8869260015;
 Mon, 12 Dec 2022 09:35:10 +0000 (UTC)
Date: Mon, 12 Dec 2022 10:35:08 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221212103508.7855148f@booty>
In-Reply-To: <CH2PR12MB500455907F9D4CB0D5CFAA90F01F9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221209194043.28673-1-brandon.maier@collins.com>
 <CH2PR12MB500455907F9D4CB0D5CFAA90F01F9@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670837712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyQ93YG+kmykN2gyokTUebf5KNSTNhOtWJTOzGbZ2jM=;
 b=F5BjaS37nQA0b1TlZHSyj4ye1SszYlCU7kx73YsrNljTfOKLdsesZTsNvEPZ2EZ7mVuYGQ
 aPd9sshnaAPzxflxE5JYsgDw4Ck6TYfJHKFb9+0C+Qc208XieOov9r9mtHD7ZQ+Ji2K1Cn
 xYw8ajCowC3W7CXvtO/32xIAJQ+SYetnUcL2KucHfmqENTAUjiJ6SOgzCJQKDkCBR8V32P
 DaOd6CxmyBL/VVSFldN1nu4eXz7EoODj4UP6Z3DSd5EJhCrha2bePKHN8XeBNKVukHb4Jc
 Z33MyAK55/Ve9lqDFNwpSfPUUtQcn101x1tFaBWT7duzneHTE35n/19yL+KFAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F5BjaS37
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot/uboot.mk: support binary
 pm_cfg_obj
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Brandon Maier <brandon.maier@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon, Neal,

On Sat, 10 Dec 2022 09:55:01 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Brandon,
> 
> > BR2_TARGET_UBOOT_ZYNQMP_PM_CFG only works with C files, as it always tries to process them through tools/zynqmp_pm_cfg_obj_convert.py. Rework the logic so if the pm_cfg_obj isn't a C file, it is provided directly to U-Boot.  
> 
> Good idea to add this support.  It is true that since developers cannot build the pmufw with buildroot, it makes sense that they may also
> build the pm_cfg_obj.bin binary outside of buildroot as well.
> 
> 
> > +	$(if $(filter %.c,$(UBOOT_ZYNQMP_PM_CFG_PATH)),
> > +		$(UBOOT_DIR)/tools/zynqmp_pm_cfg_obj_convert.py $(UBOOT_ZYNQMP_PM_CFG_BASENAME).c $(UBOOT_ZYNQMP_PM_CFG_BASENAME).bin
> > +		$(call KCONFIG_SET_OPT,CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE,"$(UBOOT_ZYNQMP_PM_CFG_BASENAME).bin"),
> > +		$(call KCONFIG_SET_OPT,CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE,"$(UBOOT_ZYNQMP_PM_CFG_PATH)"))
> >  endef  
> 
> Just a question to the community.  Should we handle the error when a user configures the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to be a file
> that is not a c file nor a binary file?  With the above if statement, the file would get fed directly into u-boot and the build process will succeed.
> However, the user will get a run-time error at boot time when the spl attempts to load an invalid pmu configuration blob.
> 
> In the previous version, when we only accepted c files, the zynqmp_pm_cfg_obj_convert.py would error out causing a build failure if the input
> file was not an expected pm_cfg_obj.c file.
> 
> So the question is which is better.  If the user configures an invalid file format, should there be a build failure or a run-time boot failure?

How would you detect which binary is "valid"? It's a pretty fuzzy
definition.

We definitely don't check the validity of other binaries the user wants
to use (the pmufw to name one), which makes sense as Buildroot users
need to understand what they are doing after all.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
