Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA05C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 19:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DFD460624;
	Mon, 24 Aug 2026 19:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDor7rjRLYxP; Mon, 24 Aug 2026 19:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787598985;
	bh=DfA/ROHwfZB1qBQa66Oj+wNSus6wEEa8ylyjnasHFYY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ehZ6OSGQ46sH+2sJSbJILRUXCuFhDm/VLyI67q1gyAXz+rW5b3oC0zXFeppI8gkhz
	 +VZwZMkbnyY8PNasCyMxiNdMwxcmy3oLK+FMo2PowsM1eNYaZgtCHr5Kv6bvQsb35F
	 IzWgOsVr06d08vyESzwSWuuKgm66PipV6KnuMhh/TyDv1oiQ22HUYpvWXR/NBNByfN
	 BNKIK1d2nRtZ0mUFLi37TM99ZX5qM4oZu/hywGqJ1mJNb4N7PVGGedzDRdF4pYK3Re
	 A0/rRnu5iZ2Fk3ZiU+9J7Zb1gH1eQio0hJI3cxuK3zLniGmwIGidHdDBoBXbCDdfLn
	 8G8cHDuXY1BKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44459605F0;
	Mon, 24 Aug 2026 19:16:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85770396
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7689E80BCC
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaB0fY-SU8Wj for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 19:16:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6899580BCD
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:16:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 080614E4138D;
 Mon, 24 Aug 2026 19:16:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D09A35FFC1;
 Mon, 24 Aug 2026 19:16:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED22911C79B23; 
 Mon, 24 Aug 2026 21:16:14 +0200 (CEST)
Date: Mon, 24 Aug 2026 21:16:14 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Adam Ford <aford173@gmail.com>, buildroot@buildroot.org
Message-ID: <aoyYXMGZuloqjM-z@windsurf>
References: <20260716133001.2147463-1-aford173@gmail.com>
 <aox73MQnOLsOq-tt@windsurf>
 <e18f7c88-3d2a-4ca1-9c5d-9522cb76cc2f@green-communications.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e18f7c88-3d2a-4ca1-9c5d-9522cb76cc2f@green-communications.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libxml-parser-perl: add
 host-libxcrypt dependency
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

Hello Nicolas,

On Mon, Aug 24, 2026 at 08:12:52PM +0200, Nicolas Cavallari wrote:
> Not the author but in Debian Forky (testing) and Sid, libc6-dev no longer
> depends on libcrypt-dev, the provider of crypt.h.  libcrypt-dev now only
> have these reverse dependencies:
> 
> gauche-dev, guile-3.0-dev, heimdal-multidev, libapr1-dev,
> libidzebra-2.0-dev, libperl-dev, libuser1-dev, sa-compile
> 
> None of which would be typically present on a developer or builder system.

Thanks for this additional information! With this, I was able to
reproduce the build issue, so I applied the patch to our master
branch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
