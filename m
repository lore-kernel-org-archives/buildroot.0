From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 16 May 2012 00:33:04 +0200
Subject: [Buildroot] (newbie question)
In-Reply-To: <CAFC29aVzYKupB7RKHOL1kiUOC6C=ySGdO9XzGvG5FAvo4pnLkw@mail.gmail.com>
References: <CAFC29aU6nfLkHpbs1mKhV13aVdtskqtKtCpURpzi-gQErviriQ@mail.gmail.com>
 <20120515224254.6bff263a@skate>
 <CAFC29aUwvGS-tsbLiCe7=7W1HZ0UZ409BMhf5Y73r289FSuNUA@mail.gmail.com>
 <4FB2CADD.9040001@mind.be>
 <CAFC29aVzYKupB7RKHOL1kiUOC6C=ySGdO9XzGvG5FAvo4pnLkw@mail.gmail.com>
Message-ID: <CAHXCMMLgXCPx9KntwEktSwHbgB34-MeLvgZLu1ifS0zD9Dd+0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ron, all,

See my comments hereafter.
Most of them are about misspellings.

Hope this will make it work ;-)


> Yep, Thanks Arnout! Looks much better:
> diff -Nrup ./Config.in ../../../E10orig_clone/br1202-main/package/Config.in

You should invert the pathes, it would make easier reading the diff.

> --- ./Config.in 2012-05-15 13:00:29.803848668 -0700
> +++ ../../../E10orig_clone/br1202-main/package/Config.in 2012-05-15
> 14:00:02.971941323 -0700
> @@ -6,12 +6,6 @@ source "package/customize/Config.in"
> ?# Audio and video applications
> ?source "package/multimedia/Config.in"
>
> -#WView
> -source "package/radlib/Config.in"
> -source "package/gd/Config.in"
> -source "package/libreadline5/Config.in"
> -source "package/wview/Config.in"
> -
> ?menu "Compressors and decompressors"
> ?source "package/bzip2/Config.in"
> ?if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> @@ -225,8 +219,8 @@ source "package/ti-utils/Config.in"
> ?source "package/uboot-tools/Config.in"
> ?source "package/udev/Config.in"
> ?source "package/unionfs/Config.in"
> -source "package/usb_\modeswitch/Config.in"
> -source "package/usb_\modeswitch_data/Config.in"
> +source "package/usb_modeswitch/Config.in"
> +source "package/usb_modeswitch_data/Config.in"

Not sure that adding "\" was your intention...

> ?source "package/usbmount/Config.in"
> ?source "package/usbutils/Config.in"
> ?source "package/wipe/Config.in"
> diff -Nrup ./gd/Config.in
> ../../../E10orig_clone/br1202-main/package/gd/Config.in
> --- ./gd/Config.in 2012-05-15 09:43:49.631542682 -0700
> +++ ../../../E10orig_clone/br1202-main/package/gd/Config.in 1969-12-31
> 16:00:00.000000000 -0800
> @@ -1,6 +0,0 @@
> -config BR2_PACKAGE_GD
> - bool "gd"
> - help
> - ?gd is a prerequisite for the WView
> -
> - ?https://bitbucket.org/pierrejoye/gd-libgd/
> diff -Nrup ./gd/gdlib2 ../../../E10orig_clone/br1202-main/package/gd/gdlib2
> --- ./gd/gdlib2 2012-05-15 09:41:49.439539566 -0700
> +++ ../../../E10orig_clone/br1202-main/package/gd/gdlib2 1969-12-31
> 16:00:00.000000000 -0800
> @@ -1,13 +0,0 @@
> -#############################################################
> -#
> -# GD
> -#
> -#############################################################
> -
> -GD_VERSION = 2.0.33
> -GD_SITE = https://bitbucket.org/pierrejoye/gd-libgd/get/
> -
> -
> -$(eval $(call AUTOTARGETS))
> -$(eval $(call AUTOTARGETS,host))
> -
> diff -Nrup ./libreadline5/Config.in
> ../../../E10orig_clone/br1202-main/package/libreadline5/Config.in
> --- ./libreadline5/Config.in 2012-05-15 10:55:16.179653835 -0700
> +++ ../../../E10orig_clone/br1202-main/package/libreadline5/Config.in
> 1969-12-31 16:00:00.000000000 -0800
> @@ -1,6 +0,0 @@
> -config BR2_LIBREADLINE5

Substitute BR2_LIBREADLINE5 by BR2_PACKAGE_LIBREADLINE5

> - bool "libreadline5"
> - help
> - ?libreadline5 is required by WView
> -
> - ?http://mirror.anl.gov/pub/cygwin/release-legacy/readline/libreadline5/
> diff -Nrup ./libreadline5/libreadline5.mk
> ../../../E10orig_clone/br1202-main/package/libreadline5/libreadline5.mk
> --- ./libreadline5/libreadline5.mk 2012-05-15 10:57:54.035657928 -0700
> +++ ../../../E10orig_clone/br1202-main/package/libreadline5/libreadline5.mk
> 1969-12-31 16:00:00.000000000 -0800
> @@ -1,13 +0,0 @@
> -#############################################################
> -#
> -# libreadline5
> -#
> -#############################################################
> -
> -RADLIB_VERSION = 4.3-5
> -RADLIB_SITE = http://mirror.anl.gov/pub/cygwin/release-legacy/readline/libreadline5/

Substitute RADLIB by LIBREADLINE5

> -
> -
> -$(eval $(call AUTOTARGETS))
> -$(eval $(call AUTOTARGETS,host))
> -
> diff -Nrup ./radlib/Config.in
> ../../../E10orig_clone/br1202-main/package/radlib/Config.in
> --- ./radlib/Config.in 2012-05-14 14:41:50.842348693 -0700
> +++ ../../../E10orig_clone/br1202-main/package/radlib/Config.in 1969-12-31
> 16:00:00.000000000 -0800
> @@ -1,6 +0,0 @@
> -config BR2_PACKAGE_RADLIB
> - bool "radlib"
> - help
> - ?radlib is a prerequisite for the WView
> -
> - ?http://www.radlib.teel.ws
> diff -Nrup ./radlib/radlib.mk
> ../../../E10orig_clone/br1202-main/package/radlib/radlib.mk
> --- ./radlib/radlib.mk 2012-05-14 15:10:06.646392668 -0700
> +++ ../../../E10orig_clone/br1202-main/package/radlib/radlib.mk 1969-12-31
> 16:00:00.000000000 -0800
> @@ -1,13 +0,0 @@
> -#############################################################
> -#
> -# radlib
> -#
> -#############################################################
> -
> -RADLIB_VERSION = 2.12.0
> -RADLIB_SITE = http://downloads.sourceforge.net/project/radlib/radlib/radlib-2.12.0/
> -
> -
> -$(eval $(call AUTOTARGETS))
> -$(eval $(call AUTOTARGETS,host))
> -
> diff -Nrup ./wview/Config.in
> ../../../E10orig_clone/br1202-main/package/wview/Config.in
> --- ./wview/Config.in 2012-05-15 11:04:37.639668394 -0700
> +++ ../../../E10orig_clone/br1202-main/package/wview/Config.in 1969-12-31
> 16:00:00.000000000 -0800
> @@ -1,6 +0,0 @@
> -config BR2_WVIEW

Substitute BR2_WVIEW by BR2_PACKAGE_WVIEW

> - bool "vwiew"
> - help
> - ?Driver for DAVIS weather station
> -
> - ?http://www.wviewweather.com/
> diff -Nrup ./wview/wview.mk
> ../../../E10orig_clone/br1202-main/package/wview/wview.mk
> --- ./wview/wview.mk 2012-05-15 11:08:16.191674061 -0700
> +++ ../../../E10orig_clone/br1202-main/package/wview/wview.mk 1969-12-31
> 16:00:00.000000000 -0800
> @@ -1,13 +0,0 @@
> -#############################################################
> -#
> -# WView
> -#
> -#############################################################
> -
> -WVIEW_VERSION = 5.20.2
> -WVIEW_SITE =
> http://sourceforge.net/projects/wview/files/wview/wview-5.20.2/
> -WVIEW_DEPENCIES = libz libpng libreadline5 gawk sqlite libgd2 libusb radlib

Substitute WVIEW_DEPENCIES by WVIEW_DEPENDENCIES

> -
> -$(eval $(call AUTOTARGETS))
> -$(eval $(call AUTOTARGETS,host))
> -
> Binary files ./wview-5.20.2.tar.gz and
> ../../../E10orig_clone/br1202-main/package/wview-5.20.2.tar.gz differ
>
>
> ?> BTW, is there anything wrong with the readline library and zlib library
> already
>> available in buildroot?
>
> Not sure, just tried to follow the instructions I had from
> http://www.wviewweather.com/release-notes/wview-User-Manual.html#Installation-build
>

Cheers,

Sam
