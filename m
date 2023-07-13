Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E651C001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0964D4050C;
	Thu, 13 Jul 2023 21:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0964D4050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRW6DzBgAaMs; Thu, 13 Jul 2023 21:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51D2D40497;
	Thu, 13 Jul 2023 21:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51D2D40497
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0ED31BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D0B683CD6
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D0B683CD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiEZ9C2h4tdK for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:02:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FB6783CD1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FB6783CD1
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:02:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68C2DC0005;
 Thu, 13 Jul 2023 21:02:08 +0000 (UTC)
Date: Thu, 13 Jul 2023 23:02:07 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230713230207.4dbb6019@windsurf>
In-Reply-To: <1c5a072be17f6aeb1ff9f39d506141ed8024d7bf.1677570263.git.stefan@agner.ch>
References: <1c5a072be17f6aeb1ff9f39d506141ed8024d7bf.1677570263.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689282128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VsUh6BnT6pCRD9NgU4y02/yDvjkMMBgg3X+N5DZYEIY=;
 b=ZFd9Hkgel3dyv31UvsD1V9Y3ESVIYsKVblVxbQbkJWZwAN2ydeuy3vQS2kI5NeY9QiKVkw
 9R4txU4CF9ThT7c+oY3m88cM4yarW9MbhnOuPqreO8WKYU6Ch4vdkosIUOv6t82dnKXn5b
 kb2RrENHNkCorOUgWNvA9TZDZY5KdU+Ia7IOXHSqeXVZh98Xlwh5jjFYLXAN0D2MzD4LOE
 wohmxqabNT2qmUFPLOwI2WVxNTXeVUorQuvjHe26B4DI1+H47XduyQ5g+5pvC+G0HlSu6/
 qhO1WEC5hpSAMN37BSKtxM59qXhGSsoB57/y8pWMVmwUIeXvxFAaJXCm5U+3LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZFd9Hkge
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: Add Broadcom BNX2
 firmware
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 28 Feb 2023 08:44:40 +0100
Stefan Agner <stefan@agner.ch> wrote:

> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/linux-firmware/Config.in         | 7 ++++++-
>  package/linux-firmware/linux-firmware.mk | 6 ++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)

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
