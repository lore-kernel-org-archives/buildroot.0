Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F86CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FD7542EF0;
	Sat, 30 May 2026 15:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRusYyqAZbyp; Sat, 30 May 2026 15:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3775D42EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780155238;
	bh=aLmhEAied6LCnafEvrhS3G+5DV1IcJs7+WaiU+pryx0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=You7/LTG0BysaqQsvZqaLTmVbx3QAksey4kRCvV3Mm55y2ytPBXMRq+gjdu7mwIdS
	 J9Oka3J/H+Zm5zLSm1t90eTEr32BPZCJ/oY+L1SSL+lqMMrzLcFmFfSnfC3JKRDxAa
	 ruwYudcjdGB8FDI0vnjDY1AyRYdRx1nKibUPnM4fN8Y6prOIW0L0eFJkb3AL1vBZI5
	 vYydorrprUMqbqmAJn8LFMyXwDAnr0YxXDXbijGELU4xZTy5mXNnXKntq3lcrctpjb
	 M30mhtaMVz+/6erdLnarDWn3aVj7r8Cyyhk2aSVrZk9IzyK3fvlpd2xQ/759FBpAuE
	 yVwy+p3K0OJFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3775D42EF5;
	Sat, 30 May 2026 15:33:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43613F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 351A642EF5
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m41ns5SesaMk for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62C6F42EF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62C6F42EF0
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62C6F42EF0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:33:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 93FE14E42DA4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:33:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 566BD6073B;
 Sat, 30 May 2026 15:33:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A9FFF10888CD2; 
 Sat, 30 May 2026 17:33:51 +0200 (CEST)
Date: Sat, 30 May 2026 17:33:50 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahsDJ9eEdu3rwL0C@windsurf>
References: <20260404111250.154311-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260404111250.154311-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780155232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Z5u1AxUroeyZz9//tiFjX4xpWX0DdfKg0RgicTZQZHQ=;
 b=zqQLE9I+SodAVLG8Z+7dDlAgbFhgYndbQLuWELUF8Fc504EfuSNY8kSAB3Tw/f6x+fHRUw
 LpqCPOFcQHAZLl56KgSoSoPqjQNTCwMw7kFefF9RPeYKr/gfEXmoUMU2tRe/hpa1k++xCP
 GoLTVvClq0F596Dlp89Poq1u1FqSN7BS0BlqhSoymqa2+laf4NA3qQ6f+IkmBGfsTl6Iir
 wE77ihZtkf+VZLqXkS+7IhnNYNNgcmBceaxnOTJnyBI4avfjphaHDm+LB2aN9Ypbxsk/rR
 eaNYd1U4Mvt0IDbAqAd6dpi4rvkqYc2swxXR0I/GmRTAxPV/Hw93348y3dB7Mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=zqQLE9I+
Subject: Re: [Buildroot] [PATCH] package/font-awesome: bump to version 7.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Apr 04, 2026 at 04:42:49PM +0530, Shubham Chakraborty wrote:
> -FONT_AWESOME_VERSION = 4.7.0
> -FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,v$(FONT_AWESOME_VERSION))
> -FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
> -FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
> +FONT_AWESOME_VERSION = 7.2.0
> +FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
> +FONT_AWESOME_LICENSE = OFL-1.1 (fonts), MIT (code), CC-BY-4.0 (icons)

Could you comment on the license changes?

> +FONT_AWESOME_LICENSE_FILES = LICENSE.txt
> +FONT_AWESOME_DIRECTORIES_LIST = css js scss webfonts sprites svgs

Why all those directories should be added? Are they relevant?

This needs more explanation in the commit message.

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
