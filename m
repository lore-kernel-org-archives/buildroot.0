Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E049C5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 21:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 088EE40595;
	Tue, 18 Aug 2026 21:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUMEkUs9-sw1; Tue, 18 Aug 2026 21:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787089589;
	bh=KlEHdJh24F5+/HYL1/ik4mtmhZoCZ1XNjcyuAvCYzDM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TMU7PE6DdlfSuTXMHv2mtcmgLnICOqsu9lu5Z/ooRBzdctmTmnNnI2QYx/OZSPRQ2
	 qcyowcedSeClr+1lDiFpLQmGfTONObpUpAakf3QOIsS+Lku6dGc2FJm98azU9+47xv
	 LAea45nOE0Brvz3nh4bZeUeNY1X09KUiXUr1RZxRheyCqiarNR5vsT9erkW4ZYOeQO
	 BMXjvnEBVoIPdiRDelbeinX+T3xtvOP7bAdRTsAtxIZy06WiEF4UqgjGYZ5GWhM7Kr
	 ZLhMTw+APmeYrj4qBkYWrq675rYNHu08cPvhHw7GcRhxa3eq7FKiQTK607pjnJ4ljM
	 Lmu3SBakXjL8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D95C405D7;
	Tue, 18 Aug 2026 21:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1063333
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D299B80DB9
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2A5brIqgVGw for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 21:46:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFED880D7C
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:46:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B95634E412AC;
 Tue, 18 Aug 2026 21:46:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8779F60355;
 Tue, 18 Aug 2026 21:46:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B9B111C74FBF; 
 Tue, 18 Aug 2026 23:46:18 +0200 (CEST)
Date: Tue, 18 Aug 2026 23:46:17 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <aoTSnB2mBgBjkuXZ@windsurf>
References: <20260802194421.1914703-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260802194421.1914703-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 1/2] package/fakeroot: bump to version
 2.1.4
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

On Sun, Aug 02, 2026 at 09:44:20PM +0200, Fiona Klute via buildroot wrote:
> The source archive does not contain a pre-build configure script any
> more, so enable autoreconf. Fakeroot also contains an experimental
> Meson build definition since 2.1, but Buildroot should keep using
> autotools until the Meson build is stable.
> 
> Since v6.10.1 btrfs-progs uses nftw() [1], which package/fakeroot did
> not support before v2.0 [2]. This update allows updating btrfs-progs
> past v6.10 without breaking build of btrfs rootfs images.
> 
> Upstream changes:
> https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.2...upstream%2F2.1.4
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit?id=c6464d3f99ed1dabceff1168eabb207492c37624
> [2] https://salsa.debian.org/clint/fakeroot/-/commit/3502c515c73ee02e7f557e6a3bfc1af675dd3d34
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Thanks, applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
