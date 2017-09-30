From: grunpferd at netscape.net <grunpferd@netscape.net>
Date: Fri, 29 Sep 2017 22:46:18 -0400
Subject: [Buildroot] Build failure in icu-59.1
Message-ID: <15ed0ad5eee-c06-3fc9e@webjas-vab009.srv.aolmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There seems to be some problem building icu-59.1 that has crept in here.



This used to work nicely.


The following errors get reported during compiling icu-59.1




make[2]: Entering directory '/home/rfg/w/buildroot_p_gcc6_4.13/output/build/icu-59.1/source/common'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/rfg/w/buildroot_p_gcc6_4.13/output/build/icu-59.1/source/common'
/usr/bin/make[1]: Making `all' in `i18n'
make[2]: Entering directory '/home/rfg/w/buildroot_p_gcc6_4.13/output/build/icu-59.1/source/i18n'
   arm-buildroot-linux-gnueabihf-g++     ...  fmtable_cnv.cpp
   arm-buildroot-linux-gnueabihf-g++     ...  digitlst.cpp
   arm-buildroot-linux-gnueabihf-g++     ...  choicfmt.cpp
   arm-buildroot-linux-gnueabihf-g++     ...  datefmt.cpp
   arm-buildroot-linux-gnueabihf-g++     ...  smpdtfmt.cpp
   arm-buildroot-linux-gnueabihf-g++     ...  dtfmtsym.cpp
   arm-buildroot-linux-gnueabihf-g++     ...  reldtfmt.cpp
   arm-buildroot-linux-gnueabihf-g++     ...  udat.cpp
   arm-buildroot-linux-gnueabihf-g++     ...  dtptngen.cpp
digitlst.cpp:67:24: fatal error: xlocale.h: No such file or directory
 #   include <xlocale.h>
                        ^
compilation terminated.
*** Failed compilation command follows: ----------------------------------------------------------
/home/rfg/w/buildroot_p_gcc6_4.13/output/host/bin/arm-buildroot-linux-gnueabihf-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FIL
E_OFFSET_BITS=64 -D_REENTRANT -DU_HAVE_ELF_H=1 -DU_HAVE_ATOMIC=1 -DU_HAVE_STRTOD_L=1 -I. -I../common -DU_ATTRIBUTE_DEPRECATED= -DU_I
18N_IMPLEMENTATION -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -pedantic -Wpointer-arith -Wwrite-strings -W
no-long-long -std=c++11 -c -DPIC -fPIC -o digitlst.o digitlst.cpp
--- ( rebuild with "/usr/bin/make VERBOSE=1 all" to show all parameters ) --------
../config/mh-linux:53: recipe for target 'digitlst.o' failed
make[2]: *** [digitlst.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory '/home/rfg/w/buildroot_p_gcc6_4.13/output/build/icu-59.1/source/i18n'
Makefile:147: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 2
make[1]: Leaving directory '/home/rfg/w/buildroot_p_gcc6_4.13/output/build/icu-59.1/source'
package/pkg-generic.mk:234: recipe for target '/home/rfg/w/buildroot_p_gcc6_4.13/output/build/icu-59.1/.stamp_built' failed
make: *** [/home/rfg/w/buildroot_p_gcc6_4.13/output/build/icu-59.1/.stamp_built] Error 2



So it looks like it can't locate xlocale.h.




I have attached the .config for this build.




Regards,


Ross
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170929/eacae2ff/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 118400 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170929/eacae2ff/attachment.obj>
