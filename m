Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0403AC369D5
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C90AC81415;
	Mon, 21 Apr 2025 21:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xi9-kDCXkOja; Mon, 21 Apr 2025 21:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE6E8143A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BE6E8143A;
	Mon, 21 Apr 2025 21:35:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CD5A1A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E34C60813
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXeYSsJw_vHu for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E4CA60B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E4CA60B26
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E4CA60B26
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:35:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E64C41C3E;
 Mon, 21 Apr 2025 21:35:19 +0000 (UTC)
Date: Mon, 21 Apr 2025 23:35:18 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>
Message-ID: <20250421233518.4a2529ee@windsurf>
In-Reply-To: <20250326081814.3477045-1-yegorslists@googlemail.com>
References: <20250326081814.3477045-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeduleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedvjedtieejvdetteevvdefueekfeeiteeukefhhefhgfehieegffffheduudevnecuffhomhgrihhnpehhthhtphhinhhgrdhmkhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohephigvghhorhhslhhishhtshesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhot
 hdrohhrghdprhgtphhtthhopehgihhllhgvshdrthgrlhhishesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745271319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hOSleg0N7lgh4pTh3jNpDMGnhju6VfZJ/Zc/Lkgq3nE=;
 b=YN7VFxxs9824rQ6p5pQd88mmvordy9ZXgzmRmI6lAAeAmj+FB531K3Ol8Xukh9fl2id8Su
 YlPa6B9icanrAayMlj3BDEXPhDhKft/Pq0YtO4InNOtfkvwjKGnRDrwEo0XvjN+3IhToln
 JTWtIjYV53hXm/UPk2amzUYn9IH6mQ1ObTYFdzA4VBAsF1DXaOULh1pxtjo4GtvfAubl/C
 adL43vNobWwlo5mXDxPG+vCM5iM/GDKq5IRAUxxHrMsgcsK+AIoyYypjgh2jTU7FzXufls
 CtMEP68poAC91d1rjWAnpbxM8MDf/+oZ0IBDet4ICLAfX+N/SfMc69XC1/LYxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YN7VFxxs
Subject: Re: [Buildroot] [PATCH] package/httping: bump to version
 a1c5fdcf289cf7d1d8245579150bcf670f90d248
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

On Wed, 26 Mar 2025 09:18:14 +0100
yegorslists@googlemail.com wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Enable gettext support.
> 
> Make all options configurable.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/httping/httping.hash |  2 +-
>  package/httping/httping.mk   | 16 ++++++++++++++--
>  2 files changed, 15 insertions(+), 3 deletions(-)

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
