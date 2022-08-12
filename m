Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470C8C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 13:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A815883DF0;
	Fri, 12 Aug 2022 13:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A815883DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iC1VTEcjt5JH; Fri, 12 Aug 2022 13:27:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF62683DB7;
	Fri, 12 Aug 2022 13:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF62683DB7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C61701BF23C
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 13:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A08FC83DB7
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 13:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A08FC83DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4boMHny_Qe7 for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 13:27:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A80683147
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A80683147
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 13:27:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D4A3E6000A;
 Fri, 12 Aug 2022 13:27:47 +0000 (UTC)
Date: Fri, 12 Aug 2022 15:27:46 +0200
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Message-ID: <20220812152746.73e52009@windsurf>
In-Reply-To: <YvYUjNF8t6h19g4H@nitrogen.local>
References: <20220811122011.716045-1-bram.vlerick@openpixelsystems.org>
 <20220811224144.78b1581a@windsurf>
 <YvYUjNF8t6h19g4H@nitrogen.local>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660310868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lh4MmOt8Sbkeii4GF9K2oeQ5ew2Cb0jd+0dG1cv6eKI=;
 b=FCxucbbX3H4sQCAFp8wFryzKnUfSt/JoFAzaJxClgLDzdJB+xd7haySx2S+YRjsHnmrQtY
 3ahfmcJyIqqMU3FYJBPN2iTECaAgHdT73bmJmu2cl0ho3BqRX/Y2DUyX6bmcn6kiX6iSL2
 5P0zlvIH0QbOGcz5k2Je/HTY86++RcTzg9Fe9yJu76ryFEXeujYmeXzfHtppZPFE83jx35
 rDhhgbkhBQD3u8RlKw60NJt/ix8amOBkwUkKfbH7BRYSuL4JRjK5OazCUGe4XVZaGWnC8z
 8G2d/kEnCZcOyyj+TAG5I7p8ionAatSV9YuqlBMRC5Yj+1W3/NAyADiE3SuLSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FCxucbbX
Subject: Re: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: allow
 lpddr4 firmware version override
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bram,

On Fri, 12 Aug 2022 10:51:24 +0200
Bram Vlerick <bram.vlerick@openpixelsystems.org> wrote:

> I'm currently adding the suggested changes. With regards to the suggestion below.
> The DDR3 and DDR4 already have a "hardcoded" version selected. What would be the
> prefered approach, adding a default value in the firmware-imx.mk for both the DDR3
> and DDR4 cases. Or would it be better to update the individual defconfig and add
> the BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION variable to the configs?

Good point. Then in order to preserve backward compatibility, I would suggest:

config BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION
	string "DDR3/DDR4/LPDDR4 firmware version"
	# Needed for backward compatibility, the package used to
	# unconditionally use HW version 201810 on DDR3/DDR4 before the
	# FW version was made configurable
	default "201810" if BR2_PACKAGE_FIRMWARE_IMX_DDR3 || BR2_PACKAGE_FIRMWARE_IMX_DDR4
	help
	  ...

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
