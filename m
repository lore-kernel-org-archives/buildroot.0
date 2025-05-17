Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BC0C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3780A60D8C;
	Sat, 17 May 2025 15:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0T1GZdqOyUA; Sat, 17 May 2025 15:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6571360D5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6571360D5F;
	Sat, 17 May 2025 15:18:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C934223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DAF6409F0
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92O82jokPcji for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E187409EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E187409EB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E187409EB
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:18:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7028B43956;
 Sat, 17 May 2025 15:18:32 +0000 (UTC)
Date: Sat, 17 May 2025 17:18:31 +0200
To: Ayrton Leyssens <aleyssens@idtech.be>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, Gilles Fouarge
 <gfouarge@idtech.be>
Message-ID: <20250517171831.7fddcaa6@windsurf>
In-Reply-To: <VI1PR06MB8926D3F9BF282F9072C81811AD852@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB89261C88ECA6A6ACC6D9FFCCADBB2@VI1PR06MB8926.eurprd06.prod.outlook.com>
 <20250423234823.75225cab@windsurf>
 <VI1PR06MB8926D3F9BF282F9072C81811AD852@VI1PR06MB8926.eurprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudehleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfejheetteethffghfffiefhfeetledthfehjeffieejjefhtdeikeegffdvheelnecuffhomhgrihhnpehmohiiihhllhgrrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrlhgvhihsshgvnhhssehiughtvggthhdrsggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpr
 hgtphhtthhopehgfhhouhgrrhhgvgesihguthgvtghhrdgsvg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747495112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgTKyW1IiNNinB2EU9YIstoxeph9okfVQ6quz2voN5M=;
 b=E5RRsOrEmpBSEiUJosodUzzEFgjWC4agDRGGdinltKqGmBO322kF7mtJ0BgcGmJh1ft8Og
 mmgoRLcLRDlDGxvaiWMk6vJCSAQpHSuftzIrgbRrHzlAS/z8mNgExKSbCmX44OEeoS2QHr
 cJla7sPFV5kew+jIMKo4th4UA46zw7+jyEwMFzkysSXOc/PxSPIMfuoAmrZf1qIlA1UpXG
 uvb2gPqmqnG1XnkFHmmmQtbWlkZ3AZ+84K+mmdQ6rf2rKiFtd58xvLcmz4yvN1XRQ1FA6t
 3EOPHTp+R1vLfGYNocYwXiHfQlUJ7/8qAPr89977KsdBkDhLeCL93gg9tVOakg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E5RRsOrE
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss fix buildtype
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

Hello Ayrton,

Thanks for the feedback. More questions/comments below.

On Thu, 24 Apr 2025 06:11:27 +0000
Ayrton Leyssens <aleyssens@idtech.be> wrote:

> The issue presented when we were debugging Certmonger (which I still have to send in correctful).
> Same Cermonger version as a Yocto based reference build.
> So, we looked at the dependencies.
> When checking versions with 'strings libnss.a | grep -i version' we saw version = 3.108 (debug) (while the reference has not).
> Going through the docs of LibNSS, I noticed that the make target of LibNSS is not using the default passed make arguments (like -O2).

Reading the code of nss, I see:

ifdef BUILD_OPT
ifeq (11,$(ALLOW_OPT_CODE_SIZE)$(OPT_CODE_SIZE))
	OPTIMIZER = -Os
else
	OPTIMIZER = -O2
endif

So when BUILD_OPT is 0, no flag is added. And as reported in my
previous e-mail, Buildroot passed CFLAGS -O2 and -g0 are taken into
account.

> When passed no additional arguments as defined (https://firefox-source-docs.mozilla.org/security/nss/build.html ), it is all 0 by default.
> So goes for the BUILD_OPT:
> 0: Build a debug (non-optimized) version of NSS. This is the default.
> 1: Build an optimized (non-debug) version of NSS.
> 
> -O2 disables the production of debug symbols, but the BUILD_OPT var has implications on the source itself.

No -O2 does not disable the production of debug symbols. The -g0 does it.

Could you clarify which implications BUILD_OPT has on the source files?
I went through the nss code base, grepped for BUILD_OPT everywhere, and
couldn't spot how this was having an impact on the source code.

> When in the so called 'debug' build, LibNSS discards all variables / sets them to NULL if not all arguments are passed to some functions.

Could you provide some pointers to the actual code? Also I guess you
meant these are discarded in the optimized build, not the debug build,
right?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
