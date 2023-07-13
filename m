Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76987C001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B92D405B3;
	Thu, 13 Jul 2023 21:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B92D405B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBCTc45EhxZ9; Thu, 13 Jul 2023 21:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 602EC405AA;
	Thu, 13 Jul 2023 21:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 602EC405AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23D521BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D411660E22
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D411660E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVUPqj5OZqdn for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:25:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85AAA60D78
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85AAA60D78
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:25:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84C411C0002;
 Thu, 13 Jul 2023 21:25:19 +0000 (UTC)
Date: Thu, 13 Jul 2023 23:25:18 +0200
To: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Message-ID: <20230713232518.7aed05dc@windsurf>
In-Reply-To: <20221125102650.2804226-1-adeep@lexina.in>
References: <20221125102650.2804226-1-adeep@lexina.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689283519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/SQ46t8MEMBV81gwA4/Q9KCJwMsW3Hg9/a7H5tg1MM=;
 b=prghZL41RS9sKxgqRvOYe8VXizMqtFNigxXWiF0hORMdR5GyJ0SNF23lLsCnvWQlcrw3/H
 cI0C97gY9b60s3Xhy516BRxvmPdtg5ys5GWA6PrER/q+c7Y1YcviZ/e/tJ15IxWqgNZP+Y
 oYvbCZkg1g7q0L2OzPFgOLnLkZT94XlsSu+2dAGg/DLuSCh2XRwNqbTTzIiZ4CmLlzeg0j
 Wkcx8YWoDAsUwHaAFQyXZGZSIzL9zt85gh3Uztku4AtTuVqZ0ndoAR7BckPrQkiRKUD1Ij
 x3DCd6JLwWFoEuZTt2qiUVH2x/xSMowHFp0KX5mtJAZI6GJ8V3D/rxWKnfKCCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=prghZL41
Subject: Re: [Buildroot] [PATCH] rtl8822cs: new package
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
Cc: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Viacheslav,

On Fri, 25 Nov 2022 13:26:50 +0300
Viacheslav Bocharov via buildroot <buildroot@buildroot.org> wrote:

> This package adds the rtl88822cs WiFi driver.
>    repo: https://github.com/jethome-ru/rtl88x2cs.git
>    branch: tune_for_jethub
> 
> Driver is known to support Realtek RTL8822CS SDIO WiFi/BT chip.
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>

Sorry for the super long delay, but good news: I have now applied your
patch! I made some changes, which I will explain below for your
reference.

First, the commit title should have been:

	package/rtl8822cs: new package

> diff --git a/package/rtl8822cs/Config.in b/package/rtl8822cs/Config.in
> new file mode 100644
> index 0000000000..c887ae7e02
> --- /dev/null
> +++ b/package/rtl8822cs/Config.in
> @@ -0,0 +1,12 @@
> +comment "RTL8822CS needs a Linux kernel to be built"

rtl8822cs in lower-case, like the package name.

> +	depends on !BR2_s390x
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_RTL8822CS
> +	bool "Realtek RTL8822CS SDIO Wi-Fi driver"

Just:

	bool "rtl8822cs"

like the package name.

> +	depends on !BR2_s390x
> +	depends on BR2_LINUX_KERNEL
> +	help
> +          Realtek RTL8822CS Wi-Fi driver as a kernel module (JetHome repository)

Line was slightly too long, so I wrapped it. You can run "make
check-package" to get this kind of sanity checking.

> +
> +          https://github.com/jethome-ru/rtl88x2cs/
> diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
> new file mode 100644
> index 0000000000..11633e1633
> --- /dev/null
> +++ b/package/rtl8822cs/rtl8822cs.hash
> @@ -0,0 +1 @@
> +sha256 4cd97adcf44dc4196fce6f87e68370ad588b19bbc38b246615f9c05739f7bd00  rtl8822cs-db8dc6c7ae1a75af3f6d7fa4f05456c76f5cab3e.tar.gz

         ^^ we want two spaces as a separator

Also, we want a comment that says where the hash comes from. In this case:

# Locally calculated

> diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
> new file mode 100644
> index 0000000000..799a07823d
> --- /dev/null
> +++ b/package/rtl8822cs/rtl8822cs.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# Realtek RTL8822CS driver

Just:

# rtl8822cs

(i.e, just the package name)

> +#
> +################################################################################
> +
> +RTL8822CS_VERSION = db8dc6c7ae1a75af3f6d7fa4f05456c76f5cab3e

I updated that to a newer commit that has fixes to build with Linux >= 6.3.

> +RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
> +RTL8822CS_LICENSE = GPL-2.0

It would be nice to ask the maintainer of this github repo to add a
license file.

> +
> +RTL8822CS_MODULE_MAKE_OPTS = \
> +	CONFIG_RTL8822CS=m \
> +	KVER=$(LINUX_VERSION_PROBED) \
> +	KSRC=$(LINUX_DIR)
> +
> +define RTL8822CS_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
> +endef
> +
> +

One too many newline here.

As I said: I fixed all those minor details and applied to our master
branch.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
