Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE7EC369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 21:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860DB608FD;
	Sun, 20 Apr 2025 21:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ld-SmlSBtrQV; Sun, 20 Apr 2025 21:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA0E4608F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA0E4608F4;
	Sun, 20 Apr 2025 21:48:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EFD91C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60BB840758
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YH-g2QuWRkqj for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 21:48:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C6D14073D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C6D14073D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C6D14073D
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:48:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 106A042F79;
 Sun, 20 Apr 2025 21:48:07 +0000 (UTC)
Date: Sun, 20 Apr 2025 23:48:06 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
Message-ID: <20250420234806.450c6ea6@windsurf>
In-Reply-To: <20250420213205.zorogfzwxp6iiumy@n621.de>
References: <20250420204540.32264-1-fl@n621.de>
 <20250420231307.413d3108@windsurf>
 <20250420213205.zorogfzwxp6iiumy@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeltdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfhhlsehniedvuddruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745185688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PeGyDOQkSJYO8vWoUBeSHiqkljtCO5nKaFXcej27iXI=;
 b=Ig/xa6FezVxuHlVU9KZFsAyfNpVYGww+72top3ixxdhoOTVqoyUZAlfpUgoyYPSG6HFuXL
 IfZAkPjUzphRsNQscBsmvbTD+c9qDHQ04ojzteOD8thuVpGW6YZzkLjLkRfcXGpc7El70q
 N57lKUsThQC1JTQWYnRZ1EVLdU5vQaCyH+gxJBGQTsiU7M5yvsp2hD6fpO8RyXE+w/J8VA
 H66+DlV0ut2JSaQs6GQ0590GvutgTrbdOe+6D/cvep6q3a8XIEhjEhSWE2R8w1gK1ajc4S
 mfbbtWt7l99J9zYTPLvZj0dKr8q6ynVaZev3RwuILqH5j9RGP3lSj5VxPi00hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ig/xa6Fe
Subject: Re: [Buildroot] [PATCH 1/1] package/casync-nano: new package
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

Hello Florian,

On Sun, 20 Apr 2025 23:32:05 +0200
Florian Larysch <fl@n621.de> wrote:

> On Sun, Apr 20, 2025 at 11:13:07PM +0200, Thomas Petazzoni via buildroot wrote:
> > > +config BR2_PACKAGE_CASYNC_NANO_CASYNC_SHIM  
> > I am wondering if we really need this option. What about simply
> > installing this shim automatically if BR2_PACKAGE_CASYNC is disabled?  
> 
> That would be an option too. Personally I'd err on the side of not
> cluttering /usr/bin unnecessarily, but if you think that makes more
> sense I can change it.

OK, fair enough!

> > Why aren't those same options set for the target variant? I'm not quite
> > sure to understand why the host and target variant don't have the same
> > dependencies. If zstd and libcurl are optional, then they should also
> > be optional for the target variant.  
> 
> The host variant of the package is only building a different sub-program
> (csn-tool), which has different dependencies (namely it only needs
> libcrypto from OpenSSL).
> 
> The reasoning for the split here is similar to other OTA tools like RAUC
> where there is one component that is only really useful on the target
> for installing the update and another component that is only useful on
> the host for generating/manipulating that update.

Makes sense, thanks for the explanation!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
