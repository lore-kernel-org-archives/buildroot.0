From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Mar 2012 20:21:09 +0100
Subject: [Buildroot] New package lcdproc
In-Reply-To: <CAHt8ZCONKjxYVWrGaKwfn-1ruDJMV-yyCTLPyE=JZ946Qo5vfQ@mail.gmail.com>
References: <CAHt8ZCPGCi-3jXKAjnjdbYq97=2se1c3YjDc18V27QEA7Mcq0Q@mail.gmail.com>
 <CAHt8ZCONKjxYVWrGaKwfn-1ruDJMV-yyCTLPyE=JZ946Qo5vfQ@mail.gmail.com>
Message-ID: <20120307202109.30f9c625@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please add your Signed-off-by line in the commit log.

Le Wed, 7 Mar 2012 18:05:17 +0000,
Simon Dawson <spdawson@gmail.com> a ?crit :

> +++ b/package/lcdproc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LCDPROC
> +	bool "lcdproc"
> +	select BR2_PACKAGE_NCURSES
> +	help
> +	LCD display driver daemon and clients

Indentation for the help text should be one tab + two spaces.

> diff --git a/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
> b/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
> new file mode 100644
> index 0000000..f5702ff
> --- /dev/null
> +++ b/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
> @@ -0,0 +1,11 @@
> +--- lcdproc-0.5.3/LCDd.conf.orig	2009-06-20
> 14:48:34.000000000 +0100 ++++ lcdproc-0.5.3/LCDd.conf
> 2010-05-11 10:02:21.000000000 +0100 +@@ -34,7 +34,7 @@

For all patches, we require a description and a signed-off-by line.

> --- /dev/null
> +++ b/package/lcdproc/lcdproc.mk
> @@ -0,0 +1,16 @@
> +#############################################################
> +#
> +# lcdproc
> +#
> +#############################################################
> +LCDPROC_VERSION = 0.5.5
> +
> +LCDPROC_AUTORECONF = YES

Do you have a good reason to do this ?

I am surprised to not site any URL for the tarball. Is it because the
tarball is available from Sourceforge (which is the default download
location when no other URL is specified) ?

> +LCDPROC_INSTALL_STAGING = NO
> +LCDPROC_INSTALL_TARGET = YES

You can get rid of those lines, they are the default values.

> +LCDPROC_CONF_OPT = --enable-drivers=all
> +
> +LCDPROC_DEPENDENCIES = uclibc ncurses

The 'uclibc' dependencies is unnecessary. You have the guarantee that
the toolchain has been built and the C library installed before any
package gets built.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
