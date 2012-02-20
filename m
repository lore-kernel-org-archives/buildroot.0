From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Mon, 20 Feb 2012 17:00:50 +0000
Subject: [Buildroot] BR 2012.02-rc1 :: WODIM issue (linking stage)
In-Reply-To: <201202181236.28445.arnout@mind.be>
References: <CAPEB33yG=-ETJSRQZgAAz45Lpu+2XWURiGRGRkzfFfaawt6d+w@mail.gmail.com>
 <CAPEB33w1eEb5Efv+15-PG9QT4LRKSASz69tBspHWoASiV-w9hw@mail.gmail.com>
 <201202181236.28445.arnout@mind.be>
Message-ID: <CAPEB33xmChFcT9TOyiYvXLBt3sudCGnZ-h+DGggijAmnsw-aZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
  I have tried as suggested earlier on with BR_JLEVEL=1 but it still
produce an error when linking stuff related to WODIM...
   Why using only one processor could have change something?

   Just below is an extract of the o/p I got at the end. What I understand
from that. It's that some path are not well defined?
   So I have done some search around with a
# <http://pastebin.pandaboard.org/index.php/view/87166725> find . -type f
-name "bzlib.h"
./output/build/uboot-2011.12/include/bzlib.h
./output/build/host-uboot-tools-2011.03/include/bzlib.h
./output/build/busybox-1.19.4/archival/libarchive/bz/bzlib.h
./output/build/host-cmake-2.8.5/Utilities/cmbzip2/bzlib.h

Do you think that the good way to get through?
Thanks!


___[ EXTRACT ]_______________________________

[ 69%] Building C object genisoimage/CMakeFiles/genisoimage.dir/jte.o
cd
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage
&& /usr/bin/gcc  -DTHREADED_CHECKSUMS -DUSE_ICONV -DUSE_LARGEFILES
-DABORT_DEEP_ISO_ONLY -DAPPLE_HYB -DUDF -DDVD_VIDEO -DSORTING
-DHAVE_CONFIG_H -DUSE_LIBSCHILY -DUSE_SCG -DJIGDO_TEMPLATE
-I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/include
-I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/../include
-I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/../libhfs_iso
-I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/../wodim
-I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11
-I/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/include
   -o CMakeFiles/genisoimage.dir/jte.o   -c
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c:17:19:
error: bzlib.h: No such file or directory
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c:
In function ?flush_bz2_chunk?:
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c:615:
error: ?bz_stream? undeclared (first use in this function)
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c:615:
error: (Each undeclared identifier is reported only once
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c:615:
error: for each function it appears in.)
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c:615:
error: expected ?;? before ?c_stream?
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c:622:
error: ?c_stream? undeclared (first use in this function)
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/genisoimage/jte.c:633:
error: ?BZ_FINISH? undeclared (first use in this function)
make[3]: *** [genisoimage/CMakeFiles/genisoimage.dir/jte.o] Error 1
make[3]: Leaving directory
`/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11'
make[2]: *** [genisoimage/CMakeFiles/genisoimage.dir/all] Error 2
make[2]: Leaving directory
`/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11'
make: ***
[/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/build/host-cdrkit-1.1.11/.stamp_built]
Error 2


-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120220/b999888e/attachment.html>
