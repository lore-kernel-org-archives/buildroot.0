From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 11:31:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/mfoc: new package
In-Reply-To: <20191220181456.24733-1-aussedat.louis@gmail.com>
References: <20191220181456.24733-1-aussedat.louis@gmail.com>
Message-ID: <20191222103108.GU26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Louis, All,

On 2019-12-20 19:14 +0100, Louis Aussedat spake thusly:
> Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
[--SNIP--]
> diff --git a/package/mfoc/Config.in b/package/mfoc/Config.in
> new file mode 100644
> index 0000000000..4773e456e0
> --- /dev/null
> +++ b/package/mfoc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_MFOC
> +	bool "mfoc"
> +    select BR2_PACKAGE_LIBNFC

Leading TAB, not sapces; run:  make check-package

I've applied with this fixed, thanks.

Regards,
Yann E. MORIN.

> +	help
> +	  Mifare Classic Offline Cracker
> +
> +	  https://github.com/nfc-tools/mfoc
> diff --git a/package/mfoc/mfoc.hash b/package/mfoc/mfoc.hash
> new file mode 100644
> index 0000000000..2358bfd3e0
> --- /dev/null
> +++ b/package/mfoc/mfoc.hash
> @@ -0,0 +1,3 @@
> +# locally computed
> +sha256  2dfd8ffa4a8b357807680d190a91c8cf3db54b4211a781edc1108af401dbaad7  mfoc-0.10.7.tar.gz
> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/mfoc/mfoc.mk b/package/mfoc/mfoc.mk
> new file mode 100644
> index 0000000000..15105a74ab
> --- /dev/null
> +++ b/package/mfoc/mfoc.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# mfoc
> +#
> +################################################################################
> +
> +MFOC_VERSION = 0.10.7
> +MFOC_SITE = $(call github,nfc-tools,mfoc,mfoc-$(MFOC_VERSION))
> +MFOC_LICENSE = GPL-2.0
> +MFOC_LICENSE_FILES = COPYING
> +MFOC_DEPENDENCIES = libnfc
> +# Fetching from github, we need to generate the configure script
> +MFOC_AUTORECONF = YES
> +MFOC_INSTALL_STAGING = YES
> +
> +# Autoreconf requires an existing m4 directory
> +define MFOC_MKDIR_M4
> +	mkdir -p $(@D)/m4
> +endef
> +MFOC_PRE_CONFIGURE_HOOKS += MFOC_MKDIR_M4
> +
> +$(eval $(autotools-package))
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
