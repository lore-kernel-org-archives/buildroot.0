Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7A8C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B7D960DF0;
	Sat, 17 May 2025 15:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIlPndui0ygT; Sat, 17 May 2025 15:27:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D02EF60AD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D02EF60AD4;
	Sat, 17 May 2025 15:27:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D280223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ED18400D8
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkaeZZaCbBiS for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E59DA40F84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E59DA40F84
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E59DA40F84
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:27:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04C3944212;
 Sat, 17 May 2025 15:27:14 +0000 (UTC)
Date: Sat, 17 May 2025 17:27:14 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, James Hilliard
 <james.hilliard1@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20250517172714.691fef81@windsurf>
In-Reply-To: <20250414161545.2863615-2-fiona.klute@gmx.de>
References: <20250414161545.2863615-1-fiona.klute@gmx.de>
 <20250414161545.2863615-2-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudehleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeitefhfedtjedvgeeuueduheeigfegleehtedtveevtdekveeiuedtheejteehnecuffhomhgrihhnpehgnhhomhgvrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhiohhnrgdrkhhluhhtvgesghhmgidruggvpdhrtghpt
 hhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopehfohhnthgrihhnvgdrfhgrsghrihgtvgesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747495635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KmLKkWtitianoFUqtYi5/F3VOpdMFwJcShl3LdGbQV8=;
 b=gtcFGhxzdWid59XrcXcn9w837HQTkpQsC3d5tkdGKf+q0+QoFnPKLVsQk3eRwW9k6p0D8E
 57d94SYbcnRnwkjfljhXps3p31nINrw2Uu8s7kA4MH/6B3rb+ZtcIgKbicm5qJyBm+URb6
 qn7reguVZ7y8wzY9LYU2NdX//n5okLLnOtB49ehNvT1Y57m+7Y7gQq+T2C3OAlXBy7asSk
 x7j9N47/MRv/bIznYpfmLCNcBpfEIC0KznzhDwijLfteRnGHgMWYDVw7ncMev6xryGtLWz
 bZlFSZJgyckfb2d9tsMoMO6fLYUv+FqP8PD3MuTGRWJ44hgVFItNXBvDnq4xNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gtcFGhxz
Subject: Re: [Buildroot] [PATCH v4 2/4] package/python-gobject: fix event
 source registration with Python 3.13
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

Hello Fiona,

Thanks for working on this (which we know is a complex topic). However,
while the series looks good and I was about to apply it, there's one
fairly significant concern below.

On Mon, 14 Apr 2025 18:15:43 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Since Python 3.13 BaseSelectorEventLoop.add_reader() and
> BaseSelectorEventLoop.add_writer() use the mapping returned by
> selector.get_map() to detect if a file object is already
> registered. This fails with the implementation in gi.events._Selector
> if some calls use a file object, and others the raw file descriptor.
> 
> Full upstream bug report:
> https://gitlab.gnome.org/GNOME/pygobject/-/issues/689
> 
> This bug breaks package/python-aiomqtt, because its client object uses
> file objects in some places for the connection socket, and the file
> descriptor in others. The result is that the connection attempt times
> out because source registration fails, and the Future that marks
> successful connection never resolves.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> The bug fixed by this patch is present in 3.50.0 and 3.52.3 alike, the
> reason for applying the update first is simply that the patch doesn't
> apply with 3.50.0, and backporting would be unnecessary effort when
> the update is due anyway.

And actually that doesn't work, and we want exactly the opposite: the
fix before the bump. Indeed, the fix is needed for our 2025.02.x LTS
branch, which has python-gobject 3.50.0. So we definitely want the fix
on 3.50.0 (so that we can backport it to 2025.02.x) and *then* the bump
(which would be only on the master branch).

Do you think you could rework your series with this change?

Thanks a lot for all your work!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
