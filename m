Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9595FC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E53A61076;
	Wed,  5 Feb 2025 15:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoE0iOv-XNJK; Wed,  5 Feb 2025 15:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65BBE60830
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65BBE60830;
	Wed,  5 Feb 2025 15:19:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA7E512A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA0D342579
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bc8Sw72CmDN4 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:19:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00F234256C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00F234256C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00F234256C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:19:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F41AB442BA;
 Wed,  5 Feb 2025 15:18:59 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:18:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ayoub Zaki <ayoub.zaki@embetrix.com>
Cc: buildroot@buildroot.org
Message-ID: <20250205161858.384e1668@windsurf>
In-Reply-To: <20250205144728.371416-1-ayoub.zaki@embetrix.com>
References: <20250205144728.371416-1-ayoub.zaki@embetrix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprgihohhusgdriigrkhhisegvmhgsvghtrhhigidrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738768740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMor2lQE1hwtnKY2w+JApB8wkI4GJBgt+/vwt9+lHEo=;
 b=W6w3kZXAhIKJWZns/XZgeNH/yFEwRBFk2zmDg9uQsuo0vFah0/u0BeAF8c6TH/Rojee7qp
 bhcchEsR1AaTh1KWDjRF2NZ8noPLTpC9fvDFoo+zyKIQ1ulVrUNq2p/AbFc0g0eeyDL0BC
 uknKrQw7ok8iqPmyHMWCMLooiyf0UdXOX3uORjgtuSSFKtLUH534ODeOaRgTqdB0UwN8Wp
 y9npEXfZ/mvaO2rmw6nem5H3T4c/q3ReZOYOswqSXNXMHKBao/s6tY6kCSevApZuIxqGHw
 BzllCkJegpp9SC2oHZxbxzP1CSL2+2gXG8QsahwyI0UEXHzAsH8AdsWdYje/Rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W6w3kZXA
Subject: Re: [Buildroot] [PATCH 1/1] package/bmap-writer: bump to version
 1.0.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Feb 2025 15:47:28 +0100
Ayoub Zaki <ayoub.zaki@embetrix.com> wrote:

> Switch from libxml2 to tinyxml2
> 
> Add http(s)/ftp stream wrapper script
> 
> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
> ---
>  package/bmap-writer/Config.in        | 2 +-
>  package/bmap-writer/bmap-writer.hash | 2 +-
>  package/bmap-writer/bmap-writer.mk   | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
