From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Feb 2014 12:51:39 +0100
Subject: [Buildroot] [PATCH v5 5/5] xbmc: new package
In-Reply-To: <1392332394-27935-6-git-send-email-maxime.hadjinlian@gmail.com>
References: <1392332394-27935-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392332394-27935-6-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140215115139.GB5291@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-02-13 23:59 +0100, Maxime Hadjinlian spake thusly:
> XBMC is an award-winning free and open source (GPL) software media player and
> entertainment hub for digital media.

Just a quick comment before I forget...
Hopefully I'll have some more time for a proper review later today...

[--SNIP--]
> +config BR2_PACKAGE_XBMC_LIBCEC_RBP
> +	bool "rpi support"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_LARGEFILE
> +	select BR2_PACKAGE_RPI_USERLAND
> +	select BR2_PACKAGE_LIBCEC_RBP

git grep BR2_PACKAGE_LIBCEC_RBP
--> nothing... ?

> +	help
> +	  Enable RasberryPi support
> +
> +comment "rpi support requires a toolchain with C++ and LARGEFILE support"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_LARGEFILE)
> +
> +endif

If rpi-userland is selected, then just assume RPi support is wanted.
This should get rid of the circular dependency on EGL/GLES you mentioned
later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
