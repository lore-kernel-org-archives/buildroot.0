Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C49C46CD2
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AECA1437B3;
	Fri,  5 Jan 2024 13:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AECA1437B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vqa48k2tOlAl; Fri,  5 Jan 2024 13:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86363437B5;
	Fri,  5 Jan 2024 13:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86363437B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2050C1BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC41661499
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC41661499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sbm7RrwW0gfE for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:06:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F06EA60A7E
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F06EA60A7E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FA4CC0008;
 Fri,  5 Jan 2024 13:06:12 +0000 (UTC)
Date: Fri, 5 Jan 2024 14:06:11 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240105140611.6a19a037@windsurf>
In-Reply-To: <20231226214037.144870-1-giulio.benetti@benettiengineering.com>
References: <20231224121121.401724a3@windsurf>
 <20231226214037.144870-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xka0SlLZ48KZ68lQtW6EYmpTYgfdDNJzVXEP5E5y/GU=;
 b=d+BkgMWCGg3urYz+xCMIffPIX3zEr7f4umu5D21VyUQk9ioh0rH1ltTu3KkBEHxjOvOS0O
 I926OM0FwbpEbLYa5z1F3x6GAybcDznBSmHynB9u15tb+QPLiDjpak9dnWjv/FgsmQPCUK
 3XKJ7durErbebGJXAyMJ/DduKT0+EVzyTuS3esPyZSvGBITtOUL5j3Ef0khLH/ojRMMMcc
 vWM0AhQhF3cxGB4ORnq6lvi2ePPSgP8M5NWoBND8vAS6PqFBtwMwFdDzvK9CBHQBD/IHQ1
 9A7O3dkI6yEumEdwFgYo4EKEM6vtrCgaWk5Ffa1332ccskOUkHgifNCRryb3Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d+BkgMWC
Subject: Re: [Buildroot] [PATCH v2] package/swugenerator: add missing
 runtime dependencies
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

Thanks for the v2!

On Tue, 26 Dec 2023 22:40:37 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> At the moment swugenerator package lacks host-openssl, host-gzip and
> host-zstd runtime dependency so let's add them to prevent swugenerator from
> failing to run.

I'm going to nitpick a bit (yes, I admit), but this commit log explains
what the commit does, not why it does it. The *why* is important. The
problem is not that swugenerator lacks host-openssl, host-gzip and
host-zstd.

The problem is that swugenerator can (apparently) use openssl, gzip and
zstd on the host (under which conditions?), and therefore we should add
host-openssl, host-gzip and host-zstd as runtime dependencies.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
