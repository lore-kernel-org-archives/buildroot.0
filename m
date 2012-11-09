From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Nov 2012 14:20:44 +0100
Subject: [Buildroot] [PATCH 1/2] neard: new package
In-Reply-To: <1352459105-13590-2-git-send-email-spdawson@gmail.com>
References: <1352459105-13590-1-git-send-email-spdawson@gmail.com>
 <1352459105-13590-2-git-send-email-spdawson@gmail.com>
Message-ID: <20121109142044.09933dfa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri,  9 Nov 2012 11:05:04 +0000, spdawson at gmail.com wrote:

> diff --git a/package/neard/Config.in b/package/neard/Config.in
> new file mode 100644
> index 0000000..f973fdd
> --- /dev/null
> +++ b/package/neard/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_NEARD
> +	bool "neard"
> +	depends on BR2_LINUX_KERNEL

Why this dependency?

> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBNL
> +	help
> +	  Near Field Communication (NFC) manager

A slightly longer description would be useful here.

> +
> +	  http://git.kernel.org/?p=network/nfc/neard.git;a=summary
> +
> +	  https://01.org/linux-nfc/documentation/how-start-linux-nfc-code...

Those "..." at the end look strange.

> diff --git a/package/neard/neard.mk b/package/neard/neard.mk
> new file mode 100644
> index 0000000..3d73932
> --- /dev/null
> +++ b/package/neard/neard.mk
> @@ -0,0 +1,16 @@
> +#############################################################
> +#
> +# neard
> +#
> +#############################################################
> +NEARD_VERSION = 0.7
> +NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
> +NEARD_INSTALL_STAGING = YES
> +NEARD_LICENSE = GPLv2
> +NEARD_LICENSE_FILES = COPYING
> +
> +NEARD_DEPENDENCIES = linux dbus libglib2 libnl
> +NEARD_AUTORECONF = YES

The package does not have any patches, and is downloaded from a
tarball. Why is an autoreconf needed?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
