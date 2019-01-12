From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 17:52:42 +0100
Subject: [Buildroot] [PATCH 3/3] boot: add shim EFI bootloader for
 secure boot chain loading
In-Reply-To: <20190111100111.17867-3-peter@korsgaard.com>
References: <20190111100111.17867-1-peter@korsgaard.com>
 <20190111100111.17867-3-peter@korsgaard.com>
Message-ID: <20190112175242.4b1e3125@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Jan 2019 11:01:11 +0100, Peter Korsgaard wrote:
> While gnu-efi supports 32bit ARM, this is currently broken in shim.
> 
> Patches to fix this have been submitted upstream but are not included here
> for now.
> 
> https://github.com/rhboot/shim/pull/162
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I've changed the title to:

	boot/shim: new package

and moved the description of what it is inside the commit log.

> diff --git a/boot/shim/Config.in b/boot/shim/Config.in
> new file mode 100644
> index 0000000000..15d50e3c82
> --- /dev/null
> +++ b/boot/shim/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_TARGET_SHIM
> +	bool "shim"
> +	depends on BR2_aarch64 || BR2_aarch64_be || \
> +		BR2_i386 || BR2_x86_64 # gnu-efi

In a separate patch, I introduced BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS,
and used that here + added a separate depends on !BR2_ARM_CPU_HAS_ARM
to cope with the ARM32 build issue.

Some support/testing/ test case would be good to have though :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
