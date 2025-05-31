Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEE2C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 08:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F490607B1;
	Sat, 31 May 2025 08:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ApBKi8gBPH0; Sat, 31 May 2025 08:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DB126079D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB126079D;
	Sat, 31 May 2025 08:56:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A893117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BFC540C3A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sll25tb65gN9 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 08:56:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E578B40C06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E578B40C06
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E578B40C06
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:56:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1868743AEE;
 Sat, 31 May 2025 08:56:29 +0000 (UTC)
Date: Sat, 31 May 2025 10:56:27 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
Message-ID: <20250531105627.12ba07de@windsurf>
In-Reply-To: <20250530221136.jnf4d76j4fidh6aw@n621.de>
References: <20250527152342.4288-1-fl@n621.de>
 <20250530220125.3b1c7c5f@windsurf>
 <20250530221136.jnf4d76j4fidh6aw@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudegkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvddphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehflhesnheivddurdguvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748681790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYqPgevyoNvN9BoYXC4YA2SpVHP1hpldW51LTpwHRsY=;
 b=MBKXpWmlmhX04ESJODZij9rvafxnSj2KPLbC6lsB1gRnINE72dA6isDLzWixus5Ilsmeyn
 5tTKIfr6ksYnYsBfNqgxuqkUlK+FY3i8AoE6xJIkEvZSijTQs+Dpf2IseN6zrmruIvVsXU
 wvrxS6Ip8GzgNGDKzH5FcbMH6M/mfy8nvXVkiRov5J+RXrrDnuB3SJKMCKwt099x6STIEu
 3ZtTnNVBJgwOmFMuOm4hjcZ4fdkvKNH3UPyEtQGHuEyGDAxwRFCd5hVCCxQ4D+z5k36cl/
 znAkMkA7uQcsNiSop0hhbFWleCRjsVZmbIdlZOLadodjh0kPC3qSyAzLB9G2GA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MBKXpWml
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: make
 cryptography library optional
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

On Sat, 31 May 2025 00:11:36 +0200
Florian Larysch <fl@n621.de> wrote:

> Okay great, I think that's the preferable option too if breaking
> compatibility is fine. I'll send a new version of the patch.
> 
> Is there a list of breaking changes I should add to?

You can add it to:

  docs/manual/migrating.adoc

in a new section "Migration to 2025.08", since your change will be
applied to "next", which will only appear in the 2025.08 release.

> > We might discuss whether gnutls should take priority on libnss if both
> > are available. Maybe NM documents that one is "better" over the other?  
> 
> I haven't found any explicit statements to either effect. Support for
> both libraries has been present from day one back in 2007.
> 
> Data points in favor of libnss:
> 
>  - It's the default value in the NM build system, so it would be the
>    preferred backend if both are available
> 
>  - It's probably the more mature of the two, given that it's being used
>    in Mozilla products
> 
> Data points in favor of gnutls:
> 
>  - While both backends seem feature-equivalent, the
>    _nm_crypto_verify_pkcs8 function is stubbed out in the libnss code[1]
> 
>  - Both Debian and Fedora explicitly select gnutls in their packages. I
>    can't find the reasoning for Debian but at least for Fedora it seems
>    to have been a conscious choice[2].
> 
> Given what it's actually used for in the code base, I don't think the
> choice really matters much when both options are available. I'd slightly
> lean towards gnutls just because it's marginally more feature-complete.
> How do you feel about this?

Wow, thanks for this super comprehensive research. I'm totally fine
with your reasoning. Make sure to copy/paste this whole research into
your commit log as the justification of why gnutls has been chosen as
the default.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
