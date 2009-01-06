From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 15:26:54 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <20090106141628.5859776BFE@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Tue\, 6 Jan 2009 14\:16\:28 +0000 \(UTC\)")
References: <20090106141628.5859776BFE@busybox.osuosl.org>
Message-ID: <87r63gqzm9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-06 14:16:27 +0000 (Tue, 06 Jan 2009)
 ulf> New Revision: 24697

 ulf> Log:
 ulf> Use PROJECT-u-boot-VERSION-DATE.bin as u-boot target
 ulf> Provide link using "u-boot.bin"

Ohh, didn't we just discuss it? I don't think this belongs in
buildroot.

If you really want it, couldn't you then do it in you
copy-to-tftp-thingy?
 
 ulf> +menuconfig BR2_TARGET_UBOOT_DEFAULT_ENV
 ulf> +	bool "Generate a default environment"
 ulf> +	default n
 ulf> +	depends on BR2_TARGET_UBOOT
 ulf> +	help

default n is implied, so don't add that.
Isn't this all within the if BR2_TARGET_UBOOT section, so you don't
need the depends?

 ulf> -	echo setenv linux $(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE).gz >> $(U_BOOT_AUTOSCRIPT)
 ulf> +	echo setenv linux $(LINUX26_KERNEL_NAME).gz >> $(U_BOOT_AUTOSCRIPT)

Why .gz?

 ulf>  	echo setenv kernel-version $(LINUX26_VERSION) >> $(U_BOOT_AUTOSCRIPT)
 ulf>  	echo setenv kernel-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
 ulf>  	echo setenv hostname $(TARGET_HOSTNAME) >> $(U_BOOT_AUTOSCRIPT)
 ulf>  	echo setenv fs-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
 ulf> -	echo setenv rd-1 rootfs.$(BR2_ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
 ulf> -	echo setenv rd-2 rootfs.$(BR2_ARCH)-$(DATE).jffs2 >> $(U_BOOT_AUTOSCRIPT)
 ulf> +	echo setenv rd-1 rootfs.$(ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
 ulf> +	echo setenv rd-2 rootfs.$(ARCH)-$(DATE).jffs2 >> $(U_BOOT_AUTOSCRIPT)

Why .ext2 and .jffs2? This doesn't seem very generic.

Please fix.

-- 
Bye, Peter Korsgaard
