From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 13 Nov 2017 23:12:08 +0300
Subject: [Buildroot] [PATCH/next 2/5] armada-ddr: new package
In-Reply-To: <20171113080000.twkales7r7helbfr@sapphire.tkos.co.il>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-3-geomatsi@gmail.com>
 <20171113080000.twkales7r7helbfr@sapphire.tkos.co.il>
Message-ID: <20171113201208.hekdh7iekpquvnkg@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > +################################################################################
> > +#
> > +# Marvell Armada DDR training code
> > +#
> > +################################################################################
> > +
> > +ARMADA_DDR_VERSION = $(call qstrip,$(BR2_TARGET_ARMADA_DDR_VERSION))
> 
> Here again, should be a static commit id.
> 
> > +ARMADA_DDR_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(ARMADA_DDR_VERSION))
> > +ARMADA_DDR_LICENSE = Proprietary
> 
> The few files I looked into each have a few optional license headings, 
> including a Commercial License, GPL-2.0+, GPL with exception, and BSD.
> 
> > +
> > +ARMADA_DDR_INSTALL_IMAGES  = YES
> > +
> > +define ARMADA_DDR_INSTALL_IMAGES_CMDS
> > +	$(INSTALL) -m 0755 -d $(DL_DIR)/mv-ddr-marvell
> > +	$(call suitable-extractor,$(notdir $(ARMADA_DDR_SOURCE))) \
> > +		$(DL_DIR)/$(notdir $(ARMADA_DDR_SOURCE)) | \
> > +		$(TAR) --strip-components=1 -C $(DL_DIR)/mv-ddr-marvell $(TAR_OPTIONS) -
> > +endef
> 
> Can't you use $(BUILD_DIR)/... for ATF, where mv-ddr-marvell source are 
> extracted anyway?

All noted and will be implemented in v2.

Thanks again for your thorough review !

Regards,
Sergey
