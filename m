Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBC4C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 22:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23EF0415A0;
	Fri, 25 Nov 2022 22:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23EF0415A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pD1y8YzCmiBN; Fri, 25 Nov 2022 22:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66DE44067B;
	Fri, 25 Nov 2022 22:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66DE44067B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 714C71BF3D0
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59DCF4159A
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59DCF4159A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZXndU7NdPPV for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 22:20:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BAC6405C1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BAC6405C1
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 22:20:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 046931BF207;
 Fri, 25 Nov 2022 22:20:24 +0000 (UTC)
Date: Fri, 25 Nov 2022 23:20:24 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221125232024.7b1da5c7@windsurf>
In-Reply-To: <58294107fad727dfc01e76ca23a47ab08a1ef9ea.1669368933.git.baruch@tkos.co.il>
References: <58294107fad727dfc01e76ca23a47ab08a1ef9ea.1669368933.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669414825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbGBPH7zF/Dci1CT5ssnagfxOl6sTBjWSHFoK+7+MII=;
 b=f3mec1XYoZqrQ2hRU8H/wN20jPyn04YOz/BMAjw/0aI2EI5GKuPJ6/yLIdLOPXlS2dCanw
 uNqSaUpf1OAgyIDsVUlSNlKzL4tH9MiUvwHA9GhdLNgv/UTrQN7Lf1AKcLlP458sGSV0sL
 Ypi1dwQeKuH5+DTyTpP8kTwrg/ZJWDvwIgere+i9lXoipsnIIJpyNk75a45XjO1QUiNNHR
 OP0HXarr+llo2/1M7aW8Hyw9B/BHBepa/PftynC3EuphS5APYUGGASYZp/iXN/C+g+PZA1
 PX8ZrjLsvmZYEQtYwDqAv6ejHG21yTE13l1oNUFIqOYb01uZ+nbk8c6irmMoDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f3mec1XY
Subject: Re: [Buildroot] [PATCH] package/dash: fix static with shared build
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Nov 2022 11:35:33 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> When BR2_SHARED_STATIC_LIBS is enabled we pass both --enable-static and
> --enable-shared to configure. dash configure.ac only looks for
> --enable-static to make the build static. But when linking against
> libedit pkg-config only returns dynamic linking dependencies, so the
> indirect ncurses dependency in not mentioned. The end result is that
> libedit can't find ncurses symbols on link.
> 
> BR2_SHARED_STATIC_LIBS only makes sense for libraries, not executable
> binaries. Pass --disable-static unless BR2_STATIC_LIBS is enabled for
> static only build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/137d39cc5ec436759a2fde3f26ce5633e0ad6c2e/
> http://autobuild.buildroot.net/results/55a38e0e45212bf7403d9ccb626c9422e3affe72/
> http://autobuild.buildroot.net/results/8f109f1a04a6a2ff6d8c4c920e499fbaec3f72b9/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/dash/dash.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
