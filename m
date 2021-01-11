From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:29:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/gkrellm: new package
In-Reply-To: <20200502100635.3520066-1-bernd.kuhls@t-online.de>
References: <20200502100635.3520066-1-bernd.kuhls@t-online.de>
Message-ID: <20210111212930.4891f683@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 May 2020 12:06:35 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> +config BR2_PACKAGE_GKRELLM_SERVER
> +	bool "daemon"

Changed to "server" to match the option name.

> +	help
> +	  Enable gkrellm daemon.

Ditto.

> +config BR2_PACKAGE_GKRELLM_CLIENT
> +	bool "client"
> +	depends on BR2_PACKAGE_XORG7 # libgtk2
> +	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
> +	select BR2_PACKAGE_LIBGTK2
> +	select BR2_PACKAGE_XLIB_LIBSM
> +	help
> +	  Enable gkrellm client.
> +
> +comment "client depends on X.org and needs a toolchain w/ C++, gcc >= 4.8"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_PACKAGE_XORG7
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

We generally don't have a comment about the X.org dependency, so I
change the prompt to just:

comment "client needs a toolchain w/ C++, gcc >= 4.8"

Applied with those minor changes. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
