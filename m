Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F72C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8193A8218B;
	Wed,  5 Feb 2025 10:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEc5RqrGEJkp; Wed,  5 Feb 2025 10:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 808A3836F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 808A3836F0;
	Wed,  5 Feb 2025 10:49:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F49812A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E78460663
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9k8xeJo2zsp7 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:49:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58BDE60598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58BDE60598
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58BDE60598
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:49:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55E5C43299;
 Wed,  5 Feb 2025 10:49:10 +0000 (UTC)
Date: Wed, 5 Feb 2025 11:49:09 +0100
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: buildroot@buildroot.org
Message-ID: <20250205114909.18e5f9dd@windsurf>
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghrihgrnhdrtggrihhnsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738752550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEU/TJgB04eluekbEVuvolRKh32byIzQsxKJ8FrrKAo=;
 b=ZepV2UMTKupa1aSqGu6r5WBgJe1saJAuApiRlpWJHPklWwf/to51TFrEvN00SJppL1zOIc
 5CJzKME71uA32KkqYeVPfPFLJI93N2jOyLHga0YNDdKY+KKC7Xegm3hhzJbfLaEmGw8syw
 XjCDyXLVi0sHZIeo9JWHeR+VTMvMFIiyflxdqb+l2r/9WbXSPyEg7ML6Rwt2pCKU2rDUfO
 UP0EZtuYnooC3sZ1JFLV22Wzgz/UkpNU7ZBreUzZ8RCjf8IaHW2/Ugd27Mt8J4O3gc+ogK
 1hRPUlRIhkSG6E5nx4SETOsA0iWyEFyDZhlukArudoTLwr4nuyMPDCphfrLxAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZepV2UMT
Subject: Re: [Buildroot] [RFC v2 00/14] add hexagon architecture
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

Hello Brian,

On Wed, 18 Dec 2024 21:30:39 -0800
Brian Cain <brian.cain@oss.qualcomm.com> wrote:

> I'm sharing this series with the list for the sake of discussion about
> how the approach taken could improve.  It's likely not quite ready for
> upstreaming yet.

Thanks for this series. Could you share some more details about the
Hexagon architecture, what is its current usage and use cases, roadmap?
Indeed, adding support for a new architecture in Buildroot means that
our autobuilders will try building all packages for this architecture,
which will certainly raise a large number of issues, which you will
have to address as a maintainer of this CPU architecture. How committed
are you to this effort?

This is even more significant as your proposal is to support this
architecture with Clang as a compiler, which will certainly break a LOT
of packages, causing even more troubles.

So what you're proposing here is certainly very interesting, but it's a
really large endeavor, and we need to understand whether you'll still
be around in 6 or 12 months to support this and address issues.

I'm going to reply to the individual patches with some more comments,
but I think this top-level discussion is the most important.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
