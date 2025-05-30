Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2F6C5B543
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 19:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B639B606EA;
	Fri, 30 May 2025 19:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uT0bPw5cgQi; Fri, 30 May 2025 19:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E895D60659
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E895D60659;
	Fri, 30 May 2025 19:38:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3123A127
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1745C40A85
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWKO-EmuRJNs for <buildroot@buildroot.org>;
 Fri, 30 May 2025 19:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE19940A80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE19940A80
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE19940A80
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:38:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBE9143A71;
 Fri, 30 May 2025 19:38:13 +0000 (UTC)
Date: Fri, 30 May 2025 21:38:11 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250530213811.54c9e630@windsurf>
In-Reply-To: <20250528203623.27108-1-ju.o@free.fr>
References: <20250528203623.27108-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleekjeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieffkeejgeehvdetieevuddtffejueffkedtvdejieeiveetffegveffheeukeegnecuffhomhgrihhnpehusghunhhtuhdrtghomhdpghhithhlrggsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvddphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748633894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8IJlel1mohqHKc324QmLQuKOyRxiW4R5QrsBFV7y+zY=;
 b=hc7Wy6gizXF8ROjsy/RjJ4ZSHTgWF98q9bdF3EQElZZCbU2qwR2/KSL0wUeTY6pMhji6Jq
 h7aH7rduIVTV83IP5xniqdU5RFXNc4CeQYmvipUKKHpMcq41mes/7htR5T0G2i8qYJc31E
 dYCZJZHDJAKIo16adPigjYnTj/BLNiF6CEHvA4QZZac0609p/eGux45furVqMYAB7WN9Up
 AcmoyY1u0QZD5ppLMAqlyhT2ZYcTcdRLaiApAcYES1LFpzj+B5TMqBdHiVwBgEcnMgZCuu
 ZouZRIHz8zsj0aNrrUC58uHe+4ONm3quw+b/iD12Am4q3BAGTV4s3hx2EnQT5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hc7Wy6gi
Subject: Re: [Buildroot] [PATCH next 1/1] package/fwts: bump to version
 25.05.00
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

On Wed, 28 May 2025 22:36:23 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://lists.ubuntu.com/archives/fwts-devel/2025-May/014005.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/10169356276
> ---
>  package/fwts/fwts.hash | 2 +-
>  package/fwts/fwts.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
