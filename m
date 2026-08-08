Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DEBC5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 18:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E839380DF6;
	Sat,  8 Aug 2026 18:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taKNEalJWKyc; Sat,  8 Aug 2026 18:26:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B47280DF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786213593;
	bh=X2v+QHoTNDlvBJyffb25wMeyz6adVkrredsCrKIFZo0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pk4iUwIXXE6IbydefKacRSVZGzuUhgxdZVysUtpUY7S/FeX0Seek1YtcfAE60QatG
	 Alsridvs+9/aXUbp1fPSMD9SkCFC1ft5kwzGmLSc0uvMIhRu4vX/f8THInl6nZ1uEr
	 bYonKJ0wb9+xVhJhMHjVhvyGRD4+4eoeG3614iBGjySyhuf0bT4/U4mMYHkkPyecSO
	 JAPotBIWQfP48PzJcS1ceQhLDtRFRoPO2qrrzg2a762Ak43SzOLj7pv8c59DKh2r/S
	 NmAq5oGjubK5u0DLmrG8gcp6ys8WT9Pj36rBu5PpU2IKPogWcKcafj+gePBzcT2Lsp
	 VD5JvqsHY6dNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B47280DF7;
	Sat,  8 Aug 2026 18:26:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA750296
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B077960631
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmCcpW3UbAdH for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 18:26:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4A0860625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A0860625
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4A0860625
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:26:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E2D774E41167;
 Sat,  8 Aug 2026 18:26:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A29F86045E;
 Sat,  8 Aug 2026 18:26:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 842F611C4861F; 
 Sat,  8 Aug 2026 20:26:22 +0200 (CEST)
Date: Sat, 8 Aug 2026 20:26:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <and0wgX3tpnbQGBD@windsurf>
References: <20260705182016.3258983-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260705182016.3258983-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786213583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=O/BQfmj5pYloq67lQiW7vqUVYPQAbpDZnGb3oYAmQLk=;
 b=Ihod3eSAIq2nBAqClUq5A7stOCbwOHh6slphPvqh8RgXKk/MKinHULK5/HaVg3CB5ddtiF
 1Hk7BdojOjF6Potv1UmfKu0W1gXkqYS43neCMbu8yhrJJ8WzsQehlVw4YmmlWMYrRFHB1u
 wS4TVrI2hlZ31TFLXlsShgMuclCI8IjOmUzgjKRLaDbjIvhY/RZuXQgz2noS83XQ4G2foY
 91tsZVUpkR1bBCtM38achQe2MbPoS0fTbj0G/vKsT38nApzL0KeQMi9xLpSeunxuWLpgi3
 Hd2WMsAci5tg8rpYhJTiTC2ZxAPGauv0FWZuirii4OhGhRDhcqDq74zrVBM0DA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Ihod3eSA
Subject: Re: [Buildroot] [PATCH 1/1] package/libva-intel-driver: bump
 version to 2.4.5
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

On Sun, Jul 05, 2026 at 08:20:16PM +0200, Bernd Kuhls wrote:
> https://github.com/irql-notlessorequal/intel-vaapi-driver/blob/2.4.5/NEWS
> 
> This bump follows
> https://github.com/LibreELEC/LibreELEC.tv/commit/39d2ff612fce9bb57c43ac767df15052a896e9ed
> 
> "Intel archived intel/intel-vaapi-driver at 2.4.1 and advises forking.
>  irql-notlessorequal/intel-vaapi-driver is the active continuation (119
>  commits ahead, tagged releases, Chromium fixes), so track it at 2.4.5.
>  [...]
>  The fork renamed the wayland meson option, so switch with_wayland to
>  with_wayland_drm in all DISPLAYSERVER branches. Also drop the dead
>  01.org PKG_SITE."
> 
> Updated license file and hash due to upstream commit:
> https://github.com/irql-notlessorequal/intel-vaapi-driver/commit/7343767d87926d519f528db88ba1edfb153d8289
> 
> Also switch build system to meson.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
