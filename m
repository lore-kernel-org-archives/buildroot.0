Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B707C636D6
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C420F415E1;
	Wed,  8 Feb 2023 11:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C420F415E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETw590wYmVek; Wed,  8 Feb 2023 11:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CCA2414E4;
	Wed,  8 Feb 2023 11:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CCA2414E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 119371BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2C9240BDE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2C9240BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTqObYCZMicO for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:08:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FDBD40BD2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FDBD40BD2
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:08:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6A89A1C000E;
 Wed,  8 Feb 2023 11:08:33 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:08:32 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208120832.16e3a7c4@windsurf>
In-Reply-To: <20230207171721.2973997-3-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-3-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675854514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rM40NE/d491Rg+m/715AFkukvyc5nH2WTlET/FtGJ80=;
 b=c5zqUE/Semc2KmXQSJYmcVJRpqtSKLYjk+i7cEAaKYA9JuWDlJGc/S3sQom8vuib5iHdAq
 mAZL2ZTHXwAgUxFg7RpgYjrk0o1/2hjatMER1tJ+pQZ1RR5B8xBV2HICeaMclgbOKhCDct
 hgov/qSk9kEZhtSa75OmNFtfilgfxF3VSPJ/nShtcbJN1/lyxxVhHtDktLJYajkV45odhb
 5PJe/E/4ty2OY6H+QmJPtonKMp3Vl6nNI3rZYkSXQKZU5zBj0bZKVINp8QQY68du285tSc
 8cNex48QyRiDKIuEJnbNgH52y2FNo7U5nxFC8BAZLQR5TYsmViYokhiTpX7Usw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c5zqUE/S
Subject: Re: [Buildroot] [PATCH v6 02/13] package/qt6/qt6base: add support
 for fontconfig/harfbuzz
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
Cc: jesseevg@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 18:17:10 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Jesse Van Gavere <jesseevg@gmail.com>
> 
> Additionally the harfbuzz license file is added and the hash for this is
> also added to the hash file
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/qt6/qt6base/Config.in    | 17 +++++++++++++++++
>  package/qt6/qt6base/qt6base.hash |  1 +
>  package/qt6/qt6base/qt6base.mk   | 23 +++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
> index 1810b1586d..594221b792 100644
> --- a/package/qt6/qt6base/Config.in
> +++ b/package/qt6/qt6base/Config.in
> @@ -59,6 +59,23 @@ config BR2_PACKAGE_QT6BASE_XCB
>  comment "X.org XCB backend available if X.org is enabled"
>  	depends on !BR2_PACKAGE_XORG7
>  
> +config BR2_PACKAGE_QT6BASE_FONTCONFIG
> +	bool "fontconfig support"
> +	select BR2_PACKAGE_FONTCONFIG
> +	help
> +	  This option enables Fontconfig and Freetype support using
> +	  the system fontconfig and freetype2 libraries.

It doesn't enable fontconfig and freetype, but only fontconfig.
Freetype is unconditionally enabled for the GUI module.

I fixed that up when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
