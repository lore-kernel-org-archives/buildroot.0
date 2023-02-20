Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E0BC636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 14:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16954409F3;
	Mon, 20 Feb 2023 14:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16954409F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mos0MAmduzsv; Mon, 20 Feb 2023 14:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16DCC4098E;
	Mon, 20 Feb 2023 14:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16DCC4098E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5800B1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 14:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 324A740102
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 14:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 324A740102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lr5nxpW84ait for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 14:59:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D39F240101
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D39F240101
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 14:59:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 27C80FF810;
 Mon, 20 Feb 2023 14:59:10 +0000 (UTC)
Date: Mon, 20 Feb 2023 15:59:09 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220155909.634ee802@windsurf>
In-Reply-To: <CAPi7W81cfaQ_Gk5u5sNHufCATEdrYM4Lgi2gH6hPySPwEYE=jQ@mail.gmail.com>
References: <20230220112410.953669-1-fontaine.fabrice@gmail.com>
 <20230220150704.7ff37d71@windsurf>
 <CAPi7W81cfaQ_Gk5u5sNHufCATEdrYM4Lgi2gH6hPySPwEYE=jQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676905152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P1TR38zsdNqtnLHj70WsfF0Kwd3h/17DuEK54etdk1k=;
 b=WrRNRxkP9pXF+/NMWbjywFMLSFaKmidfN0z04JCaIVit6wWHnqcODqcsxyzSW4mPuc8eld
 bYiTCdYTg3tCH2+nzGfpMC6rTf4DYb8dP8GHo+pHKpAw2nN7sqzI8uuUScL5fxbzPSGx6r
 PJxTnAuv5L6L2cNfs1H5ja+fop8ALN4grU6BpHTeUI/gm8bDp3GwyLb5jCja3726P8xrey
 phOKspxpQOYDetkybN5d08UjEJSSMIYQ8GdhSKJTommSvBhwILfffh2tQcYz9CDlPASJEd
 S0BeuDg2AVLlriIIWsky3aCrTdP8ulaUGOaBgnQJsiH8In5sFvDIq3neZA9R3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WrRNRxkP
Subject: Re: [Buildroot] [PATCH 1/1] package/glslsandbox-player: fix build
 with rockchip-mali
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 15:23:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Patching rockchip-mali is probably better but I don't know what version
> number should be put inside glesv2.pc.
> Should I hardcode 2 in the pkgconfig file?

I guess whatever works for glslsandbox-player. Packages like
rockchip-mali are anyway crappy.

> Moreover, should I patch the file through a sed in buildroot or send an
> upstream patch?
> Upstreaming this change is probably impossible as rockchip-mali uses a
> commit from October 2018 and the pkgconfig is not available anymore in
> usptream master.

I suppose a patch is fine, and it won't be upstream. As said above,
those OpenGL blobs are anyway crappy :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
