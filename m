Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA8EEB64DD
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E47D64033B;
	Wed, 12 Jul 2023 19:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E47D64033B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkW0f7z2UMI9; Wed, 12 Jul 2023 19:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2EAB402BA;
	Wed, 12 Jul 2023 19:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2EAB402BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 462DE1BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DF3940205
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF3940205
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2H3V0P9GHos for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:48:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA265402B3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA265402B3
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:48:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1742E1BF204;
 Wed, 12 Jul 2023 19:48:08 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:48:07 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230712214807.622ea30e@windsurf>
In-Reply-To: <20230610171124.1092368-1-bernd.kuhls@t-online.de>
References: <20230610171124.1092368-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689191289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EnFjDbjQmy0+USiV1RBPe/brC3PRVr94jAWgQAxG/HM=;
 b=nzdQMP/2P63DUuAPIumR0bXpnuFvD+Wy4xdDY4JPg0LTD2ioA5op/SztZUVm7kbHufJ+L7
 9A4VDuJKq1sazkJP85Zm0kHZ77VvZ8eVDz/Q18f9IEWNh+zBvWM+8NXltWHIRDMa2YopkH
 JN8jX/WtmTqb2jStcDCkuO4MdGXPkxGjGrNpMMju4R/9tB8z4DMGu9WVvqAGz7b4tV4/53
 9lRvHP517uXELoNGxK4j6Bc/EAVduchGllT3nvtECdg666TUmYonHKtKYXa5gogDLaS2S4
 n5+EXBtLVkfcJkxRnwNSEfIynt69bEdF3Zvt3xnaU0Ti0t59sWkGXubgjb7Z7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nzdQMP/2
Subject: Re: [Buildroot] [PATCH 1/1] package/opus: bump version to 1.4
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

On Sat, 10 Jun 2023 19:11:24 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://opus-codec.org/release/stable/2023/04/20/libopus-1_4.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/opus/opus.hash | 2 +-
>  package/opus/opus.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
