Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC2EC001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 16:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38B6D4095F;
	Sun,  6 Aug 2023 16:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38B6D4095F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WM1pagAI1fAY; Sun,  6 Aug 2023 16:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7200040533;
	Sun,  6 Aug 2023 16:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7200040533
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D52241BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 16:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CC20607F0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 16:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC20607F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HlZbl-iAcMW for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 16:05:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6241F60769
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 16:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6241F60769
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BCCC60004;
 Sun,  6 Aug 2023 16:05:24 +0000 (UTC)
Date: Sun, 6 Aug 2023 18:05:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806180523.2a2178e6@windsurf>
In-Reply-To: <20230718221120.1433795-1-bernd@kuhls.net>
References: <20230718221120.1433795-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691337924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ABSNCRuSA/OzYAl/7r9gnr/xxXni+TUOwED3vgVL8Y=;
 b=D1fr6Spy07L5ax/TsZhC4RGWOLQPGvtizHGlR36KW36G02+XYHwEOmSR/HyPfQ6XTkSrJE
 VIgu89aI+tVnX+Ogd+0W8h6SkQFqDrHbpdvfjDr743apoikAdy5tVOs+NwUhfHd+/4knKx
 MGZkCpXbKVLPS3+yT8ZqWEIGq3C86brCZOXFf3sRaM5lIObQs1BXg2fchQBfs3ftLuBCg3
 CP/YC1+H9QE3b4IS+c5l9dqedrjXahwbRN053cuZ3p2+JQDIVMGkeRYK4jtctYCVZ8SpRj
 7CyDA4SFg/3xdVSXi1TxPSB4g2Gk1qlXeXu+xOD0QK+rU4xLMVD+RBl4TTJ4bQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D1fr6Spy
Subject: Re: [Buildroot] [PATCH v2 1/1] package/kodi: fix filenames of kodi
 host utils
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

On Wed, 19 Jul 2023 00:11:20 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> The variables WITH_JSONSCHEMABUILDER & WITH_TEXTUREPACKER are defined as
> directories:
> https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindJsonSchemaBuilder.cmake
> https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindTexturePacker.cmake
> 
> and during configure kodi searches these directories for usable binaries
> with the name scheme.
> 
> ${APP_NAME_LC}-JsonSchemaBuilder
> ${APP_NAME_LC}-TexturePacker
> 
> which translates to kodi-JsonSchemaBuilder and kodi-TexturePacker.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: also updated kodi-skin-confluence.mk

Applied to next with an improved commit log that explains this is just
an improvement and it doesn't fix any build/runtime issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
