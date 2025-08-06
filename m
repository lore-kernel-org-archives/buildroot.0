Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31735C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 20:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08C8D84731;
	Wed,  6 Aug 2025 20:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiVT9KvExMBl; Wed,  6 Aug 2025 20:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC5308472E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC5308472E;
	Wed,  6 Aug 2025 20:17:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 386DFD79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A56941EE5
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gBfn9ANhqMv for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 20:17:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9ABB741F39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ABB741F39
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9ABB741F39
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:17:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AB7B4335A;
 Wed,  6 Aug 2025 20:17:51 +0000 (UTC)
Date: Wed, 6 Aug 2025 22:17:45 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Message-ID: <20250806221745.03c267a0@windsurf>
In-Reply-To: <20250805125846.31c941c1@windsurf>
References: <20250728045145.132333-1-neal.frager@amd.com>
 <20250804214047.5cfcf471@windsurf>
 <SA1PR12MB5615611A10ADA56A9816AAB7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805100953.380f13df@windsurf>
 <SA1PR12MB5615E2ACED00D66546CC13E7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805125846.31c941c1@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudduueeftdejhfetledugfevgfevtefgudfgueeffedutedvuedvteefvdduudeunecuffhomhgrihhnpehgnhhurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754511472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ng40zLs0PHleapHoHBf51tAzh/HXL2evteR08W/Zfdk=;
 b=Mp0mFJH9ujNliL6kBWAV303Gy8n01aecIBU99E6rCGU70OS80dJ34jG5+Ju3MvoCUlRg35
 B0f/BYL4kL83wl7MVdjYTW4ZOsv3kkqsCiaGXTgmo1Kiv4ujB0bTZE3gnn3Ti/TdComQRn
 91xWatYA0ujzC6HrvI03xWk9zd79UBXQGGmEg5kPVz4LBr+77rblYEZl+nPPhmqfzvDUfc
 EFaezuvi7aJM8aYB19TNIDcO0LmULJzFHy3zeBrcFFr6ebI9Jjw1bxFy+aDiHyJsh5J0j/
 9HpxjH1ulb2uwY1Gayd3YrxH5OhYTI6pVYrk0/Ey2H5WL5st6Fnels/f11GznQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mp0mFJH9
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
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

Hello Neal,

On Tue, 5 Aug 2025 12:58:46 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> > There seems to be something specific in the init script that is failing.
> > Should we consider creating another gcc bug report against gcc 15.x?  
> 
> We can certainly do so, but we don't have a lot of data to provide at
> the moment :/

I went through the tedious process of bisecting which GCC commit
introduced the bug, and therefore collected a little bit more useful
data and consequently submitted a GCC bug report:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432

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
