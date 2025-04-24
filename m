Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81D0C369D5
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 19:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A5BE42D9F;
	Thu, 24 Apr 2025 19:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOunUML6t8qk; Thu, 24 Apr 2025 19:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8104A42DA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8104A42DA0;
	Thu, 24 Apr 2025 19:39:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73106159
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 19:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59DE4813AB
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 19:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3-8CG8RZRhv for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 19:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30DC781C20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30DC781C20
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30DC781C20
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 19:39:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A0F841C3E;
 Thu, 24 Apr 2025 19:39:20 +0000 (UTC)
Date: Thu, 24 Apr 2025 21:39:19 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Cc: Neal Frager via buildroot <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>, "Caccamo,
 Fabio" <fabio.caccamo@amd.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "arnout@mind.be" <arnout@mind.be>
Message-ID: <20250424213919.2e40c109@windsurf>
In-Reply-To: <SA1PR12MB561566BC39D926C9E2AE0D64F0852@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250408114834.733285-1-neal.frager@amd.com>
 <20250422223601.1ca5077b@windsurf>
 <SA1PR12MB561566BC39D926C9E2AE0D64F0852@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepihgsrghir
 dgvrhhkihgrghgrqdgvlhhorhiirgesrghmugdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehfrggsihhordgtrggttggrmhhosegrmhgurdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745523561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f946nti3vTo9+O+v7pA9vNorgannX9uu6khbgmhVA8g=;
 b=GVU9y8BCd2LvSw2VbrD23XwhWwSvtnYuU71IMfRGqCixP/auk05REEjuhUI7tPbRYa5/lJ
 fg3Pa6eNYGHLGwP+zteeHY2DQ8vfQuyp01P7HKkkM0St7HVnhky6aGLfwCpAwZeqvqZAk9
 G8kyncTYTv5UITd5Ce1qK5K+DDZjnaQ+aYE5jg/WrVIBAtqIk2ePhIBdereMUejijhl8TY
 qt3/jw1ULHeMVLMHaqbml7J8YS38JZ09jWDoixb5GHaDwyZU3P63fqSOwtYWw3yyKroJm1
 kmF7YWKxsb38NR5fxXvorFCATgjtlNXDDFe3mwfCOcltCpcQu+mJkqPP+MBedw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GVU9y8BC
Subject: Re: [Buildroot] [PATCH v1 1/2] package/fpgautil: new package
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

On Thu, 24 Apr 2025 05:31:57 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> > This should only contain the package name, i.e "fpgautil", or if we
> > rename it "xilinx-fpgautil".  
> 
> Ok, I will change this.

Thanks, I've seen your v2. Much appreciated.

> > +FPGAUTIL_VERSION = xlnx-rel-v2024.2_update3
> > +FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(FPGAUTIL_VERSION))  
> 
> > I was going to suggest that we download only the source file, but that
> > doesn't work because it doesn't contain the version in its file name.
> > So we have to download the whole Yocto layer just to grab one source
> > file. Sigh.  
> 
> I had the exact same thought, but could not come up with a better solution.
> At least the meta-xilinx repo is still <1MB in size, so the download and
> extraction time is still in the noise for the overall build process.

Ah, it's only 1 MB, then fair enough.

> > What about using the vendor-agnostic OpenFPGALoader instead, packaged
> > as package/openfpgaloader/ ?  
> 
> I was not aware of this package.  Do you know how well it is maintained?

The Buildroot package I don't know, but the upstream OpenFPGALoader
package is very active, and well maintained. It is becoming the
de-facto open-source standard for FPGA programming.

> At the moment, I have two reasons for wanting to still support the
> xilinx-fpgautil package.
> 
> 1) The OpenFPGALoader does not seem to support Versal PDI files yet, so it
> would be incomplete for our needs.

Correct. My point was not to claim that it was right now a drop-in
replacement, but that it was another area where Xilinx could try to
leverage existing vendor-neutral projects rather than inventing
yet-another-vendor-specific-non-standard tool like vendors like to
usually do :-)

> 2) All the Xilinx documentation talks about the fpgautil program.  And on top
> of this, I had a discussion with one of my customers regarding the use of
> Buildroot vs Yocto, and their primary reason for why they felt they "had" to
> use Yocto is because it included this fpgautil program.  This is what
> triggered me to want to add it to Buildroot.  Especially since adding it is
> quite simple to do.

Understood.

> Perhaps we could create both packages, xilinx-fpgautil and the OpenFPGALoader?

OpenFPGALoader is already packaged in Buildroot. But yes, there's no
problem with having packages for both.

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
