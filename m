Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDD1C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 08:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5FCC40CD0;
	Fri, 16 May 2025 08:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2fBDbeRW92n; Fri, 16 May 2025 08:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C482C4178B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C482C4178B;
	Fri, 16 May 2025 08:13:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7072C13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61D9761263
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pk878I8xCOYx for <buildroot@buildroot.org>;
 Fri, 16 May 2025 08:13:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 526486125F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 526486125F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 526486125F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:13:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD4434327D;
 Fri, 16 May 2025 08:13:31 +0000 (UTC)
Date: Fri, 16 May 2025 10:13:30 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250516101330.3de79c77@booty>
In-Reply-To: <20250409110455.3850790-3-neal.frager@amd.com>
References: <20250409110455.3850790-1-neal.frager@amd.com>
 <20250409110455.3850790-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteehvedutddujeehleetteffiedtudethfffgfelieejfedvvdffuefgvefggeefnecuffhomhgrihhnpehgihhthhhusgdrtghomhdprghtlhgrshhsihgrnhdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlu
 ghrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesmhhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747383213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtVaL53zuaXuIMVeZhUwnk6B2bzUax57ozq74QnpNME=;
 b=cn945ny2JzbgHBggKFC5N/Ocsdun8cZYYaHcyWpyoBM5/V3RhSLJ0SVyFuFBti0O63jYln
 rmUHEv+44PbH3GH6LcJxPGWorG9lo0QS2yd1Y0gb408Yr9VVuZecWbzz0ykFCItqr2qhB8
 gW5fCZKg6H05jjdR4vWqbdhnjRd9LtzgYZsQ5qxdMe3AWXpCqDAmFfq76z9nQsyoETj4A9
 TBmzXMtNulw1TtY6hoqPHxvJN70l1t8HlBJwjeG54/j+LFkou02QfI78StSAwCRLL6YUrv
 bbPowOYgCnCO8u6efTN4EI5PM4JEuYBNVE3szgLkcY+6xhX2gLf31zfVj5Du3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cn945ny2
Subject: Re: [Buildroot] [PATCH v3 3/3] boot/xilinx-prebuilt: install
 pld.pdi to target
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
Cc: ibai.erkiaga-elorza@amd.com, arnout@mind.be, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 fabio.caccamo@amd.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 9 Apr 2025 12:04:55 +0100
Neal Frager <neal.frager@amd.com> wrote:

> With the Versal Segmented Configuration, it is possible to load a PL bitstream
> at run-time using the Linux fpgautil application.  Whenever Segmented
> Configuration is used, both the boot.pdi and pld.pdi files will be available
> to Buildroot.  For this reason, this patch improves the user experience by
> installing the pld.pdi file to the target file system for run-time loading
> whenever Versal Segemented Configuration is used.
> 
> If the fpgautil application is available in the target file system, it can
> be used for loading the pld.pdi using the target command below.
> 
> fpgautil -b /lib/firmware/xilinx/*_pld.pdi
> 
> The source code for the fpgautil application can be found here:
> https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c
> 
> Along with usage details:
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

You are proposing to install this file unconditionally. Aren't there
use cases where this is not desired? Also, how large can this file be
for a complex FPGA design?

I think a Kconfig boolean to enable this installation (defaulting no
'n') should be added.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
