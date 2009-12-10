From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Dec 2009 16:28:48 +0100
Subject: [Buildroot] [PATCH 1/6] Added libcdaudio package (dependency of
	gst-plugins-bad)
In-Reply-To: <1258065198-22972-2-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Thu, 12 Nov 2009 23:33:13 +0100")
References: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
	<1258065198-22972-2-git-send-email-llandwerlin@gmail.com>
Message-ID: <87iqcevoen.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

Committed with minor changes, thanks!

 llandwerlin> +config BR2_PACKAGE_LIBCDAUDIO
 llandwerlin> +	bool "libcdaudio"
 llandwerlin> +	help
 llandwerlin> +	  libcdaudio is a library designed to provide functions to
 llandwerlin> +	  control operation of a CD-ROM when playing audio CDs. It
 llandwerlin> +	  also contains functions for CDDB and CD Index lookup.


We normally add the upstream URL here.

 llandwerlin> diff --git a/package/multimedia/libcdaudio/libcdaudio.mk b/package/multimedia/libcdaudio/libcdaudio.mk
 llandwerlin> new file mode 100644
 llandwerlin> index 0000000..f05b532
 llandwerlin> --- /dev/null
 llandwerlin> +++ b/package/multimedia/libcdaudio/libcdaudio.mk
 llandwerlin> @@ -0,0 +1,15 @@
 llandwerlin> +#############################################################
 llandwerlin> +#
 llandwerlin> +# libcdaudio
 llandwerlin> +#
 llandwerlin> +#############################################################
 llandwerlin> +
 llandwerlin> +LIBCDAUDIO_VERSION = 0.99.12p2
 llandwerlin> +LIBCDAUDIO_SOURCE = libcdaudio-$(LIBCDAUDIO_VERSION).tar.gz
 llandwerlin> +LIBCDAUDIO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)/
 llandwerlin> +LIBCDAUDIO_AUTORECONF = YES
 llandwerlin> +LIBCDAUDIO_LIBTOOL_PATCH = YES
 llandwerlin> +LIBCDAUDIO_INSTALL_STAGING = YES
 llandwerlin> +LIBCDAUDIO_INSTALL_TARGET = YES
 llandwerlin> +
 llandwerlin> +$(eval $(call AUTOTARGETS,package,libcdaudio))

The package directory you're using is package/multimedia.

-- 
Bye, Peter Korsgaard
