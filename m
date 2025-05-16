Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF94C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A03608B0;
	Fri, 16 May 2025 14:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iiaxiU0oveKA; Fri, 16 May 2025 14:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6352660C13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6352660C13;
	Fri, 16 May 2025 14:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64F3D1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B2AF81208
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4F91jvnoRY7 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 415E081193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 415E081193
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 415E081193
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:50:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31E551FCE7;
 Fri, 16 May 2025 14:50:52 +0000 (UTC)
Date: Fri, 16 May 2025 16:50:51 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>, El Mehdi YOUNES
 <elmehdi.younes@smile.fr>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher
 <gsmecher@threespeedlogic.com>, James Hilliard <james.hilliard1@gmail.com>,
 Sam Voss <sam.voss@gmail.com>, Torben Voltmer <mail@t-voltmer.net>, Saeed
 Kazemi <kazemi.ms@gmail.com>, Alex Michel
 <alex.michel@wiedemann-group.com>, Leo Yu-Chi Liang
 <ycliang@andestech.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Message-ID: <20250516165051.3f20224d@windsurf>
In-Reply-To: <4f3b7a04-418b-4563-b556-60c5d6f2c34b@gmx.de>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
 <20250516133236.16e5aa23@windsurf>
 <4f3b7a04-418b-4563-b556-60c5d6f2c34b@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepfhhiohhnrgdrkhhluhhtvgesghhmgidruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegvlhhmvghhu
 ghirdihohhunhgvshesshhmihhlvgdrfhhrpdhrtghpthhtohepvghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrhdprhgtphhtthhopehjohhsvghphhdrkhhoghhuthesghhmrghilhdrtghomhdprhgtphhtthhopegurghvihgurdhpihgvrhhrvghtsehsmhhilhgvrdhfrhdprhgtphhtthhopehmrghilhesuggsrhhgnhdrtghhpdhrtghpthhtohepghhsmhgvtghhvghrsehthhhrvggvshhpvggvughlohhgihgtrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747407053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1pBFPUZgdpzXzf3uI456UP2sLmX6el2c1qJgRMDMNw=;
 b=RokfH4sIiDXfC8JQVhs/+dlaBKKu0mXzQfumerQAcOWsa6jy7cy05m8lZQBvqOVETQJOii
 gKBS0SfNjZZMGzALbmGgxx3IRTiLgiFavyPSu4zFJqErxSqA2mCrylW8BkFttLMT098lTM
 yh5Ege5ZTsA+QLOYvuzpDilMqv/JsFT4y4G//Lf8VuGstGo/N8RrNRMFRnajfVJAJ531t+
 OQKS9zLUN672SNVd6AcYsNaGOIWRxXydmK0L8ziyQ303L1t1/qJ5ulrr9x+M7mC/67YKA1
 EBTDK2CCbWof8scqqBipOvuNxS51DrppfHFKs1M6gSWG9GrLVh/UXkZiJEN1PQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RokfH4sI
Subject: Re: [Buildroot] [PATCH 0/4] package/rust: rust upgrade to version
 1.86.0
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

On Fri, 16 May 2025 15:40:00 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> it seems my patch to replace deprecated the .cargo/config [1] that was 
> discussed in that thread [2] has been missed. Is there any chance to 
> still squeeze it in? The problem is that if applied separately it'll 
> need a separate version bump for the generated cargo archives, but I'm 
> not sure if that's avoidable now (as the changes have been pushed 
> already). :-(

Dang, I missed that! Let's see what we can do about this, I'll discuss
with the other maintainers.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
