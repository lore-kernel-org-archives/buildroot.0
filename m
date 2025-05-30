Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B68C5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 19:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F7D60DA4;
	Fri, 30 May 2025 19:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zIgSPQGFvF9; Fri, 30 May 2025 19:54:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 010D860DC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 010D860DC6;
	Fri, 30 May 2025 19:54:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A23C2236
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8939B60D8F
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyOw2_BICkJn for <buildroot@buildroot.org>;
 Fri, 30 May 2025 19:54:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9891060D77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9891060D77
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9891060D77
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:54:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CC1A1F433;
 Fri, 30 May 2025 19:54:03 +0000 (UTC)
Date: Fri, 30 May 2025 21:54:02 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20250530215402.72d91835@windsurf>
In-Reply-To: <20250519060531.982830-1-fancp2007@gmail.com>
References: <20250519060531.982830-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleeltdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeiieefffehvdeludeigfevveekvdejhfeihfeuhefgueefffetveejtdfhudelnecuffhomhgrihhnpehgihhthhhusgdrtghomhdptghhrghnghgvlhhoghdrmhgupdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvddphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehfrghntghpvddttdejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrg
 hdprhgtphhtthhopehfihguohgpmhgrgiesihhnsghogidrrhhu
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748634844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C7MLVQ32yBBnIS1pmlnWu+p9M8+GL13rEiDp6g4yulc=;
 b=CTFT8LXaL/zalghUYmDE2TbX4H3gwpuUgZUnjeqDE9RunLDvSQl5Ga6rGbkBSiSYJDstnP
 1rab0VbjX6cRM/iiWEq61RRtoVnJTMYgnH5fFBZiOc+GzjVtLcUjV52nDN4+mtsuvTYJc7
 RKiS9ANIPCK1HfE7sbhh0ddhbWNSn4tZ8MzU55TTmxQaKBk4WRauQYhdaweM4SGiMgcO2j
 iTBCbuIds/3MJ/dVetFjGSDewkVGcC+PSgeXRpo/aMp1N9G5NW+sr8ECrNRd1nRX7FkOR2
 AUtPrSCOtL+76RDQkb1wonv89M5aLM6safQ4Q+EmYaGcPXZ3mgVRkTfyVBob3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CTFT8LXa
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.20.0
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

On Mon, 19 May 2025 14:05:29 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Release notes: https://github.com/timescale/timescaledb/blob/2.20.0/CHANGELOG.md
> 
> Add the PG_PATH variable to ensure that CMake can find the "pg_config" program.
> Otherwise, the following error will be reported.
> CMake Error at CMakeLists.txt:85 (message):
>   Unable to find 'pg_config'
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
