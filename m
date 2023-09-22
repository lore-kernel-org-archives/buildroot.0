Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBE7E6FE32
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 13:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A7BC408A4;
	Fri, 22 Sep 2023 13:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A7BC408A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sR8TgN7aKbqv; Fri, 22 Sep 2023 13:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160BD408A5;
	Fri, 22 Sep 2023 13:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 160BD408A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BC0C1BF375
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 13:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73650405BE
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 13:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73650405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pvhk8NHGfiDP for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 13:57:40 +0000 (UTC)
X-Greylist: delayed 3855 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 22 Sep 2023 13:57:39 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B2494025D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B2494025D
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 13:57:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE490E0005;
 Fri, 22 Sep 2023 13:57:36 +0000 (UTC)
Date: Fri, 22 Sep 2023 15:57:35 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20230922155735.43ddc356@booty>
In-Reply-To: <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230922145236.027dc287@booty>
 <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695391057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DL0omPPS9locuuVkGG8bMUWiU+hK3XpCLw5ofPUle+o=;
 b=B7M6xK3XYFOaMFZB6sGX84SQajnJdSP58TLBrDpucz6XiOr9jj7PtkyYODh5ODB8pS1v3A
 ZmLHrErasDvKuOrrQ1Tir5SoEjiOPkZkXS6WHF1MfTbU1QySybPLv/k5HDXWlZhEq3z3NE
 vjBZuxf9bEblp5Xgmmyjx3ffuU+tpaywFpBYQqAewSD79j05GTx8kXpC0lNZyIGQnfb/xD
 blrq4QiURd46JSRBWrdy1JwXhF6wmm1amzSYvRPlOOyeXO7a0l9f4FFCLfUffiueUTyPPx
 5Y1JV3vhKQD94uC62ECSSpZYqh4giMOZ8UoUV/nBEtaL9ZOMOzcylWsx4w+qoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B7M6xK3X
Subject: Re: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Fri, 22 Sep 2023 13:34:58 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Luca,
> 
> > Hello Neal, Ibai,  
> 
> > thank you for your persistence in working on this!  
> 
> > The overall patch set appears pretty clean, except for a few remarks as you can read in this and the other replies.   
> 
> Thank you for the kind words.
> 
> > I had a small hiccup while trying to apply your patches using 'git am' from my inbox:  
> 
> >   error: cannot convert from y to UTF-8  
> 
> > This is probably due to this weird header value:  
> 
> >   Content-Type: text/plain; charset="y"  
> 
> > Probably some dirt in your git config. However the mbox file as downloaded from patchwork did apply without issues. I don't think you need to resend the series just for this.  
> 
> I will create a clean patch set with v4, so this should hopefully disappear.
> 
> 
> > This patch adds a new package for building binutils for a bare-metal toolchain.
> > The cpu architecture is defined by a toolchain-bare-metal virtual package.
> > While any cpu architecture could be used, the default configuration 
> > will be a Xilinx microblaze little endian architecture, so that 
> > buildroot will be able to build the microblaze firmware applications for zynqmp and versal.
> > 
> > When configured for the Xilinx microblaze architecture, all of the 
> > binutils patches that are applied to the Xilinx distributed toolchain 
> > will be applied in order to generate a toolchain that is equivalent to what Xilinx distributes.
> > 
> > Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
> > Signed-off-by: Neal Frager <neal.frager@amd.com>  
> 
> ...
> 
> > diff --git a/package/binutils-bare-metal/Config.in.host 
> > b/package/binutils-bare-metal/Config.in.host
> > new file mode 100644
> > index 0000000000..036698d418
> > --- /dev/null
> > +++ b/package/binutils-bare-metal/Config.in.host
> > @@ -0,0 +1,19 @@
> > +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> > +	bool "host binutils-bare-metal"
> > +	help
> > +	  binutils-bare-metal is a host utility for a
> > +	  bare-metal toolchain  
> 
> > "a host utility seems a bit of an understatement, I'd rather say "Build to GNU binutils for a bare-metal toolchain" to clarify this is building no less than the GNU binutils.  
> 
> I agree.  I will change this in v4.
> 
> > +
> > +if BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> > +
> > +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION
> > +	string
> > +	default "2.39"
> > +
> > +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_EXTRA_CONFIG_OPTIONS
> > +	string "Additional binutils options"
> > +	default ""
> > +	help
> > +	  Any additional binutils options you may want to include  
> 
> > Do we really want this without a valid use case?  
> 
> > The same question could apply to the _VERSION setting, however I feel it's reasonable to keep it...  
> 
> > This applies to patches 2 and 3 as well.  
> 
> My thought was that someone might want to add additional bare-metal options aside from the Xilinx microblaze target.
> 
> If not building binutils, gcc or newlib for microblaze, users might want to change the version and the config options used.
> 
> > diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk 
> > b/package/binutils-bare-metal/binutils-bare-metal.mk
> > new file mode 100644
> > index 0000000000..fd983abc93
> > --- /dev/null
> > +++ b/package/binutils-bare-metal/binutils-bare-metal.mk
> > @@ -0,0 +1,56 @@
> > +#####################################################################
> > +###########
> > +#
> > +# binutils-bare-metal
> > +#
> > +#####################################################################
> > +###########
> > +
> > +HOST_BINUTILS_BARE_METAL_VERSION = $(call 
> > +qstrip,$(BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION))
> > +ifeq ($(HOST_BINUTILS_BARE_METAL_VERSION),)
> > +HOST_BINUTILS_BARE_METAL_VERSION = 2.39 endif # BINUTILS_VERSION
> > +
> > +HOST_BINUTILS_BARE_METAL_SITE ?= $(BR2_GNU_MIRROR)/binutils 
> > +HOST_BINUTILS_BARE_METAL_SOURCE ?= 
> > +binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
> > +
> > +HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+ 
> > +HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB 
> > +HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
> > +
> > +HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
> > +
> > +# if toolchain is for microblazeel-xilinx, apply Xilinx patch set 
> > +ifeq 
> > +($(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH),"microblazeel-xilinx")  
> 
> > The toolchain-bare-metal is added in patch 4, thus this series as-is is not bisectable. I don't see any obvious solutions as toolchain-bare-metal selects binutils-bare-metal so I guess some maintainer can provide some hints on how to handle this.  
> 
> > The same issue applies to patches 2 and 3.  
> 
> Ok, I am not sure what to do with this feedback.

I'd say waiting for Buildroot maintainers feedback.

> > +HOST_BINUTILS_BARE_METAL_EXTRA_DOWNLOADS = 
> > +https://github.com/Xilinx/meta-xilinx/archive/refs/tags/xlnx-rel-v202
> > +3.1.tar.gz  
> 
> > This is not a huge download (500 kB compressed, 5.6 MB  uncompressed), but we use the binutils patches only, which account for 10% of the whole archive. I wonder whether there is a way to download only a subdirectory from github.  
> 
> > And looking at the patches themselves, I wonder how many are actually needed. At a cursory look, some don't really look like production code.
> > Are those changes being mainlined?  
> 
> Our initial plan was to make binutils and gcc versions that match the Xilinx software release as closely as possible.  This is why we just took the patch set blindly.
> 
> From my view, it is easier for me to maintain this if we either take all of the patches as is or none at all.

Agreed it is simpler to maintain, so this boils down to the question:
are those patches being actively mainlined? I have a sad feeling about
it as the number and overall quality of those patches seems the same I
saw more than an year ago.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
