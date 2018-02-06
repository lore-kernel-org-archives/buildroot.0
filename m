From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 15:51:37 +0100
Subject: [Buildroot] [PATCH 2/4] linux: add custom linux logo
In-Reply-To: <1505819034-29610-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
 <1505819034-29610-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20180206155137.0b462c6c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Sep 2017 13:03:52 +0200, Angelo Compagnucci wrote:

> +config BR2_LINUX_KERNEL_CUSTOMLOGO
> +	bool "Kernel custom logo"
> +	select BR2_PACKAGE_CUSTOMLOGO
> +	help
> +	  Change the linux boot logo with your own graphics.
> +	  It can be used as an early bootsplash.
> +	  The file should be in kernel ppm format if the
> +	  option BR2_LINUX_KERNEL_CUSTOMLOGO_CONVERT is not
> +	  selected.
> +
> +config BR2_LINUX_KERNEL_CUSTOMLOGO_PATH
> +	string "Image file path"
> +	depends on BR2_LINUX_KERNEL_CUSTOMLOGO
> +	help
> +	  This image will be used as custom logo.
> +
> +config BR2_LINUX_KERNEL_CUSTOMLOGO_CONVERT
> +	bool "Convert custom logo to kernel format"
> +	depends on BR2_LINUX_KERNEL_CUSTOMLOGO
> +	help
> +	  If checked, the convert command will be run on the source
> +	  image file to obtain a kernel compatible ppm image file.

There are too many options here. We would like to have just one option:
BR2_LINUX_KERNEL_CUSTOMLOGO_PATH. If empty, nothing happens, if
non-empty, stuff happens.

Just do the "convert" call unconditionally, so we don't need the
BR2_LINUX_KERNEL_CUSTOMLOGO_CONVERT option.

Also, use CUSTOM_LOGO instead of CUSTOMLOGO.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
