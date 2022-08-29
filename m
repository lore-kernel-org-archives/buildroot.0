Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD69FECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 616D9813E3;
	Mon, 29 Aug 2022 20:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 616D9813E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bpIm2dozFte; Mon, 29 Aug 2022 20:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B32E813D8;
	Mon, 29 Aug 2022 20:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B32E813D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 928821BF3D9
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B64860B14
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B64860B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2h4HiVlO3bu for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:08:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693A760AFF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 693A760AFF
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:08:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B82460004;
 Mon, 29 Aug 2022 20:08:43 +0000 (UTC)
Date: Mon, 29 Aug 2022 22:08:42 +0200
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20220829220842.3b5389ed@windsurf>
In-Reply-To: <20220829103049.17780-1-paul@crapouillou.net>
References: <20220829103049.17780-1-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661803723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yIb8WtBdZUgd6T4R+217BbrQBs3xNQptbEJ8UQkjfvc=;
 b=O1cDpLj+WZo2tn1KX34c1Le9flGiFrzMbB5casBNU9MDh82zZCVlv8GdRxUDSLqubgbq9l
 mn0MXKHOgiIMDJVz5RazDi+DJp0DwJGhLVCkg0o+vIvbTSPz7lCtsdrr21HZ2oGotFKMPC
 CIrUqOn3ZGplrH6wHwVmjHm1lNKgUJrzyHCoj7mXBN+JSl7ZenS54Qls5x7x3yLwcWBtph
 4j5B3HfwH4DF9ON7JUEhUMkHf8anxaRe++bsp5ZP9bqowcGP0IFyIT3WcL9U9h+K8fdzSn
 e4h4g/rDlrJ/BP+hsydtwuvT5T5fed9vE/x/M2xRltZ8jE1s/APWIhUUBh2iiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O1cDpLj+
Subject: Re: [Buildroot] [PATCH 1/1] package/libiio: bump to version v0.24
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

On Mon, 29 Aug 2022 11:30:49 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> The changelog is available here:
> https://github.com/analogdevicesinc/libiio/releases/tag/v0.24
> 
> Remove the 0001 patch as it is included in the v0.24 version.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  ...rs-setters-cannot-be-marked-readonly.patch | 32 -------------------
>  package/libiio/libiio.hash                    |  2 +-
>  package/libiio/libiio.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
