Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E5FEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FB5840616;
	Sat,  1 Jul 2023 20:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB5840616
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JaxFQKJ4l-KT; Sat,  1 Jul 2023 20:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ACF740493;
	Sat,  1 Jul 2023 20:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ACF740493
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6C11BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 452B581354
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 452B581354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GaPj9G6K2Zcd for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:08:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4928881353
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4928881353
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:08:49 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8152140002;
 Sat,  1 Jul 2023 20:08:47 +0000 (UTC)
Date: Sat, 1 Jul 2023 22:08:46 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20230701220846.3a380fc1@windsurf>
In-Reply-To: <20230619195622.595545-1-festevam@gmail.com>
References: <20230619195622.595545-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688242127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bUI4tIBkr0YtCFwcgz9iGPrnPlkb0kxaBnECDDDKRM=;
 b=gx6lZl0q4JoD5pZsIYWEXNQgxTbKrJ4Hl0wAvaEiBxijcCJC76qKvNEO5K2hqvsKX29wet
 n6nDUlt0e3iedS6ELn2hC9op69FymO6davfccHB0+qvSONWZ8vIqspGERyHw75l9kzYyKX
 qEvypSJaEBPseBvSWGlZXvxo1BBtZfpt8KVkxepQmp5dvBo5pcfTwX6UZSKIxXJPiM5NUk
 B/2Ok73FCERcCb3VF56vC9Co80EtWy3vRJFCiVNGPscMiVd+0E89LKgZmrUghlyWQPgb6q
 o7Ab5T9f2CKWKBXpmxSIqskz6g9o2wt8N7EZ5jGm1JCgRUjkHU3v+DK4vEyC6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gx6lZl0q
Subject: Re: [Buildroot] [PATCH] configs/imx7d-sdb: bump the kernel version
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

On Mon, 19 Jun 2023 16:56:22 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Bump the kernel version to 6.1.34.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx7d-sdb_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
