Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FEACE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 13:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CAE781F4B;
	Mon, 25 Sep 2023 13:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CAE781F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C48YtXa9AsMV; Mon, 25 Sep 2023 13:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEC7481EE5;
	Mon, 25 Sep 2023 13:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEC7481EE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE351BF381
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 13:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C014A81EE5
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 13:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C014A81EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T85yAqgM-uLa for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 13:42:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89B3281EE4
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 13:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89B3281EE4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CFD91C000A;
 Mon, 25 Sep 2023 13:42:33 +0000 (UTC)
Date: Mon, 25 Sep 2023 15:42:32 +0200
To: <yann.morin@orange.com>
Message-ID: <20230925154232.69fdc4bd@windsurf>
In-Reply-To: <85bdd1b26ba56471330e98465095d943b54e3e74.1695644947.git.yann.morin@orange.com>
References: <85bdd1b26ba56471330e98465095d943b54e3e74.1695644947.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695649354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCQaWS0j/lkVzM3hnoccMSKf+R1Q09jMsd4+/RbLxS0=;
 b=Lw+xG45REd7TLeaUSjap/MYBQI8U6+vTIW1nrbtaTneRtUrcIGqxekV2zrALiXihgOtqkd
 TV57erPE8FqNX/AT3fuAW8m2GoCgwsbzDUouzaSJ8vWzKEEJkCuT97IEqdDkSOzEUgE9yt
 skdjdgD3bIcR+owWiF3lS+5rutjlsrIhI42rlOcP0+FNIzxuHuUVWXaP+ZzJJ7gbg6PvVe
 GAEaTbbXba53wlaMHVw2hhGD9CfpOxAO1CQxMfpvbqSHpSne2FjtOrzTeqUXIsT0YIRGrJ
 1vjlxzkT8V944vfUTb38oy6ewcYktTCShhlwU66r3Bzo2Pn9HyuYsavCXMqKhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lw+xG45R
Subject: Re: [Buildroot] [PATCHv2] package/go: cgo for the target needs the
 toolchain
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 25 Sep 2023 14:29:15 +0200
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>

So if you're the author...

> When the target is not supported by go, then there is obviously no need
> to depend on the toolchain (even if we unconditionally enable cgo
> support in only-for-the-host host-go).
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Christian should not be the first Signed-off-by, but you should be.

I believe this was originally written by Christian, and you extended
the commit log/improved the patch, so I guess Christian should be kept
as the author.

> [yann.morin@orange.com:
>   - only add the toolchain dependency for target cgo
>   - reword commit log
> ]
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Anisse Astier <anisse@astier.eu>

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
