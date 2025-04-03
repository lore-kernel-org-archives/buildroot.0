Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F40C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 07:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44763605DE;
	Thu,  3 Apr 2025 07:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGMl8itFndQj; Thu,  3 Apr 2025 07:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77022607C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77022607C4;
	Thu,  3 Apr 2025 07:44:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 678C9119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 07:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 590C983AFB
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 07:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0zSYiJbCUqt for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 07:44:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27ACB83AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27ACB83AB9
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27ACB83AB9
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 07:44:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 487E8442B6;
 Thu,  3 Apr 2025 07:44:31 +0000 (UTC)
Date: Thu, 3 Apr 2025 09:44:30 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
Message-ID: <20250403094430.08d9b2f1@windsurf>
In-Reply-To: <20250326080506.3467586-1-yegorslists@googlemail.com>
References: <20250326080506.3467586-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeektddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduueevhefhheelkefggeevvdffjeetvdetgefhgedtiedukedvfeeltdfgleeuvdenucffohhmrghinhepsghuihhlughrohhothdrohhrghdpsghuihhlughrohhothdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohephigvghhorhhslhhishhtshesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1743666271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0A1oLCYseCE+zTrVW7TZkNlLPHFhMuytHAphQNJYW+8=;
 b=oDZwfgq4eqZXV7NXmPh32csVfv82RL5ftY0RmblWrbHCAkvRyvYWDYS7Hi17MmJiu4pkOS
 DXix6C/1l7eCxzvvy+UoqSZKtGltTDafj/Y4osRI7A7RtHWsFXhklMhmJJ2Obd9BveaQPE
 kbTxUGi+PXimS1Lr+9ktPo3wjM/8WNcWot2yv8zfCodMnep6myRF3Ys5lDTbdhYswpR/bl
 tN/QESyet77+abL0yjwiYcr2KxfeczvIXpyHgmn56UJQRHbXnG7+QutN7EjzlVWMjOEE/k
 Z+87T1VFbYDCbAR+tYHtOBg00FV/YBkfR5Hh071xI5dg06hFs4ZYRGrUjft5Iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oDZwfgq4
Subject: Re: [Buildroot] [PATCH] package/ncftp: bump to version 3.2.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yegor,

On Wed, 26 Mar 2025 09:05:06 +0100
yegorslists@googlemail.com wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove upstreamed patches.
> 
> Autoreconf is broken. Hence, use the configure script directly.
> 
> Fixes:
> https://autobuild.buildroot.org/results/60c3dbe02af354ff9820258ffd00eec088114d69/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

This somehow breaks the build, but not your fault: it looks like
upstream changed the tarball. Indeed, on sources.buildroot.net we know
have in cache the tarball that matches the hash you have submitted in
this patch. But the tarball available on the official website now has a
different hash.

See the build failure at:

  https://autobuild.buildroot.net/results/d18/d18191dbb1fb8d7fe64ee547ca9b97c133434ea2/build-end.log

Could you have a look perhaps?

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
