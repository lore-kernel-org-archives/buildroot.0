Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A31C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C9460818;
	Wed,  5 Feb 2025 15:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fbZE04B01cM; Wed,  5 Feb 2025 15:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED32360FBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED32360FBD;
	Wed,  5 Feb 2025 15:44:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F34F7CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2D7F82FF9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eMN11Fgqh9K for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:44:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDAB381158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDAB381158
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDAB381158
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:44:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A33B7441BB;
 Wed,  5 Feb 2025 15:44:36 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:44:35 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20250205164435.51b8cc5e@windsurf>
In-Reply-To: <20241116224107.452731-1-ju.o@free.fr>
References: <20241116224107.452731-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgeegleejvefgkeeuhedvtdevkeeiheejffefueekhfetudefleeuvdeffeefleenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhfrhgvvgdrfhhrpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhonhhtrghinhgvrdhfrggsrhhitggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738770277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y17eYOAIZ0wNdrmkcjuMxPHYs5aVc7eZAgSoNeAA9Dc=;
 b=orRHZfwtWDhTrLSyqFlalCLyhY+fJN65LOPqY+l+Eo9hFTNfW1venvKnFoyn5hs28tCwtL
 gu0Gone7pVWWK5b9Vw1VxV4Pf743gHj6S9tn5nlRzHNaClSJwSeA4FNqvuRjFRVYoxqneR
 eCTIRGESNbMYrERRsAiVyLi+DKuKK1xFWx2fsuBnL3n23ysZHEPAu68yYB2sQ0xrxwvG7c
 qO4nhLsokNCyuZtKSbL212ecXksWa4L2rsuJqsMFOMXwrn/LeWjqk7CZ8G6XeIpYluKEf5
 I+bvd2VgawKMuNayRyZNVOqX1NW3qKmxIQGSD9EaR+81HW7V4RPX91uKvO+2Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=orRHZfwt
Subject: Re: [Buildroot] [PATCH next 1/1] package/whois: bump to version
 5.5.23
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

On Sat, 16 Nov 2024 23:41:06 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/rfc1036/whois/blob/v5.5.23/debian/changelog
> 
> This commit also adds the sha1 hash published in the Debian source dsc
> file.
> 
> The _SITE url is also updated to the new snapshot, and to use the https
> protocol.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/whois/whois.hash | 5 +++--
>  package/whois/whois.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

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
