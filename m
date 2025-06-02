Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F03C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 15:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB42280C31;
	Mon,  2 Jun 2025 15:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeH4a6PJdfIz; Mon,  2 Jun 2025 15:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2CCC80C27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2CCC80C27;
	Mon,  2 Jun 2025 15:14:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC1F11F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 15:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD7FB6087F
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 15:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tipgHfD3e2RO for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 15:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D930560706
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D930560706
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D930560706
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 15:14:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F33B43994;
 Mon,  2 Jun 2025 15:14:34 +0000 (UTC)
Date: Mon, 2 Jun 2025 17:14:33 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250602171433.11d81e6b@booty>
In-Reply-To: <20250602135056.404165-1-neal.frager@amd.com>
References: <20250602135056.404165-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkedtudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrsggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748877275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OqrpioIwdw0QFePJE9+XtevoUuMGfVe8P/TNHKol/Ac=;
 b=K89moN+Zt8HmqFNiyU6n0W9PcZYYwxOEf5lEXawaJ0PlBIgirSoiHnlPkVQphrhEpivRPQ
 k42ic/fNm0x0MFQ09l4mGgsWcn9JC4yrrzgZq62hGIPO7NJDku7pG+xr3LP4D7lBQdHb9b
 kd8WNLbT4uroY/vva2Zkn7omeSC45JzMlsRmG94ALRsElixEpSsAibcDHs3d3ZtIITyxU8
 mEvr9DRBvqKzFA220iJPA7fDKhAs8xYKWSXGGrrGP9BqgIBDLZOojAePznzGKgGFQ2CMJ0
 fC+pVUeYTNX1dbBXAZoN2dVXPeHa6j2s9UeL4JmrBwQ1XtCbkvJNIwbNz3dlvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K89moN+Z
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx: add xilinx_v2025.1
 support
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

On Mon, 2 Jun 2025 14:50:52 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Add hashes for xilinx_v2025.1 release.
> 
> xilinx_v2025.1 release includes:
>  - atf 2.12
>  - linux 6.12.10
>  - uboot 2025.01
> 
> In addition, the xilinx_v2025.1 linux kernel release tag has a Kconfig leak
> of the CONFIG_XILINX_AIE option.  This patch adds a patch that is specific to
> the Xilinx Linux 6.12.10 release which fixes the problem by moving the changes
> implemented by the CONFIG_XILINX_AIE option from the exposed uapi header file
> to the Linux internal header file.
> 
> The patch has been added to the board/xilinx/linux_6.12/patches directory, so
> that it will only be applied when a user specifies they wish to build the
> xilinx_v2025.1 release or they use a defconfig that has migrated to this
> release.
> 
> Since the header file that causes the issue is not yet mainline, this patch
> has been "upstreamed" to the Xilinx linux-xlnx repo via the AMD internal jira
> process.
> 
> Upstream: internal AMD jira process
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
