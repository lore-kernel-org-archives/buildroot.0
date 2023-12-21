Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE850C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 08:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75F6F8392C;
	Thu, 21 Dec 2023 08:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75F6F8392C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wVjgh_rHMb1C; Thu, 21 Dec 2023 08:33:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC88B8390F;
	Thu, 21 Dec 2023 08:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC88B8390F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC471BF4D5
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 08:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2AF1607C9
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 08:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2AF1607C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSRIUO9bhjy4 for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 08:33:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A5A660670
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 08:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A5A660670
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6E841C0007;
 Thu, 21 Dec 2023 08:33:05 +0000 (UTC)
Date: Thu, 21 Dec 2023 09:33:04 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231221093304.3b68da4b@windsurf>
In-Reply-To: <20231221001924.1356215-2-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
 <20231221001924.1356215-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703147585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WUvw7ozcS30Npa5YAMT9chCmh73/6e8Oy8y9No7JVyM=;
 b=IvHDAq3X6RAHQiOLum+5maAAdUnvqmQBadI26huJgoHI6GLfwraW3NWiRDopTuAvtBpJrg
 8Il7yPvKxKC39G/pKeIYIF1NC5W6lTmyFIqo9XppThzNF3UTxgSV82dRmZiXvqwo2t5qCu
 fVx06/WJXncDCCTySaCtKjGihheXyBpgv0kYX4d136xAxkHl8RQCHrDybwaKMvrHTv1uJJ
 daH9u4jMco42/QzLMBBmgPzuvDdsnsVLb9I0S7PPetztOFq2fMSloNSF/dlA/XYsB5iruK
 qbNb5Ut4oG2dk+0fHnlpstYQNWWqxy7LDSmfdHNXJKKFkBS2TJqLVGUJ2BnL6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IvHDAq3X
Subject: Re: [Buildroot] [PATCH v3 02/10] package/dmenu-wayland: new package
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

Hello,

Thanks for this new iteration.

On Wed, 20 Dec 2023 17:19:16 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> diff --git a/package/dmenu-wayland/Config.in b/package/dmenu-wayland/Config.in
> new file mode 100644
> index 0000000000..111bbfb434
> --- /dev/null
> +++ b/package/dmenu-wayland/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_DMENU_WAYLAND
> +	bool "dmenu-wayland"
> +	depends on BR2_USE_MMU # pango -> lib2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2, wayland
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuz
> +	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
> +	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype support
> +	depends on BR2_USE_WCHAR # pango -> glib2

You did not re-use the suggestions from my feedback.

> +DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
> +DMENU_WAYLAND_SITE = https://github.com/nyyManni/dmenu-wayland.git

Ditto.

Please send new iterations less quickly, but with more
review/testing/validation.

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
