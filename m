Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7029C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 20:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8352A605F4;
	Mon, 24 Aug 2026 20:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAIlafGlb5c0; Mon, 24 Aug 2026 20:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787602225;
	bh=pbe16k1YoezgCjVIdZtzzhB5Vfhr3kRNoVPoc1SpEZo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sbVe1Ho92dqY80wuXMdxlbg/CqxVbkEsdxvIR/kTrydU4YLg5hSEYpLecfc/Z+iGV
	 fo/hw9UrsTiWfsecSzeeEwNTopAgqA9+kwThU4HjlwkUPc1R6Xx8+/RzqNf8WSzU40
	 ayodnzLe8ntK81U4HCK++5aSh5mzmykroEWx3W8t9n6LoxpQI8l//4Qor7g4l5kJLy
	 lghqjuHqMoTy6zoBarfYDy6kn1ipv0PtIDzWkk8ANRz//MRgFe5/inOI6Bt7TbnWRm
	 pEAwNbMb+Gz1Aq/xr3EUajRLzxQBQdBPtRushg/n8LcbUxIYKeKZBx6fCIVXGuah2a
	 fJVjZSnZAl2dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A8160608;
	Mon, 24 Aug 2026 20:10:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01C5B118
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F387F60608
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9iRKKdPvVid for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 20:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BA83605F4
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:10:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 87E414E4139F
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:10:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3540C5FFC1;
 Mon, 24 Aug 2026 20:10:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20EDE11C79BAA; 
 Mon, 24 Aug 2026 22:10:14 +0200 (CEST)
Date: Mon, 24 Aug 2026 22:10:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aoylEIF6U_Ij1Bjz@windsurf>
References: <20260724164829.304335-1-bernd@kuhls.net>
 <20260724164829.304335-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260724164829.304335-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] package/taglib: bump version to 2.3.1
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

On Fri, Jul 24, 2026 at 06:48:29PM +0200, Bernd Kuhls wrote:
> https://github.com/taglib/taglib/blob/v2.3.1/CHANGELOG.md
> https://mail.kde.org/pipermail/taglib-devel/2026-July/003124.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Because the amount of changes is really limited to fixes, I've applied
this version bump to master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
