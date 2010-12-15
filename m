From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Dec 2010 22:39:53 +0100
Subject: [Buildroot] [PATCH 1/2 v2] busybox: unify duplicated build steps
In-Reply-To: <1292173087-8806-1-git-send-email-vapier@gentoo.org>
References: <1292173087-8806-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101215223953.317bcb26@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Dec 2010 11:58:06 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

>  busybox-menuconfig:	$(BUSYBOX_DIR)/.stamp_extracted
> -	$(BUSYBOX_MAKE_ENV) $(MAKE) ARCH=$(KERNEL_ARCH) \
> -		CROSS_COMPILE="$(TARGET_CROSS)" -C $(BUSYBOX_DIR) menuconfig
> +	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) menuconfig
>  	rm -f $(BUSYBOX_DIR)/.stamp_built
>  	rm -f $(BUSYBOX_DIR)/.stamp_target_installed

Here you should keep -C $(BUSYBOX_DIR). We are not inside a package
_CMDS, so $(@D) is in fact the main Buildroot source directory, so
running make busybox-menuconfig starts the Buildroot menuconfig.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
