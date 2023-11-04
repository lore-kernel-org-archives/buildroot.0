Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BB0C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9107C400BD;
	Sat,  4 Nov 2023 18:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9107C400BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdJUU_RVI2bm; Sat,  4 Nov 2023 18:18:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AEF440164;
	Sat,  4 Nov 2023 18:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AEF440164
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7EDB1BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A196360BC5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A196360BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygm7EKLDZa9D for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:18:36 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36E2860BAF
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E2860BAF
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1F6EFF803;
 Sat,  4 Nov 2023 18:18:33 +0000 (UTC)
Date: Sat, 4 Nov 2023 19:18:32 +0100
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20231104191832.29e6cfc6@windsurf>
In-Reply-To: <20231024184835.3911-2-brandon.maier@collins.com>
References: <20231019203338.6450-1-brandon.maier@collins.com>
 <20231024184835.3911-1-brandon.maier@collins.com>
 <20231024184835.3911-2-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699121914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3mWIBp9J+QHj32/dM+frlq6cBFdgJOCmR6dnx84Ugc=;
 b=mw2xidbbVPX8MXrhlFDpgyzl9k/PC5WRXd1Svw8FM1VpEZsthG8LAgcefFgx+nvYEgB5Jf
 aJLcF4Sp7deQdp4/Xh9jPH2fTQQ8VdPXK31Lvl0+139A11IS/lVEcorJJjhTwlNTBEHR5y
 LHU9kEE9XosunzlnEBsOEWTxMGvBnZRbjuowEc1n5l3PQgVtfD41SLbni+0PG2TpmWn5Bv
 gt6PFlyVqYkh65cVmsJyViSKTyq1ABNd1fFPgDSrzF/4L73SkkNfRqcxnDszLr0Mup9PCA
 BgkIAd/uacVxwkwEUXif21nKdpeddbUqSVb/lXF6TsDCPMGrz9G64KYWbRbbkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mw2xidbb
Subject: Re: [Buildroot] [PATCH v2 2/2] package/wireless_tools: add option
 to build ifrename
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>, "Neal J.
 Buchmeyer" <neal.buchmeyer@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 24 Oct 2023 18:48:35 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
> index f676e33b57..d7f2ed2381 100644
> --- a/package/wireless_tools/Config.in
> +++ b/package/wireless_tools/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_WIRELESS_TOOLS
>  	bool "wireless tools"
>  	select BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG if \
> +		!BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME && \
>  		!BR2_PACKAGE_WIRELESS_TOOLS_LIB
>  	help
>  	  A collection of tools to configure wireless lan cards.
> @@ -15,6 +16,11 @@ config BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG
>  	  Build and install the iwconfig, iwlist, iwspy, iwpriv, and
>  	  iwgetid tools.
>  
> +config BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME
> +	bool "Add ifrename"

Changed to:

	bool "Install ifrename"

>  define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true \
> -		$(WIRELESS_TOOLS_INSTALL_TARGETS)
> +	$(if $(WIRELESS_TOOLS_INSTALL_TARGETS),
> +		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" \
> +		LDCONFIG=/bin/true $(WIRELESS_TOOLS_INSTALL_TARGETS))

Indented this last line with one more tab.

And applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
