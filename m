Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022CEC19F2B
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 10:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EF0960D58;
	Thu,  4 Aug 2022 10:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF0960D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBLQnQxBic9W; Thu,  4 Aug 2022 10:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92655607C9;
	Thu,  4 Aug 2022 10:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92655607C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F68A1BF30E
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 10:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25FFA410DC
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 10:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25FFA410DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tgwSeAOGlk5 for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 10:57:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A076409EA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A076409EA
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 10:57:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BAF6960008;
 Thu,  4 Aug 2022 10:57:08 +0000 (UTC)
Date: Thu, 4 Aug 2022 12:57:07 +0200
To: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
Message-ID: <20220804125707.7d37891a@windsurf>
In-Reply-To: <20220804.150530.297560290822781428.atsushi.nemoto@sord.co.jp>
References: <20220804.150530.297560290822781428.atsushi.nemoto@sord.co.jp>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659610629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOAYjO5HPo4oT3rsQkaprHxT5v0tQIJs4Kg3J49ai8A=;
 b=a9yEIbvvFT7CVBs1H8gyD8ntdyLpL+RyQiB4g/afR6gBO/W8AEvQtES0l4ixu2Ap45DMGf
 Lj+iuq3a266sfwyBbZR6I07EmpKKqm11gOBHxyoLZNGVX00zB7QITH2l9ujJJmwl2uFhor
 9jG+XRUfkmkSkZuZbL89RTj+858drqpeNE4bNzPKbGiEA0JieH5len15nebosolLzJux59
 VRhH9wqLqvYh3mk9S0AmDVHJDQyVo7gT+Cd4XVn6yW1h53ZwPOfEzgoUnJIu2aEerkK5A+
 lU+Gn+HFlX2g+XaPxbnr4mzVlx8FzmeTGVcQK85PnEzhHWTbd0wrZJydpVD4eA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a9yEIbvv
Subject: Re: [Buildroot] [PATCH] package/uboot-tools: fix dumpimage for FIT
 image
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 04 Aug 2022 15:05:30 +0900 (JST)
Atsushi Nemoto <atsushi.nemoto@sord.co.jp> wrote:

> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 7cd527ad12..d884a010fb 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -22,6 +22,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
>  	touch $(@D)/include/config/auto.conf
>  	mkdir -p $(@D)/include/generated
>  	touch $(@D)/include/generated/autoconf.h
> +	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),'#define CONFIG_FIT_PRINT 1') >> $(@D)/include/generated/autoconf.h
>  	mkdir -p $(@D)/include/asm
>  	touch $(@D)/include/asm/linkage.h
>  endef
> @@ -111,6 +112,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
>  	touch $(@D)/include/config/auto.conf
>  	mkdir -p $(@D)/include/generated
>  	touch $(@D)/include/generated/autoconf.h
> +	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),'#define CONFIG_FIT_PRINT 1') >> $(@D)/include/generated/autoconf.h
>  	mkdir -p $(@D)/include/asm
>  	touch $(@D)/include/asm/linkage.h
>  endef

Thanks for the bug report and proposed fix! Could we try to keep this
in the style of what is already done in the package, so something like
this:

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 7cd527ad12..b6429cbbed 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -33,7 +33,7 @@ UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
        STRIP=$(TARGET_STRIP)
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_FIT_PRINT=y CONFIG_MKIMAGE_DTC_PATH=dtc
 UBOOT_TOOLS_DEPENDENCIES += dtc
 endif
 
@@ -121,7 +121,7 @@ HOST_UBOOT_TOOLS_MAKE_OPTS = HOSTCC="$(HOSTCC)" \
        CONFIG_EFI_HAVE_CAPSULE_SUPPORT=y
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
-HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
+HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_FIT_PRINT=y CONFIG_MKIMAGE_DTC_PATH=dtc
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
 endif
 
Could you check if this works for your use-case?

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
