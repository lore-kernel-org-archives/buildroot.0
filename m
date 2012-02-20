From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 20 Feb 2012 20:26:21 +0100
Subject: [Buildroot] BR 2012.02-rc1 :: WODIM issue (linking stage)
In-Reply-To: <CAPEB33xmChFcT9TOyiYvXLBt3sudCGnZ-h+DGggijAmnsw-aZA@mail.gmail.com>
References: <CAPEB33yG=-ETJSRQZgAAz45Lpu+2XWURiGRGRkzfFfaawt6d+w@mail.gmail.com>
 <CAPEB33w1eEb5Efv+15-PG9QT4LRKSASz69tBspHWoASiV-w9hw@mail.gmail.com>
 <201202181236.28445.arnout@mind.be>
 <CAPEB33xmChFcT9TOyiYvXLBt3sudCGnZ-h+DGggijAmnsw-aZA@mail.gmail.com>
Message-ID: <CAHXCMMK5JKTTLtyg8sPEWLL6FLznas_E55iUU8efjnmPcH-HNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2012/2/20 MERCADIER Johann <johann.mercadier@imerir.com>:
> Hi Arnout,
> ??I have tried as suggested earlier on with BR_JLEVEL=1 but it still produce
> an error when linking stuff related to WODIM...
> ?? Why using only one processor could have change something?
>
> ?? Just below is an extract of the o/p I got at the end. What I understand
> from that. It's that some path are not well defined?
> ?? So I have done some search around with a
> #?find . -type f -name "bzlib.h"
> ./output/build/uboot-2011.12/include/bzlib.h
> ./output/build/host-uboot-tools-2011.03/include/bzlib.h
> ./output/build/busybox-1.19.4/archival/libarchive/bz/bzlib.h
> ./output/build/host-cmake-2.8.5/Utilities/cmbzip2/bzlib.h
>
> Do you think that the good way to get through?
> Thanks!
>
>
> ___[ EXTRACT ]_______________________________
>
> [ 69%] Building C object genisoimage/CMakeFiles/genisoimage.dir/jte.o
> cd
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage

The error occurs while building the host package of cdrkit...

> && /usr/bin/gcc ?-DTHREADED_CHECKSUMS -DUSE_ICONV -DUSE_LARGEFILES
> -DABORT_DEEP_ISO_ONLY -DAPPLE_HYB -DUDF -DDVD_VIDEO -DSORTING
> -DHAVE_CONFIG_H -DUSE_LIBSCHILY -DUSE_SCG -DJIGDO_TEMPLATE
> -I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/include
> -I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/../include
> -I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/../libhfs_iso
> -I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/../wodim
> -I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11
> -I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/include
> ? ?-o CMakeFiles/genisoimage.dir/jte.o ? -c
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c:17:19:
> error: bzlib.h: No such file or directory

So, my guess is that you the HOST_CC (/usr/bin/gcc) does not find any
bzlib.h file in the host system (in /usr/include).
On debian system, this file is provided by libbz2-dev


Regards,

Sam
