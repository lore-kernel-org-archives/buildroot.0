Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7831CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 16:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02FE641A1E;
	Wed, 20 Jul 2022 16:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02FE641A1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jMAnLcOeipJ; Wed, 20 Jul 2022 16:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A77DC41A14;
	Wed, 20 Jul 2022 16:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A77DC41A14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB9411BF352
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7679B818A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7679B818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HousPkNvefYL for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 16:39:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F326C81871
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F326C81871
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 16:39:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4FA3720002;
 Wed, 20 Jul 2022 16:38:57 +0000 (UTC)
Date: Wed, 20 Jul 2022 18:38:56 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20220720183856.742c4a09@windsurf>
In-Reply-To: <20220720125707.1899437-1-festevam@gmail.com>
References: <20220720125707.1899437-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658335137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ueI1JtO8cV8YbCYOcIIH3/NGMjmeDoEPyP+owG4Smt8=;
 b=iQDhepsEVynYsg+025aTV1K0Ey42FdFOmgl4HUEDeOGUlsm3NyTV8yHlB6Xkl3KqOc5SPR
 kF3VcXcVXxih6WUAe6OIRSlSSbGHCzaVPtnCoaZF6hwuloOiP2xJeKoY62f9pHZetC1QGZ
 PFx3YUWW/nZZBhc7HoEwrBN5zAh7K/g61fpT4dIY2SzbpWw8lqWCfetWF+5kR9W/SVEUoK
 1IahAKr72juWQ7cJN4+sz/D7ykg00m5nwu8TSR2EV8M6UwtxGvYwWdRVgH1JjqxMLvkJwp
 MYpMs7S8zNPqoaSMX89uvPOq7bRj5X7KDa3VBiXEdmsYitcsWVwN1EEY4tjfTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iQDhepsE
Subject: Re: [Buildroot] [PATCH] package/crucible: Pass 'osusergo netgo' tags
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
Cc: andrea.barisani@withsecure.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabio, Hello Andrea,

On Wed, 20 Jul 2022 09:57:07 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> The 'osusergo netgo' tags need to be passed when CGO_ENABLED=1.
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/48a39341ca3dcb3675b2876e680718c3e43f55aa
> http://autobuild.buildroot.net/results/897b4803f4f221c52899641a45708b49b7cb5f5c
> http://autobuild.buildroot.net/results/3a75c6b73a1f583d6db666eacc45c4debd9218e9
> 
> Suggested-by: Andrea Barisani <andrea.barisani@withsecure.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Could you provide more background about these osusergo and netgo tags?
Indeed, they don't seem to be specific to the crucible package, but are
apparently generic Go tags, at least according to
https://www.arp242.net/static-go.html, and they seem to be needed when
statically linking Go programs.

If that is the case, then I don't think the solution is to change
crucible.mk, but probably to have a more generic solution in
package/pkg-golang.mk. Or is that package-specific in some way?

Do we understand under which conditions these tags are needed?

Thanks in advance for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
