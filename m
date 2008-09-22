From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 22 Sep 2008 12:49:40 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libconfuse
In-Reply-To: <20080922081105.960D6F8008@busybox.net>
References: <20080922081105.960D6F8008@busybox.net>
Message-ID: <48D77844.3040602@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jacmet at uclibc.org wrote:

<snipp>

> Added: trunk/buildroot/package/libconfuse/libconfuse.mk
> ===================================================================
> --- trunk/buildroot/package/libconfuse/libconfuse.mk	                        (rev 0)
> +++ trunk/buildroot/package/libconfuse/libconfuse.mk	2008-09-22 08:11:05 UTC (rev 23452)
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# libconfuse
> +#
> +#############################################################
> +LIBCONFUSE_VERSION:=2.6
> +LIBCONFUSE_SOURCE:=confuse-$(LIBCONFUSE_VERSION).tar.gz
> +LIBCONFUSE_SITE:=http://bzero.se/confuse/
> +LIBCONFUSE_AUTORECONF:=NO
> +LIBCONFUSE_INSTALL_STAGING:=YES
> +LIBCONFUSE_INSTALL_TARGET:=YES

Can be dropped, this is default.

> +LIBCONFUSE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
> +
> +LIBCONFUSE_CONF_OPT:=--enable-shared --disable-rpath $(DISABLE_NLS)
> +
> +LIBCONFUSE_DEPENDENCIES = uclibc

Can be dropped, this is default.

> +
> +$(eval $(call AUTOTARGETS,package,libconfuse))
> 

<snipp>

-- 
HC
