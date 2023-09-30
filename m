Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09588E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94771418C5;
	Sat, 30 Sep 2023 19:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94771418C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oNGMnd049GAU; Sat, 30 Sep 2023 19:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7D3341E2C;
	Sat, 30 Sep 2023 19:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7D3341E2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A89C1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D588A421B7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D588A421B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8eFft7rQQju for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:41:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E75B418C5
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E75B418C5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87220240003;
 Sat, 30 Sep 2023 19:41:09 +0000 (UTC)
Date: Sat, 30 Sep 2023 21:41:08 +0200
To: Takumi Takahashi <takumiiinn@gmail.com>
Message-ID: <20230930214108.387cefce@windsurf>
In-Reply-To: <20230930190610.752987-1-takumiiinn@gmail.com>
References: <20230930190610.752987-1-takumiiinn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696102870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3E7V9VvvLc7sRCXZGP0QcCYSfQ+c9sieOBVBiYm/7s=;
 b=WCEapAC7hV9YZLFlAv8aRkwH41Vou+6ff2FZ9R1ulBQhVsRoDd4IIqLJhrWD67l4AKTaeG
 /L/eRyZAzEOVaevznSE8ZOhUTxYNO3DC5JyuUdNiVgFlSCYX/1Ke3fFgduHyj0ntgADix7
 25TxX0JGJzfqmT+WmHhjG8DZQiXsym3CDfjnxtpSL2Q4WNJQEKZd9RQKx8TW3sC9tG23K5
 4wRQuIA03jFZ2bYzjuc319DpsEbypZzZM98eReJ8kkU3rN6ADxV/qTe2E5LrU7dETqIzm4
 g/81xN3UfH7S07CmUpK+u4edjxo3jeE7PDl1Ke0mapH3U2Jk0RxW+vf9vU7KMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WCEapAC7
Subject: Re: [Buildroot] [PATCH] package/python-pygments: support host
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Takumi,

On Sun,  1 Oct 2023 04:06:10 +0900
Takumi Takahashi <takumiiinn@gmail.com> wrote:

> ---
>  package/python-pygments/python-pygments.mk | 1 +
>  1 file changed, 1 insertion(+)

Thanks for your patch.

However, could you clarify on why you need a host variant of this
package, and how it gets used?

Also, we require all patches to have a Signed-off-by line from their
author. Without this, we cannot apply patches that are contributed.
Could you send a new version that (1) has an explanation of why you
need a host package and what uses it and (2) has your Signed-off-by
line?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
