Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C57FC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 20:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD11D806B1;
	Mon, 19 May 2025 20:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXZJq0pME7bx; Mon, 19 May 2025 20:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B5EF806AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B5EF806AF;
	Mon, 19 May 2025 20:29:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F1B8193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 20:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1018541048
 for <buildroot@buildroot.org>; Mon, 19 May 2025 20:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhuNr2N8ls6W for <buildroot@buildroot.org>;
 Mon, 19 May 2025 20:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD456400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD456400BD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD456400BD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 20:29:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45A0E439F0;
 Mon, 19 May 2025 20:29:09 +0000 (UTC)
Date: Mon, 19 May 2025 22:29:07 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20250519222907.08071cee@booty>
In-Reply-To: <SA1PR12MB56153F6805BA3F497D3400CEF09CA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250409064711.3024937-1-neal.frager@amd.com>
 <20250516104213.0ed78643@booty>
 <SA1PR12MB5615919365719A06F37E3ED7F093A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250519173419.322a530a@booty>
 <SA1PR12MB56153F6805BA3F497D3400CEF09CA@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddvfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehmihhnugdrsggvpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747686550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eaf1ZZPnX/xKqzbzcJBNM8T7s7IU0Jm90jsnQmx1MQY=;
 b=T4oBSK3OAIF4kMGBub12RQJqBWylECXaVx6OAud3AFSyR+T7s9TMk0ayt/J05trJPt94dD
 gaRJSmnPDgvKTHA1RRRBk9W5JPrha/NXibe7MMjbJ3CgnqH+gh18983I3228nuZ7kt8HGx
 UcWlGYPoXH4qbBiJYSgdbAx2T9ok10HrEQlydIKjtkN1ekA+HMbZ35VOxGd4piCoabeOGs
 K2UfebuUzj1xczbWbMyE3v6oJm69FRVddwN2lAbCKMvych7xA57s3ZQztlV42+hw6zsI7z
 nRl20ASFxc8eWpWfdA9Da5NQUWwkpNl/ekoxMswlHo6mEQkdm3IZQd5E4/vGVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T4oBSK3O
Subject: Re: [Buildroot] [PATCH v5 1/3] boot/xilinx-embeddedsw: rename
 toolchain vendor to buildroot
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "arnout@mind.be" <arnout@mind.be>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 May 2025 16:02:33 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> >  
> > > This patch renames the bare-metal toolchain vendor used by the
> > > xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
> > > other toolchains built by Buildroot.
> > >
> > > To build the Microblaze applications available with the xilinx-embeddedsw
> > > package, the following config is now needed:
> > >
> > > BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
> > >
> > > This change keeps backwards compatibility for users already using the
> > > following architecture tuple:
> > >
> > > BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
> > >
> > > Either vendor name is now valid, but the documentation will describe using
> > > the Buildroot vendor name.
> > >
> > > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > > ---
> > > V1->V2:
> > > - xilinx-embeddedsw is now backwards compatible with either vendor name
> > > V2->V3:
> > > - split patch into series
> > > V3->V4:
> > > - rebase patch
> > > V4->V5:
> > > - add deprecation warning for microblazeel-xilinx-elf tuple
> > > ---
> > >  boot/xilinx-embeddedsw/Config.in            |  3 ++-
> > >  boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 30 ++++++++++++++-------
> > >  2 files changed, 23 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> > > index a27253d594..31b12baaf2 100644
> > > --- a/boot/xilinx-embeddedsw/Config.in
> > > +++ b/boot/xilinx-embeddedsw/Config.in
> > > @@ -1,4 +1,5 @@
> > > -comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> > > +comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
> > > +     depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
> > >       depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
> > >
> > >  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
> > > diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> > > index 7d4fcf8b8f..6e37dc48bd 100644
> > > --- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> > > +++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> > > @@ -12,6 +12,18 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
> > >  XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
> > >  XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
> > >
> > > +ifneq ("$(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc)","")
> > > +$(warning BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf" \
> > > +     will soon be deprecated!)
> > > +$(warning Please migrate to new bare-metal toolchain config below)  
> >  
> > > A warning is not very visible, so it won't be very effective. You
> > > should really use the same logic that Config.in.legacy uses: error out,
> > > and clearly state how to migrate, practically. E.g. (untested):  
> >  
> > > $(error microblazeel-xilinx-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is not supported anymore!)
> > > $(error Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)  
> >
> > If I do this, then it means that users must switch immediately to the new
> > microblazeel-buildroot-elf tuple definition.  My thought about the warning was
> > that either tuple would be valid for awhile before deprecating the old one.  
> 
> > I understand your idea, and I'm sorry I didn't realize from the
> > beginning and changed my mind only after testing accurately the series.  
> 
> > However I think a warning will be unnoticed my many users, and others
> > might just be lazy and ignore it for as long as they can. So basically
> > they would never update their defconfigs until forced to do so.  
> 
> > It may look a rough attitude, but it's pragmatic, and it is what
> > happens with Config.in.legacy IIUC: an old symbol is not accepted
> > starting at a given Buildroot release, but an easy upgrade path is
> > provided for at least one year after that release. So users upgrading
> > regularly enough will:  
> 
> >  1) upgrade to newer Buildroot release
> >  2) have a build failure with instructions on how to update
> >  3) update their defconfig
> >  4) build successfully
> >  5) be happy  
> 
> > Note the "with instructions on how to update" at step 2. This is a
> > prerequisite to step 5. :-)  
> 
> Hi Luca,
> 
> I agree with your strategy of #2 leading to #5, so I will go ahead with
> deprecating the xilinx vendor name with this patch set.
> 
> However, to add the new buildroot vendor name, I have a chicken and
> egg issue.  If I deprecate the xilinx vendor name while adding the buildroot
> vendor name, it will cause all the zynqmp defconfigs to have build failures.
> 
> Would you be ok of my patch set doing the following?
> 
> Patch 1: Add buildroot vendor name with warning messages.
> Patch 2: Update toolchain-bare-metal help details.
> Patch 3: Migrate zynqmp defconfigs to new buildroot vendor.
> Patch 4: Change warning messages to error messages.

That would work. But if it makes your life simpler, I guess for this
specific case it would make sense to have a single commit doing
everything. I.e. squash all the 4 patches into a single patch.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
