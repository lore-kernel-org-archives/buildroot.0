From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 22:31:03 +0200
Subject: [Buildroot] [PATCH] opkg: bump version to svn r635
In-Reply-To: <1344666707-27833-1-git-send-email-net147@gmail.com>
References: <1344666707-27833-1-git-send-email-net147@gmail.com>
Message-ID: <20120811223103.3207ccf9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 11 Aug 2012 16:31:47 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> -OPKG_VERSION = 0.1.8
> +OPKG_VERSION = 635
>  OPKG_SOURCE = opkg-$(OPKG_VERSION).tar.gz
> -OPKG_SITE = http://opkg.googlecode.com/files
> +OPKG_SITE = http://opkg.googlecode.com/svn/trunk/
> +OPKG_SITE_METHOD = svn
>  OPKG_INSTALL_STAGING = YES
>  OPKG_CONF_OPT = --disable-curl --disable-gpg
>  
> +define OPKG_AUTOGEN
> +	cd $(@D) ; \
> +	./autogen.sh
> +endef
> +
> +OPKG_PRE_CONFIGURE_HOOKS += OPKG_AUTOGEN

This means that the package now depends on host-autoconf, host-automake
and probably host-libtool.

Can you try if setting OPKG_AUTORECONF = YES is sufficient instead of
this custom hook? If not, then of course, keep this hook and add the
necessary dependency on host tools.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
