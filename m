From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 20:03:46 +0100
Subject: [Buildroot] [PATCH 06/13] libcec: new package
In-Reply-To: <af62c92a3e5c4bfce4ec2e5cb0bc587ff13cec0a.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <af62c92a3e5c4bfce4ec2e5cb0bc587ff13cec0a.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302212003.47612.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
> libCEC allows you in combination with the right hardware to control your device
> with your TV remote control. Utilising your existing HDMI cabling
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
[--SNIP--]
> diff --git a/package/libcec/Config.in b/package/libcec/Config.in
> new file mode 100644
> index 0000000..5051b94
> --- /dev/null
> +++ b/package/libcec/Config.in
> @@ -0,0 +1,30 @@
> +config BR2_PACKAGE_LIBCEC
> +	bool "libcec"
> +	select BR2_PACKAGE_LOCKDEV
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  libCEC allows you in combination with the right hardware to
> +	  control your device with your TV remote control. Utilising your
> +	  existing HDMI cabling.
> +	  
> +	  https://github.com/Pulse-Eight/libcec
> +
> +if BR2_PACKAGE_LIBCEC && BR2_arm
> +
> +config BR2_PACKAGE_LIBCEC_RBP
> +	bool "rpi support"
> +	depends on BR2_LARGEFILE
> +	depends on BR2_INSTALL_LIBSTDCPP

No need for 'depends on BR2_INSTALL_LIBSTDCPP', it's guaranteed by
the same depends on for the main symbol.

> +	select BR2_PACKAGE_RPI_USERLAND
> +	help
> +	  Enable RasberryPi support
> +
> +comment "rpi support requires a toolchain with LARGEFILE and C++ support"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_LARGEFILE)

Ditto, just mention LARGEFILE.

[--SNIP--]
> diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
> new file mode 100644
> index 0000000..2974cbf
> --- /dev/null
> +++ b/package/libcec/libcec.mk
> @@ -0,0 +1,22 @@
> +#############################################################
> +#
> +# libcec
> +#
> +#############################################################
> +
> +LIBCEC_VERSION = 89ea1724e7a4bde3f7a4f958b414889cefddb841
> +LIBCEC_SITE = http://github.com/Pulse-Eight/libcec/tarball/master
> +LIBCEC_INSTALL_STAGING = YES
> +LIBCEC_AUTORECONF = YES
> +LIBCEC_LICENSE = GPLv2

It's GPLv2+

(The rest of the series I'll look at after dinner. Hang on tight! ;-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
