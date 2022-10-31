Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6429C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EEB54089B;
	Mon, 31 Oct 2022 12:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EEB54089B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtRajZBbWTHO; Mon, 31 Oct 2022 12:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C24840252;
	Mon, 31 Oct 2022 12:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C24840252
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 787DF1BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 468AC80B46
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 468AC80B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECUAuhQnGx-n for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:08:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 101628006F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 101628006F
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:08:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C36F1BF20E;
 Mon, 31 Oct 2022 12:08:28 +0000 (UTC)
Date: Mon, 31 Oct 2022 13:08:27 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221031130827.42da99dc@windsurf>
In-Reply-To: <20220913191429.154837-1-christian@paral.in>
References: <20220913191429.154837-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667218108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvPuJ2Vtt+QE0xu6Kyin3dZnKsLdNhq9XmR7PXW3dJc=;
 b=J7oGCV4uaXL/ppx5FPK+1zTon41TeRj8XYOGCAySVczMkftzdzoNsGB+x4vQt/MhAyruI1
 XR+s8K8XCNoh+sRsYD4X7O8mx0NQtDX6rtxo8sPUuVvMmxbIB0qTG5sVArTBYx1vnmFf1c
 EQvQHMt0Dw1Aa0HM6RUaHN06LCfNWXy1oewYXSJovHa/Z8wwvdxOpZAOCO0jVUDJAZQJ7Z
 RWzf9yksIYqEnksQ6q/XdE+sO/qaNNE/wnYowZsWU6gQpcHp2s3aDnFxOo2cubd+2k9jvo
 wh1qDC9pAbsOvcy9TyQzugrbOtXUJ4TOxNv/rFGo0aQGPQ+Oel1tW8jv235rGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J7oGCV4u
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-pyyaml: add host
 package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Sep 2022 12:14:29 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> The Jetson AGX Orin python script to flash requires host python-pyyaml.
> 
> Add a Config.in.host option for the host python-pyyaml package.
> 
> BR2_PACKAGE_HOST_PYTHON_PYYAML
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---

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
