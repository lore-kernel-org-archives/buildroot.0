Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED5EC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 14:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D6F61AE8;
	Tue, 21 Jan 2025 14:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSY6ApWbFUk3; Tue, 21 Jan 2025 14:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47761607C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47761607C0;
	Tue, 21 Jan 2025 14:42:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8080D7
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 14:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6EDD80E1B
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 14:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rr4QFSnM1aph for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 14:42:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13ADF80E78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13ADF80E78
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13ADF80E78
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 14:42:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90C50C000E;
 Tue, 21 Jan 2025 14:42:31 +0000 (UTC)
Date: Tue, 21 Jan 2025 15:42:30 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20250121154230.44002ead@booty>
In-Reply-To: <SA1PR12MB5615DB0649E75B9C9349F308F0E62@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250120113405.3938838-1-neal.frager@amd.com>
 <20250120113405.3938838-2-neal.frager@amd.com>
 <20250120183321.2dd343a9@booty>
 <SA1PR12MB5615DB0649E75B9C9349F308F0E62@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737470552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bTWA2aO39Lcde2oZj6SGuSiSL1pnJ50/uHyQY6w4Ywc=;
 b=IX0ac6Zo6IN/ejRlUaagrmbkBizmgrA++lHsVx/JwFoDCEFFS06oa0Yt42vu9CBYm295em
 Wqz5A23Waf5UQimGCnMkUdn5X7fVUDGN4cgGUGThFRyQ+rdkZy1e0OFZxECOZpQI2tL4m0
 R54sqLcflqBYXYkJeoEbIJ8ib/oGRMpCnslGQDYtc0NnEXH1bE0QhyJFiOCgeIIL5DVG5s
 qPhU38VBmRqBRfpopvzhhMLkKIhCaewcsdr5F7riKElX3W5uY2OGEJGUa2mXTNad/UvCNe
 Bqyl2fm6lT7eo1eZE5i3nijeAI5mo0ACYEzMV0hp4sKeFcqTl9hR8EVI0+gFUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IX0ac6Zo
Subject: Re: [Buildroot] [PATCH v2 2/4] boot/uboot.mk: new zynqmp pmufw
 embeddedsw option
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

Hi Neal,

On Tue, 21 Jan 2025 08:40:33 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hello Luca,
> 
> > The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option will enable u-boot to
> > use the xilinx-embeddedsw package for building a pmufw.elf that gets included
> > in the generated boot.bin.
> > 
> > If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option is enabled, then the
> > BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw from a
> > custom location will be ignored.
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> > V1->V2:
> > - edited Config.in help text to fit within 70 characters
> > ---
> >  boot/uboot/Config.in | 27 +++++++++++++++++++++++++++
> >  boot/uboot/uboot.mk  |  5 ++++-
> >  2 files changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index b6ac2f9380..430191d213 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -572,6 +572,27 @@ config BR2_TARGET_UBOOT_ZYNQMP
> >  
> >  if BR2_TARGET_UBOOT_ZYNQMP
> >  
> > +choice
> > +	prompt "xilinx-prebuilt pmufw.elf or build pmufw.elf from source"  
> 
> > Not a very clear string IMO, it should not list the options in the
> > choice title. I'd rather change it to "PMUFW origin".  
> 
> Agreed, thanks!
> 
> > +	default BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
> > +	help
> > +	  Choose between installing the pmufw.elf from
> > +	  xilinx-prebuilt or building the pmufw.elf from
> > +	  xilinx-embeddedsw.
> > +
> > +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
> > +	bool "xilinx-embeddedsw build pmufw.elf from source"  
> 
> > And I'd change this to "Build from source via xilinx-embeddedsw"  
> 
> Ok, works for me.
> 
> > +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> > +	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW  
> 
> > Not sure what is best here:  
> 
> > a) if xilinx-embeddedsw is enabled, show the option in the choice menu
> > b) if the choice is selected in the menu, enable xilinx-embeddedsw  
> 
> > a) is what you implemented, b) is what I had in mind before reading
> > this patch and it would look more intuitive for users I think. The same
> > applies for the xilinx-prebuilt option.  
> 
> > Opinions from Buildroot maintainers would be welcome here.  
> 
> I thought about this as well.  Unfortunately, option b is more complicated
> than just enabling xilinx-embeddedsw or xilinx-prebuilt.  Not only do the
> zynqmp options in either package also need to be enabled, but in the case
> of xilinx-embeddedsw, the toolchain-bare-metal-buildroot also needs to be
> enabled along with configuring the tupple to microblaze.

That's true.

> Since I do not think enabling all these options in other packages
> automatically from the uboot config is very clean, I think it is best we
> stay with option a.
> 
> To go along with option a, I like your idea of making the choice three
> options as you speak of later on in this email.  For options not enabled,
> I would like to add a comment in the choice menu informing the user of
> what they need to enable to make the option available.  I think this is
> a better solution.

Adding the comments looks like a good idea, e.g. "Building the PMUFW
from source needs xilinx-embeddedsw"

> And since the custom pmufw location option is the only one not dependent
> on another Buildroot package, I would recommend having it being the
> default choice, since it will always be available.
> 
> > +	help
> > +	  Use xilinx-embeddedsw boot package for building
> > +	  zynqmp pmufw.elf from
> > +	    https://github.com/Xilinx/embeddedsw repo.
> > +
> > +	  U-Boot build process will generate a boot.bin (to be loaded
> > +	  by the ZynqMP boot ROM) containing both the U-Boot SPL and
> > +	  the PMU firmware in the Xilinx-specific boot format.
> > +
> >  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> >  	bool "xilinx-prebuilt pmufw.elf"  
> 
> > And this to "Prebuilt via xilinx-prebuilt"  
> 
> Ok, sounds good to me.
> 
> >  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> > @@ -585,9 +606,15 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> >  	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
> >  	  PMU firmware in the Xilinx-specific boot format.
> >  
> > +endchoice
> > +
> > +comment "If xilinx-embeddedsw or xilinx-prebuilt is selected for pmufw.elf, custom PMU firmware location will be ignored."
> > +	depends on BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW || BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT  
> 
> > This is not needed. If any of those two is selected,
> > BR2_TARGET_UBOOT_ZYNQMP_PMUFW will not be visible. The commit message
> > needs to be updated accordingly. See below however.  
> 
> Agreed.  Making this a three way choice is the best option.
> 
> >  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> >  	string "Custom PMU firmware location"
> >  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> > +	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
> >  	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT  
> 
> > I think BR2_TARGET_UBOOT_ZYNQMP_PMUFW should become a third option in
> > the choice you are adding above. In other words we should ask users
> > "How do you want to get the pmufw? Build from source, download from
> > xilinx-prebuilt or pre-built at a custom location you provide?".  
> 
> I agree with the three option choice idea.  I had not thought of it earlier
> because choice options need to be boolean as far as I am aware.
> 
> To make this possible, I am thinking of adding the third choice as:
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM
>     bool "Prebuilt from custom location"
> 
> And then the BR2_TARGET_UBOOT_ZYNQMP_PMUFW would stay the same as before
> with just having a dependency on BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM.
> 
> What do you think?

I think it is fine.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
