Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D683DCA9ED0
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ABF280CB0;
	Mon, 12 Oct 2026 10:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGiSgSadfNLF; Mon, 12 Oct 2026 10:30:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 92DA780D05
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791801025;
	b=Iul+utdCKRUU5SKPjbNQMKIWiMrCT9dzy9b53lC3ypbZz+zfkRhftd1DdpCm7aa5K+Nf
	 mIsVvWKbVTelrslWMqxl8pNDd0H88n6qG5K82BIDKFU2LI/Gs2bBeqF7LfDmzBGsnEH3q
	 AYkHUlHwTmF7U00/Wv1tH/dJ9I3qBbn0BPbS2OgbC2Ikl1S3WDE5qcMf3/S6NW42nbfSP
	 P4acmjnt5B8o6ZnFt8FRHMtxe2yqJTgryq1VtoIRmJUOcFNItZ3oXcjAd88gdkECFS8Yn
	 Q2FW+tyeksujRkiWDydfrQYyv/2RiSJT9BLm0PwUczCV5o7Kh1HC3ihYSFtK1DCavUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791801025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ZFdU7PoR4nZyew+iQw4uhyMLQRsY/xtKvtJGDugogl8=;
	b=aEyAyfngq4NFOu3JwcYzI7LwqijbSJfl/NQmxz+hoNQyjHllyVi56G0NYmpXpCHOsN24
	 CubDs20nLmDPfBqqyAEGq1cAVLxisWK3yUvN8ezJxwsabMRw90/uqX3Nc9It94oDaKnC0
	 PALhAlsgxUpcWKFLGA5KL6OhuLDU4X9kBACXgNVYAdIIW5MSE+xpTN0Jfxh09aE8vBrnK
	 BLLbJiWrDFS+q6ysWsh/ud9YHtRWThq6XnGarpWQpRUp4Q2Xd7FzhrHB9mldlGcufe0xG
	 5WmaC//rVXd3IjdaI6bLM5v3IzANiTOIEy/pIUbG4kTy87lV6ord4JgMO/XMXPNWnDg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791801025;
	bh=ZFdU7PoR4nZyew+iQw4uhyMLQRsY/xtKvtJGDugogl8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SwRpTGt++idKxQHeW1ZIFL3OFHpCgcCEI18xAKK4YdLb89HmzfvKOdU6NACUAka5T
	 BIT7kcZrrqe17iH2dBKY24Y9P0/5QUWC9vduVnbmM+egFl3ze7Haw0M0L/+39i3FI9
	 z2aqxMPrVbmCDa38uaNhsOA0AWHTfSgliHhqO8gB4qHBGvJzVtPEpl1oe4aff20D5z
	 zISkDoQ0F7zTk/x9g5utU1Klw/0M99ZzGUvtKiOHPOTOQoaoz43sn8yugDO5welPlm
	 bba+qustYwriuQG5cO1r3j3D79m8PEMeNiuX1Lsk7b5Ts0LJUGv/PvWR+vY++Z540W
	 u179+TWKy62AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92DA780D05;
	Mon, 12 Oct 2026 10:30:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1D37179
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7C7D400E9
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgWi3rQ_JtfJ for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:30:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F1216400D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791801022;
 b=YQWEkOHDrroyakw7IUpoaijbRvPynDFh6my1QCjoyMbcbcmTre2rhk7F9/ldvDq6jupG
 +I9wFDBRRN36WxRlkqrTaIxiMrW7wtAQ5GG98KW1LwreTh9jNQWbOQwf8PnCIJtFw+l0z
 ZAjaMD4ftRCzMlTr20p6jFhRVDxWLOGH9dcQZEmPEaGKQOZdgiVfU2cznQ2+W/qfSyand
 /UpmQpHChqW8m2KHTBxoxonoiVGWCQXDbhG+lpwzMBev5mDa5GDEQhJJShsl4sb6InfEH
 hLIPNZaGwOpVyAfBxEvDqyV2pN351VWFFN0/APHaj3SxvHIRvR5zmb3p50Q6cZKKs/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791801022;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=C9C3NxW4kM9c32z98YDC/lahxSc86GCWB45OY2XfpcA=;
 b=gGSQhbcD+Jvdy59rlobHLxHZhJF81gEtnxFV70tkcwTNhT4Cxp1zlqGbh77C9gVrZ5HQ
 bWOBW7fGv3u74Mhydbp1Hac3Ao4JS5fDtOTVViwiAULp3RjEuWbgVYfmyLK0M/R2FGDNF
 uT/0jqtxIzRFdwCkIDeI0Lv1SoKWTZ3M/LOGChwE/4myNXU5vxGFhJ8xWhkLIUzZtjXPx
 bjRgSbhCOs7JllJLkI3GqJDHNE3LCahvnue40eB+Ej265oWjVO/CKobS8bFM0Fi89yhts
 CLMp4dFj7uaOdRMUWM2iBfdU9VqrRACMIWNioHKctZJzTyoZUdKstF5XU5i2/g5AwwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=d7KDtKhn; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1216400D0
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B617B97A154; Mon, 12 Oct 2026 12:30:13 +0200 (CEST)
To: buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>
Date: Mon, 12 Oct 2026 12:29:38 +0200
Message-ID: <179180053888.385429.18426102584518421112.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260925064257.1162394-7-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-7-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 6/6] package/cutekeyboard: enable build
 with Qt6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Sep 2026 08:42:57 +0200, Dario Binacchi wrote:
> Enable building of cutekeyboard with Qt6. With the merge of
> QuickControls2 into qtdeclarative, the corresponding Kconfig option has
> also disappeared in Buildroot.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>

 Applied to master, thanks!

 Regards,
 Arnout

> ---
>
> Changes v5 -> v6:
>   - Drop the redundant select of BR2_PACKAGE_QT6BASE_GUI, already
>     selected by BR2_PACKAGE_QT6DECLARATIVE_QUICK (Andrea Ricchi)
>   - Add Reviewed-by of Andrea Ricchi
>   - Rebase on version 1.7.0
>
> Changes v4 -> v5:
>   - Rebase on version 1.6.0
>
> Added in v2
>
>  package/cutekeyboard/Config.in       | 12 +++++++-----
>  package/cutekeyboard/cutekeyboard.mk |  6 +++++-
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
> index bd661b0cd42e..ee8017def034 100644
> --- a/package/cutekeyboard/Config.in
> +++ b/package/cutekeyboard/Config.in
> @@ -1,10 +1,12 @@
>  config BR2_PACKAGE_CUTEKEYBOARD
>  	bool "cutekeyboard"
> -	depends on BR2_PACKAGE_QT5
> -	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
> -	select BR2_PACKAGE_QT5DECLARATIVE
> -	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
> -	select BR2_PACKAGE_QT5QUICKCONTROLS2
> +	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE || BR2_PACKAGE_QT6 # qt5declarative
> +	select BR2_PACKAGE_QT5DECLARATIVE if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5DECLARATIVE_QUICK if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5QUICKCONTROLS2 if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAGE_QT6
> +	select BR2_PACKAGE_QT6DECLARATIVE_QUICK if BR2_PACKAGE_QT6
>  	help
>  	  CuteKeyboard is a Qt virtual keyboard plugin for
>  	  embedded applications.
> diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
> index 2b0f5a9f2c2c..baaf371f977d 100644
> --- a/package/cutekeyboard/cutekeyboard.mk
> +++ b/package/cutekeyboard/cutekeyboard.mk
> @@ -6,7 +6,11 @@
>  
>  CUTEKEYBOARD_VERSION = 1.7.0
>  CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
> -CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
> +ifeq ($(BR2_PACKAGE_QT5),y)
> +CUTEKEYBOARD_DEPENDENCIES += qt5declarative qt5quickcontrols2
> +else
> +CUTEKEYBOARD_DEPENDENCIES += qt6declarative
> +endif
>  CUTEKEYBOARD_INSTALL_STAGING = YES
>  CUTEKEYBOARD_LICENSE = MIT
>  CUTEKEYBOARD_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
