Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89FCC54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 15:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A137E60DE6;
	Mon,  2 Jun 2025 15:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id og2H6QfnzrDc; Mon,  2 Jun 2025 15:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC16B6087F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC16B6087F;
	Mon,  2 Jun 2025 15:15:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AE761F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 15:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F04E180C21
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 15:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVJ0Eir-kcdu for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 15:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB89080C2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB89080C2F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB89080C2F
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 15:14:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1D0C439AC;
 Mon,  2 Jun 2025 15:14:52 +0000 (UTC)
Date: Mon, 2 Jun 2025 17:14:51 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250602171451.7e6a8046@booty>
In-Reply-To: <20250602135056.404165-2-neal.frager@amd.com>
References: <20250602135056.404165-1-neal.frager@amd.com>
 <20250602135056.404165-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkedttdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrsggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748877293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cf1nv89dxxnmMeOWmRmvMy/ZXKeuutEKcCYJbAljiMw=;
 b=Z0RPTwlriB5rCu4bgah+0ly33I3LMXx2J/b0uiNjJeaeHtYr+VcCzDq0MkF92/MAcOz2OB
 MGmDZQP5/01wT6E7d3IEvvcFaZJQqwOBu4/IdEyY/43SAInrJfLhzMdJZblRKzuMBqegsv
 KDasDGl41Uq/nYxLlGgDktBhLklOchY8S/NW0yq1R8Ax8aDuEGEXYI/NhtQe1j+nzVNVxW
 9KsiUk1Jo23NOc5IpyfX526BJZVVBUAFc+RwMQQ3FG5inPHEI8SPZnDgC67Yx0REDsMlLd
 aBjuwU6be4bd31/GGDSSOzuwwj0cGm9IDfbharyhDcO9140rYSCCNlsfafiMgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z0RPTwlr
Subject: Re: [Buildroot] [PATCH v1 2/5] configs/zynq_zc702_defconfig: bump
 to xilinx-v2025.1
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 2 Jun 2025 14:50:53 +0100
Neal Frager <neal.frager@amd.com> wrote:

> From: Neal Frager <neal.frager@amd.com>
> To: <buildroot@buildroot.org>
> CC: <arnout@rnout.be>, <luca.ceresoli@bootlin.com>, <thomas.petazzoni@bootlin.com>, <peter@korsgaard.com>, <michal.simek@amd.com>, <ju.o@free.fr>, <brandon.maier@collins.com>, <romain.naour@smile.fr>, <ibai.erkiaga-elorza@amd.com>, Neal Frager <neal.frager@amd.com>
> Subject: [PATCH v1 2/5] configs/zynq_zc702_defconfig: bump to xilinx-v2025.1
> Date: Mon, 2 Jun 2025 14:50:53 +0100
> X-Mailer: git-send-email 2.25.1
> 
> This patch bumps the zynq_zc702_defconfig to xilinx-v2025.1 which includes
> the following updates:
> 
> - Linux v6.12.10
> - U-Boot v2025.01
> 
> The xilinx-v2025.1 Linux 6.12.10 release tag requires a patch to fix a
> leak of the Kconfig CONFIG_XILINX_AIE, so this patch is now included.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
