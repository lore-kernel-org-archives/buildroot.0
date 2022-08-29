Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD25ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DEE340869;
	Mon, 29 Aug 2022 20:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DEE340869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQ9GcCKzlFcC; Mon, 29 Aug 2022 20:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0803040290;
	Mon, 29 Aug 2022 20:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0803040290
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72BFA1BF3D9
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 598DE40867
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 598DE40867
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WWGPzbuMUP4 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:07:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBC31405CE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBC31405CE
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:07:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C5171240004;
 Mon, 29 Aug 2022 20:07:56 +0000 (UTC)
Date: Mon, 29 Aug 2022 22:07:55 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220829220755.1c08d57d@windsurf>
In-Reply-To: <20220826135503.20612-8-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-8-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661803677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0vGq31shM2W7fSqa5+IrmoivHWaFKCdG2FZB4TM1t0=;
 b=en3V/2ov+Y7oRf4/4d6VTeRCpW/V/CrePPJeIeHIK2Q/Yoxzlp6ng3riLfIATxS5jyE597
 e6B59HU01DUvGFzGqLrkTJvwaB0+UAwd8ukA105i2O+BcnG32Hwh5RTszXwcziwv3bslxJ
 sRPKoq3CWtDsfXziatwl1noQbL3tuGSbcqp6dr6x24kejU4alhy5xLmfA8+j7acw3jjnDG
 m72CgMDnjLCOPpecEqcF8Lpj0gvZPAN5vM5JbKaQQ5vom6wPhArgDYyK1oKxly7mMpzHTZ
 BFNcy4jUl9F2Iu1OjtE44KoR9H5HXRmvg929qKOpXroBwUQcaNJFJV1rJef1DQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=en3V/2ov
Subject: Re: [Buildroot] [PATCH v4 07/29] package/qt6/qt6base: add support
 for dbus module
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

On Fri, 26 Aug 2022 15:54:41 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  package/qt6/qt6base/Config.in  |  8 ++++++++
>  package/qt6/qt6base/qt6base.mk | 11 +++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
> index 354e02280a..2d4a4df223 100644
> --- a/package/qt6/qt6base/Config.in
> +++ b/package/qt6/qt6base/Config.in
> @@ -22,6 +22,14 @@ config BR2_PACKAGE_QT6BASE_CONCURRENT
>  	help
>  	  This options enables the Qt6Concurrent library.
>  
> +config BR2_PACKAGE_QT6BASE_DBUS
> +	bool "DBus module"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_DBUS
> +	help
> +	  This option enables the D-Bus module.
> +
>  config BR2_PACKAGE_QT6BASE_NETWORK
>  	bool "network module"
>  	help
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index fd1e0a2847..fdb3377eb4 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -77,6 +77,17 @@ define HOST_QT6BASE_INSTALL_CMDS
>  	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
>  endef
>  
> +ifeq ($(BR2_PACKAGE_QT6BASE_DBUS),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
> +QT6BASE_CONF_OPTS += -DINPUT_dbus=linked
> +QT6BASE_DEPENDENCIES += dbus
> +HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
> +HOST_QT6BASE_DEPENDENCIES += host-dbus

I've added a comment to explain why this is necessary, and I've applied
to next.

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
