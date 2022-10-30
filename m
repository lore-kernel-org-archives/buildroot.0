Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AC8ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA6BF60A90;
	Sun, 30 Oct 2022 20:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6BF60A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxY3xFHyJvsN; Sun, 30 Oct 2022 20:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96AF860888;
	Sun, 30 Oct 2022 20:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96AF860888
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B299D1BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A8BD400EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A8BD400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnflvZx2Fz3k for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:48:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB343400DC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB343400DC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:48:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6735460003;
 Sun, 30 Oct 2022 20:48:11 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:48:09 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221030214809.1fa5997c@windsurf>
In-Reply-To: <20221014065900.3311604-4-angelo@amarulasolutions.com>
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
 <20221014065900.3311604-4-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667162892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWykWcpzIoqq0zRslVNMwcJk/33BVgb6vbG7EQ5gIYY=;
 b=J+ZbaxBADrh2nPH4dzRGcjYmunQj1NoLi7eFOac6aedwJt+qFNtIHWKa2QE2vrllTyQuth
 zQnwvXEI6u1C9+VFQ6T9R6l0eeiL/Yqn3msSEmtrfJ1e58wY2dvs2Mv6LeVAKBsvRguDRH
 6kg8+zyjw16kRASdHvnGxWyN+FSMQWb/y+s/+OXvIiKpkgvB0VawmkhlO4KPGb/FRChDAZ
 x/lSGHbk3H2fOJGj2sdQxIeGvzkWlPZ2kpK3maNa2qxXz1Wa7PegZTOdVJ+JwKz/Blt298
 rdoOT22j7K85QfRuN0KgGcplvfVWMqsRG8hHJNanrzadGLEWw9OHYDO+EtJ0wA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J+ZbaxBA
Subject: Re: [Buildroot] [PATCH v2 3/5] ackage/rtl8723ds-bt: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 14 Oct 2022 08:58:58 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> @@ -78,7 +78,8 @@ LINUX_DEPENDENCIES += \
>  	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
>  	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
>  	$(if $(BR2_PACKAGE_FIRMWARE_IMX),firmware-imx) \
> -	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
> +	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb) \
> +	$(if $(BR2_PACKAGE_RTL8723DS_BT),rtl8723ds-bt)
>  
>  # Starting with 4.16, the generated kconfig paser code is no longer
>  # shipped with the kernel sources, so we need flex and bison, but
> diff --git a/package/Config.in b/package/Config.in
> index e3a34d6e97..4f6e508106 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -578,6 +578,7 @@ endmenu
>  	source "package/rtl8189fs/Config.in"
>  	source "package/rtl8723bu/Config.in"
>  	source "package/rtl8723ds/Config.in"
> +	source "package/rtl8723ds-bt/Config.in"
>  	source "package/rtl8812au-aircrack-ng/Config.in"
>  	source "package/rtl8821au/Config.in"
>  	source "package/sane-backends/Config.in"
> diff --git a/package/rtl8723ds-bt/Config.in b/package/rtl8723ds-bt/Config.in
> new file mode 100644
> index 0000000000..ab4ba0bf11
> --- /dev/null
> +++ b/package/rtl8723ds-bt/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_RTL8723DS_BT
> +	bool "rtl8723ds-bt"
> +	help
> +	  rtl8723ds UART attached Bluetooth driver

So here you're saying this package is for a driver.

> +define RTL8723DS_BT_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_SERIAL_DEV_BUS)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_SERIAL_DEV_CTRL_TTYPORT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART_3WIRE)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART_RTL)
> +	$(call KCONFIG_APPEND_OPT,CONFIG_EXTRA_FIRMWARE,rtl_bt/rtl8723ds_fw.bin rtl_bt/rtl8723ds_config.bin)
> +endef
> +
> +define RTL8723DS_BT_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/lib/firmware/rtl_bt/
> +	cp $(@D)/8723D/rtl8723d_fw $(STAGING_DIR)/lib/firmware/rtl_bt/rtl8723ds_fw.bin
> +	cp $(@D)/8723D/rtl8723d_config $(STAGING_DIR)/lib/firmware/rtl_bt/rtl8723ds_config.bin

But here you are only installing the firmware file, and you're not
building the kernel module that is provided in this Git repository.

Is it because the driver is in the upstream kernel, and the only part
that it lacks is the firmware?

This is not really clear in your commit log nor in the Config.in help
text.

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
