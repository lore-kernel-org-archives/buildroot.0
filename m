Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A813EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34FEF40B7B;
	Mon, 10 Jul 2023 20:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34FEF40B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fYNn-R-O8qr5; Mon, 10 Jul 2023 20:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 721394049D;
	Mon, 10 Jul 2023 20:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 721394049D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC731BF399
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBF6C60594
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF6C60594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1TjoU-8uN5pE for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 20:13:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 615C3600C7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 615C3600C7
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 20:13:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B728FF803;
 Mon, 10 Jul 2023 20:13:36 +0000 (UTC)
Date: Mon, 10 Jul 2023 22:13:35 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230710221335.2d3068b1@windsurf>
In-Reply-To: <20230611123108.372959-1-bernd.kuhls@t-online.de>
References: <20230611123108.372959-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689020016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVidl6J98tD3ZpBbuj2h5V9K+H9nGwk1nZAGZZDnti0=;
 b=Zq5yDzpyEjJebtDsu40vKNIt5Uz0RXKZVEUEsbOiBvhvZsN22Wo0wJRfygbsz6WexQZj0O
 NRCU40F4VMjm3022vhpRwvWfedVT7QyzeR4bSoHaQfvNFl0ubwNVaro0ich1y7PeL7tOpf
 xOUW0iVivRNo/sX0kQzKqEUQsF8WHQuk88MBf0FGql8CiviElhOkiyb558BlQSSZb1ExpI
 GlhPUNBop4aUVajQuEZscxMHRBYzF6KIWYI/+k+XwxxcOzeAWe6/zlC6qBsUoJtc643Z0V
 pE+xRlam1PVzOOr+NJAy6Ybc74kQEM3lSaBGlW8jrgMmOtToeKoHRI1/PdxfUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zq5yDzpy
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pyicu: bump version to
 2.11
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Jun 2023 14:31:07 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated help text to follow upstream move to gitlab.
> 
> This version bump introduces compatibility with icu 73-1:
> https://gitlab.pyicu.org/main/pyicu/-/commit/1ba50901161acfce691d41308be6c004a3956f4e
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/python-pyicu/Config.in         | 2 +-
>  package/python-pyicu/python-pyicu.hash | 4 ++--
>  package/python-pyicu/python-pyicu.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

Both patches applied. Let's see how much this blows up in the
autobuilders: the ICU bump 70 -> 73 worries me a bit.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
