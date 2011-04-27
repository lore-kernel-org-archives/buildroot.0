From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 27 Apr 2011 14:51:55 +0200
Subject: [Buildroot] [PATCH] libnl: bump to version 2.0
In-Reply-To: <87liywylxb.fsf@macbook.be.48ers.dk>
References: <4DB7D29E.5000101@visionsystems.de>
	<87liywylxb.fsf@macbook.be.48ers.dk>
Message-ID: <4DB8116B.901@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Out of interest, how did you create this patch? It doesn't have the nice
> diffstat overview like git format-patch normally creates.

Just quilt :-) I'm working with various version control systems, so quilt is a versatile tool for me. But the patch could be applied without any problems?

>  Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>  Yegor> Index: b/package/libnl/libnl.mk
>  Yegor> ===================================================================
>  Yegor> --- a/package/libnl/libnl.mk	2011-04-26 02:04:14.206276675 -0700
>  Yegor> +++ b/package/libnl/libnl.mk	2011-04-26 03:29:21.934275959 -0700
>  Yegor> @@ -4,10 +4,11 @@
>  Yegor>  #
>  Yegor>  #############################################################
>  
>  Yegor> -LIBNL_VERSION = 1.1
>  Yegor> +LIBNL_VERSION = 2.0
>
> I see there's already a libnl-3.0, is there any reason why you stick
> with 2.0?

You're right. I first tried 3.0 and it failed by some package, so I took 2.0 and didn't verify what was wrong. But I just checked the 3.0 version and it works with all 5 packages:

wpa_supplicant
iw
hostapd
kismet
ti-utils

>  Yegor>  LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
>  Yegor> -LIBNL_SITE = http://distfiles.gentoo.org/distfiles
>  Yegor> +LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
>  Yegor>  LIBNL_INSTALL_STAGING = YES
>  Yegor> +LIBNL_AUTORECONF = YES
>
> Why? You don't seem to be patching any auto* stuff?

We don't need it. I had a problem compiling it under Ubuntu without reconfiguring, but with buildroot under Ubuntu I have no problem.

Thanks for reviewing.

Best regards,
Yegor
