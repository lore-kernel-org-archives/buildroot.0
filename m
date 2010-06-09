From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jun 2010 09:51:03 +0200
Subject: [Buildroot] [PATCH 46/46] Add support for the Barebox bootloader
In-Reply-To: <1ddd7a4eb24fe0dd428a3b71f98549560474937c.1275343448.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 1 Jun 2010 00:08:32 +0200")
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<1ddd7a4eb24fe0dd428a3b71f98549560474937c.1275343448.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ljaohcew.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# Barebox
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +
 Thomas> +BAREBOX_VERSION:=2010.05.0
 Thomas> +BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
 Thomas> +BAREBOX_SITE:=http://www.barebox.org/download/
 Thomas> +BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
 Thomas> +BAREBOX_CAT:=$(BZCAT)
 Thomas> +BAREBOX_BOARD_DEFCONFIG:=$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
 Thomas> +
 Thomas> +ifeq ($(ARCH),i386)
 Thomas> +BAREBOX_ARCH=x86
 Thomas> +else ifeq ($(ARCH),powerpc)
 Thomas> +BAREBOX_ARCH=ppc
 Thomas> +else
 Thomas> +BAREBOX_ARCH=$(ARCH)
 Thomas> +endif

This should afaik use KERNEL_ARCH rather than arch (E.G. with i?x86
converted into i386) - Similar to how it's done for u-boot.

 Thomas> +
 Thomas> +BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE=$(TARGET_CROSS)
 Thomas> +
 Thomas> +$(DL_DIR)/$(BAREBOX_SOURCE):
 Thomas> +	 $(call DOWNLOAD,$(BAREBOX_SITE),$(BAREBOX_SOURCE))
 Thomas> +
 Thomas> +$(BAREBOX_DIR)/.unpacked: $(DL_DIR)/$(BAREBOX_SOURCE)
 Thomas> +	$(BAREBOX_CAT) $(DL_DIR)/$(BAREBOX_SOURCE) \
 Thomas> +		| tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 Thomas> +	mkdir -p $(BAREBOX_DIR)

What's the point of that mkdir?

-- 
Bye, Peter Korsgaard
