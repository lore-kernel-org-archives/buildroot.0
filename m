Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DFDC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABCDB815AC;
	Wed, 28 Dec 2022 19:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABCDB815AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRVPJLoVTXSa; Wed, 28 Dec 2022 19:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2E4981584;
	Wed, 28 Dec 2022 19:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2E4981584
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 904221BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E7F1404DA
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E7F1404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PEJ7jza1ozf for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:52:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DE42404D8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DE42404D8
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:52:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6098C0004;
 Wed, 28 Dec 2022 19:52:10 +0000 (UTC)
Date: Wed, 28 Dec 2022 20:52:09 +0100
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20221228205209.5ed73ae5@windsurf>
In-Reply-To: <20221220200805.2686768-1-f.fainelli@gmail.com>
References: <20221220200805.2686768-1-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672257131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RH9GOsYqRIFo2/VvmHdgOUb9izqmuM6dqZxqr6uZrJs=;
 b=IDy0EeJSIWGxTfWF4KAMnYvmL6nxM7dbyb2DEhaBUvip/H7i6ttFOVidCV13TkZ4TprV0P
 sQf5ZefkoL1JBD34c1RplsvOqISw51srW4OLYZkKSpFpNZak0rhdUUjMRt6srxTVfWfa68
 4opes+MCmNIkw9ViGRj/8ckE2zjnukryJIi2RCL+rCDjSiSpuQ6hDf3RrM9t3kk3j8/mfy
 vcT2tVeVI0y0P68wSyQO0FjWBZhSJ0scPNH2RSVGTZHOHAs9X4LGyCWmYZJfkIrTVt3vKU
 9yJdshAbP+MQQipY8NMfLN1grMGv2cmKlNRnYSnof6NXXcEwu/qiaxmOFqGTUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IDy0EeJS
Subject: Re: [Buildroot] [PATCH] package/slang: Add option to enable/disable
 slsh
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, yann.morin.1998@free.fr,
 mmayer@broadcom.com, buildroot@buildroot.org, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florian,

(Hope you're doing well!)

On Tue, 20 Dec 2022 12:08:05 -0800
Florian Fainelli <f.fainelli@gmail.com> wrote:

> The S-lang shell is currently installed by default but most packages are
> typically interested in the shared libraries only. Add a configuration
> option to disable the slsh program and its supporting files.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

I've applied to master, with some small changes, see below.

> diff --git a/package/slang/Config.in b/package/slang/Config.in
> index a500ff5b7d75..b09b0cd8fc84 100644
> --- a/package/slang/Config.in
> +++ b/package/slang/Config.in
> @@ -5,3 +5,10 @@ config BR2_PACKAGE_SLANG
>  	  Multi-platform console display library.
>  
>  	  http://www.jedsoft.org/slang/index.html
> +
> +config BR2_PACKAGE_SLANG_SLSH
> +	bool "enable slsh"
> +	default y

I dropped this "default y". I know you added it to preserve existing
behavior, but we also try in Buildroot to aim for minimalism. Since I
believe most people who had slang enabled needed only the shared
library, it makes sense to have slsh disabled by default. We'll see if
some users complain about this.

> +	depends on BR2_PACKAGE_SLANG

Changed to a if ... endif block.

> +ifneq ($(BR2_PACKAGE_SLANG_SLSH),y)

Changed to positive logic:

ifeq ($(BR2_PACKAGE_SLANG_SLSH),)

> +define SLANG_REMOVE_SLSH
> +	rm -rf $(TARGET_DIR)/etc/slsh.rc \
> +		$(TARGET_DIR)/usr/share/slsh \
> +		$(TARGET_DIR)/usr/bin/slsh
> +endef
> +endif
> +
> +SLANG_POST_INSTALL_TARGET_HOOKS += SLANG_REMOVE_SLSH

Hook registration moved inside the ifeq ... endif block.

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
