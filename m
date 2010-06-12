From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:16:58 +0200
Subject: [Buildroot] [PATCH 46/46] Add support for the Barebox bootloader
In-Reply-To: <87ljaohcew.fsf@macbook.be.48ers.dk>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<1ddd7a4eb24fe0dd428a3b71f98549560474937c.1275343448.git.thomas.petazzoni@free-electrons.com>
	<87ljaohcew.fsf@macbook.be.48ers.dk>
Message-ID: <20100612161658.32baa4ba@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 09 Jun 2010 09:51:03 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> This should afaik use KERNEL_ARCH rather than arch (E.G. with i?x86
> converted into i386) - Similar to how it's done for u-boot.

Ok, done.

>  Thomas> +
>  Thomas> +BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH)
>  Thomas> CROSS_COMPILE=$(TARGET_CROSS) +
>  Thomas> +$(DL_DIR)/$(BAREBOX_SOURCE):
>  Thomas> +	 $(call DOWNLOAD,$(BAREBOX_SITE),$(BAREBOX_SOURCE))
>  Thomas> +
>  Thomas> +$(BAREBOX_DIR)/.unpacked: $(DL_DIR)/$(BAREBOX_SOURCE)
>  Thomas> +	$(BAREBOX_CAT) $(DL_DIR)/$(BAREBOX_SOURCE) \
>  Thomas> +		| tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>  Thomas> +	mkdir -p $(BAREBOX_DIR)
> 
> What's the point of that mkdir?

No point, and I've switched to the "strip one component path" method
that we use for most/all packages.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
