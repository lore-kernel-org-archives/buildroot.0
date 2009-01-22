From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 22 Jan 2009 22:17:57 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
In-Reply-To: <20090122110159.E9877765E9@busybox.osuosl.org>
References: <20090122110159.E9877765E9@busybox.osuosl.org>
Message-ID: <200901222217.57888.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

laird at uclibc.org, 22.01.2009:
> Author: laird
> Date: 2009-01-22 11:01:56 +0000 (Thu, 22 Jan 2009)
> New Revision: 24960
> 
> Log:
> package/multimedia/gst-plugins-good/Config.in
> package/multimedia/gst-plugins-good/gst-plugins-good.mk

It probably doesn't make sense to include the filenames in the commit
message, let alone full paths. The VCS knows them anyway.

> +ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PNG),y)
> +GST_PLUGINS_GOOD_CONF_OPT += --enable-png
> +GST_PLUGINS_GOOD_DEPENDENCIES += libpng
> +else
> +GST_PLUGINS_GOOD_CONF_OPT += --disable-png
> +endif

I just saw this in configure:
  --disable-libpng             disable Portable Network Graphics library: png

libpng instead of png


Also, please keep the order of the config options identically between
the files for Kconfig and Make.
In Config.in you have : jpeg, png, bz2, zlib
In gst-plugins-good.mk: bz2, zlib, jpeg, png

With this big amount of options, it could get distracting, when
extending the package or searching for bugs.

Markus
