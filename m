From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 11:49:16 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target: linux u-boot
In-Reply-To: <20090126103804.AB33277458@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Mon\, 26 Jan 2009 10\:38\:03 +0000 \(UTC\)")
References: <20090126103804.AB33277458@busybox.osuosl.org>
Message-ID: <87myde9wb7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-26 10:38:00 +0000 (Mon, 26 Jan 2009)
 ulf> New Revision: 25048

 ulf> Log:
 ulf> Revert bad patch to fix linux rebuild problem

 ulf> -$(LINUX26_MKIMAGE_DIR)/mkimage:	$(MKIMAGE)
 ulf> +$(LINUX26_MKIMAGE_DIR)/mkimage:	u-boot
 ulf>  	mkdir -p $(LINUX26_MKIMAGE_DIR)
 ulf>  	cp $(MKIMAGE) $(LINUX26_MKIMAGE_DIR)

Having an actual filename depending on a phony target seems wrong -
This will always be rebuilt.
 
 ulf>  U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS)
 ulf> +#U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN)

Why? Seems like you just broke the tools stuff.
 
 ulf>  ifeq ($(strip $(subst ",,$(BR2_TARGET_UBOOT_DEFAULT_ENV))),y)
 ulf>  #"))
 ulf> @@ -289,7 +290,7 @@
 ulf>  #
 ulf>  #############################################################
 ulf>  ifeq ($(BR2_TARGET_UBOOT),y)
 ulf> -TARGETS+=u-boot
 ulf> +TARGETS+=u-boot mkimage

There afaik is no mkimage target.

Please fix.

-- 
Bye, Peter Korsgaard
