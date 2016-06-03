From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 19:58:43 +0200
Subject: [Buildroot] [PATCHv2] package/omxplayer: new package
In-Reply-To: <1462183798-2578-1-git-send-email-yann.morin.1998@free.fr>
References: <1462183798-2578-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160603195843.3fa2cfaf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 May 2016 12:09:58 +0200, Yann E. MORIN wrote:
> +config BR2_PACKAGE_OMXPLAYER
> +	bool "omxplayer"
> +	depends on BR2_arm
> +	depends on BR2_USE_MMU # dbus
> +	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
> +	depends on BR2_INSTALL_LIBSTDCPP # boost
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libusb
> +	depends on BR2_USE_WCHAR # boost
> +	depends on BR2_PACKAGE_RPI_USERLAND
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_FFMPEG

There is a FFMPEG_ARCH_SUPPORTS Config.in option now, so I've added
this dependency, and applied your patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
