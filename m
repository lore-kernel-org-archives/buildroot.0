Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB710EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 10:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35BA481ED2;
	Tue, 22 Aug 2023 10:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35BA481ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8twTvE9dhuw9; Tue, 22 Aug 2023 10:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71D8D81E6F;
	Tue, 22 Aug 2023 10:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71D8D81E6F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 376961BF354
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01D8641506
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01D8641506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rfx20qmAlvYJ for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 10:32:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6608B414E4
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 10:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6608B414E4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30FBF1BF209;
 Tue, 22 Aug 2023 10:32:18 +0000 (UTC)
Date: Tue, 22 Aug 2023 12:32:18 +0200
To: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Message-ID: <20230822123218.0f328237@windsurf>
In-Reply-To: <20230616002359.4139814-5-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-5-dannenberg@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692700340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VxO+eRw8fonykH/a1e8guYGWkAaf4ov4lAhc+qe8k+I=;
 b=VAy4vP7P/WH4Ff33AR4DyGBh/S+jOuMhFEku1JBd6QBb1/hmrfN0e3T6ulkP0HSeLCtjj3
 3x6qkLgr+sdy7E7Qqc8EGZOdrhzMKaM1z2fN0t/i+eq4jPYAUWRfg5L0Ng+e5jnY1W4Eqm
 gWYHmDsY7JUCkNBjapTuccF7xOv6yHbLn+aKvjbbfci14pZXc/j/aSRTatElAalMSwstS6
 z4oBZQix04QRfRIcJsL8IS3qYqkhG7U4K28GoCh+wbg8PEJTuqqjMKenJjoD4GsYqHd9iK
 rAD7/+L/h34e5ylGkWmH6mxQwzfQtu2gukXzsV4l5oqy0vmU8NKeCU9ov0e2TA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VAy4vP7P
Subject: Re: [Buildroot] [PATCH v8 04/10] board/ti/am64x_sk: add new board
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Julien Olivain <ju.o@free.fr>, Xuanhao Shi <x-shi@ti.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Anand Gadiyar <gadiyar@ti.com>, Romain Naour <romain.naour@gmail.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 15 Jun 2023 19:23:53 -0500
Andreas Dannenberg via buildroot <buildroot@buildroot.org> wrote:

> From: Xuanhao Shi <x-shi@ti.com>
> 
> Adds support for TI's SK-AM64 board by introducing the
> am64x_sk_defconfig file and related support files.
> 
> More information about the board can be found at:
> https://www.ti.com/tool/SK-AM64
> 
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Acked-by: Andrew Davis <afd@ti.com>
> Tested-by: Bryan Brattlof <bb@ti.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Reviewed-by: Francois Perrad <francois.perrad@gadz.org>
> Reviewed-by: Julien Olivain <ju.o@free.fr>

Thanks, I've applied to our next branch, with some minor changes:

- Defconfig renamed to ti_am64k_sk_defconfig

- Directory board/ti/am64k_sk renamed to board/ti/am64k-sk

- Defconfig updated to take into account the changes made in the
  previous patches in terms of config options

- Minor formatting improvement in the readme.txt

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
