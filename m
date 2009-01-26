From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 12:40:35 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target: linux u-boot
In-Reply-To: <87myde9wb7.fsf@macbook.be.48ers.dk>
References: <20090126103804.AB33277458@busybox.osuosl.org>
	<87myde9wb7.fsf@macbook.be.48ers.dk>
Message-ID: <1232970035.2298.70.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 11:49 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-26 10:38:00 +0000 (Mon, 26 Jan 2009)
>  ulf> New Revision: 25048
> 
>  ulf> Log:
>  ulf> Revert bad patch to fix linux rebuild problem
> 
>  ulf> -$(LINUX26_MKIMAGE_DIR)/mkimage:	$(MKIMAGE)
>  ulf> +$(LINUX26_MKIMAGE_DIR)/mkimage:	u-boot
>  ulf>  	mkdir -p $(LINUX26_MKIMAGE_DIR)
>  ulf>  	cp $(MKIMAGE) $(LINUX26_MKIMAGE_DIR)
> 
> Having an actual filename depending on a phony target seems wrong -
> This will always be rebuilt.
>  
>  ulf>  U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS)
>  ulf> +#U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN)
> 
> Why? Seems like you just broke the tools stuff.

As of yesterday part of linux26 is always rerun when you
do a make, and that was because of mkimage.
Tried to fix, but the fix worked only because
of things already built.


>  ulf>  ifeq ($(strip $(subst ",,$(BR2_TARGET_UBOOT_DEFAULT_ENV))),y)
>  ulf>  #"))
>  ulf> @@ -289,7 +290,7 @@
>  ulf>  #
>  ulf>  #############################################################
>  ulf>  ifeq ($(BR2_TARGET_UBOOT),y)
>  ulf> -TARGETS+=u-boot
>  ulf> +TARGETS+=u-boot mkimage
> 
> There afaik is no mkimage target.
> 
> Please fix.

I removed that, the u-boot and linux directories
and reran make linux26 which seems to build and install.
Will have to run more tests to avoid the copy above and
the rebuild of linux.

BR
Ulf Samuelsson


> 
