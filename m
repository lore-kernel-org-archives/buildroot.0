From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 7 Dec 2011 19:08:38 +0100
Subject: [Buildroot] [PATCH 1/1] Add new package libesmtp library for
	sending mail through smtp
Message-ID: <7C210CCA3C124B7FB06370BFEC377B72@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

The commented line seems to be a leftover when I added this package last
year, didn't notice it when posting.

About the autotargets parameters, I was not aware this changed, its a patch 
i made several versions of buildroot earlier, and now that I have updated to
2011.11 I decided to mail it to the mailing list.

Signing off ? 
I saw these kind of sentences in mails, but nobody told me before, is 
there some specific format I need to use ? 
(as a line before the actual patch text ?

Johan

Btw: something is wrong with baruch at tkos.co.il: response from the smtp:
The following message to <baruch@tkos.co.il> was undeliverable.
The reason for the problem:
5.1.0 - Unknown address error 550-'5.7.1 <baruch@tkos.co.il>... Rejected
recent spam source [mailrelay011.isp.belgacom.be] Reply at
http://tk-open-systems.com/unblockme/index.php?id=tango'

-----Oorspronkelijk bericht-----
Van: Baruch Siach [mailto:baruch at tkos.co.il] 
Verzonden: woensdag 7 december 2011 12:56
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1] Add new package libesmtp library for
sending mail through smtp

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
