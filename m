Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB067C3ABDD
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A76F40909;
	Sun, 18 May 2025 21:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XapBLkwmeu8u; Sun, 18 May 2025 21:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDBDB40BDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDBDB40BDC;
	Sun, 18 May 2025 21:06:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC9D6193
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D255A40909
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4RlGvoAqHNr for <buildroot@buildroot.org>;
 Sun, 18 May 2025 21:06:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 903984087B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 903984087B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 903984087B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B8B11FCEA;
 Sun, 18 May 2025 21:06:28 +0000 (UTC)
Date: Sun, 18 May 2025 23:06:27 +0200
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, "Wojciech M . Zabolotny" <wzab01@gmail.com>
Message-ID: <20250518230627.1c115ba9@windsurf>
In-Reply-To: <20250518082821.41023-1-kadambini.nema@gmail.com>
References: <20250518082821.41023-1-kadambini.nema@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudelheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvjedvgfffveetieffudegieevleeigfffteefhefhtefhueelfeekjefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepkhgruggrmhgsihhnihdrnhgvmhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdro
 hhrghdprhgtphhtthhopeifiigrsgdtudesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747602388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phfE/0rff/mWQyThYuvZzx4uYcUIdfTB07A/otm0Mf8=;
 b=WoyjoxkpH51sAv9rUw7C68E/GfOYiy9AwDUW53D3krd1vbfAcqwrJ+8/M9fbsrJcsqsoIW
 K1O0CvTwTfOQAicFauTiRZos0U4RBkcSAukTr2aLKwey4xRPOoLxd1Oi39zLdkPcsEycO0
 NwDMqt4VNzf76eqr6lOtx3BUOY77ap2p1Y/AV11HDeCTofoqXF64okfqCl40YBJS4IdkT2
 baaio9ozZ/fyuqO853OLOqXOPzpovMijaKnx+g9uLltakqocaAVoPeZBR9gn/9RTlyqoUi
 y45vr4DS8LWMfn0kEDYWPEZJdH97LdAJe1oIzJCAnAPv9X3eETVzLoefXUrfqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Woyjoxkp
Subject: Re: [Buildroot] [PATCH 1/1] package/avrdude: bump to version 8.0
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

On Sun, 18 May 2025 01:28:21 -0700
Kadambini Nema <kadambini.nema@gmail.com> wrote:

> Release notes:
> https://github.com/avrdudes/avrdude/blob/v8.0/NEWS
> https://github.com/avrdudes/avrdude/blob/v7.3/NEWS
> 
> Updated COPYING file hash due to the following upstream commit:
> https://github.com/avrdudes/avrdude/commit/ececf3258e77eb147b0af75275de5ba7d071d7a4
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>  package/avrdude/avrdude.hash | 4 ++--
>  package/avrdude/avrdude.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
