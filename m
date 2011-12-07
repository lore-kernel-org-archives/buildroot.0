From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 7 Dec 2011 13:56:19 +0200
Subject: [Buildroot] [PATCH 1/1] Add new package libesmtp library for
 sending mail through smtp
In-Reply-To: <F1714CE52FFD41F7963A43CAB26BF2BC@JohanW7>
References: <F1714CE52FFD41F7963A43CAB26BF2BC@JohanW7>
Message-ID: <20111207115619.GA3306@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sagaert,

On Wed, Dec 07, 2011 at 11:37:07AM +0100, Sagaert Johan wrote:
> Add new package libesmtp  library for sending mail through smtp

You need to sign off your patches for them to be applied.

> diff -rupN buildroot-2011.11/package/libesmtp/Config.in
> buildroot-2011.11js/package/libesmtp/Config.in
> --- buildroot-2011.11/package/libesmtp/Config.in	1970-01-01
> 01:00:00.000000000 +0100
> +++ buildroot-2011.11js/package/libesmtp/Config.in	2011-12-03
> 20:20:00.000000000 +0100
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBESMTP
> +	bool "libesmtp"
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  Library for smtp mailing
> +	  
> +	  http://www.stafford.uklinux.net/libesmtp
> diff -rupN buildroot-2011.11/package/libesmtp/libesmtp.mk
> buildroot-2011.11js/package/libesmtp/libesmtp.mk
> --- buildroot-2011.11/package/libesmtp/libesmtp.mk	1970-01-01
> 01:00:00.000000000 +0100
> +++ buildroot-2011.11js/package/libesmtp/libesmtp.mk	2011-12-03
> 20:20:00.000000000 +0100
> @@ -0,0 +1,14 @@
> +#############################################################
> +#
> +# libesmtp
> +#
> +#############################################################
> +LIBESMTP_VERSION = 1.0.6
> +LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
> +LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
> +LIBESMTP_DEPENDENCIES = openssl
> +LIBESMTP_INSTALL_STAGING = YES
> +LIBESMTP_INSTALL_TARGET = YES

Not needed; this is the default.

> +#LIBESMTP_CONF_OPT = --disable-libftdipp --without-docs --with-examples

Why is this commented out?

> +
> +$(eval $(call AUTOTARGETS,package,libesmtp))

Current versions of Buildroot don't need those extra AUTOTARGETS parameters.  
Just do:

$(eval $(call AUTOTARGETS))

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
