From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:16 -0800
Subject: [Buildroot] [buildroot 0000909]: Toolchain build fails on x86-64
Message-ID: <e891b03ddaf898f92de5447555c6dccb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=909 
====================================================================== 
Reported By:                photon
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   909
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-17-2006 09:37 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    Toolchain build fails on x86-64
Description: 
GCC build fails when linking to uClibc

/home/tux/buildroot/toolchain_build_x86_64/gcc-4.1.1-final/./gcc/xgcc
-B/home/tux/buildroot/toolchain_build_x86_64/gcc-4.1.1-final/./gcc/
-B/home/tux/buildroot/build_x86_64/staging_dir/x86_64-linux-uclibc/bin/
-B/home/tux/buildroot/build_x86_64/staging_dir/x86_64-linux-uclibc/lib/
-isystem
/home/tux/buildroot/build_x86_64/staging_dir/x86_64-linux-uclibc/include
-isystem
/home/tux/buildroot/build_x86_64/staging_dir/x86_64-linux-uclibc/sys-include
-O2  -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem
./include  -fPIC -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2
-D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -shared -nodefaultlibs
-Wl,--soname=libgcc_s.so.1 -Wl,--version-script=libgcc/32/libgcc.map -o
32/libgcc_s.so.1.tmp  -m32 libgcc/32/_muldi3_s.o libgcc/32/_negdi2_s.o
libgcc/32/_lshrdi3_s.o libgcc/32/_ashldi3_s.o libgcc/32/_ashrdi3_s.o
libgcc/32/_cmpdi2_s.o libgcc/32/_ucmpdi2_s.o libgcc/32/_floatdidf_s.o
libgcc/32/_floatdisf_s.o libgcc/32/_fixunsdfsi_s.o
libgcc/32/_fixunssfsi_s.o libgcc/32/_fixunsdfdi_s.o libgcc/32/_fixdfdi_s.o
libgcc/32/_fixunssfdi_s.o libgcc/32/_fixsfdi_s.o libgcc/32/_fixxfdi_s.o
libgcc/32/_fixunsxfdi_s.o libgcc/32/_floatdixf_s.o
libgcc/32/_fixunsxfsi_s.o libgcc/32/_fixtfdi_s.o libgcc/32/_fixunstfdi_s.o
libgcc/32/_floatditf_s.o libgcc/32/_clear_cache_s.o
libgcc/32/_enable_execute_stack_s.o libgcc/32/_trampoline_s.o
libgcc/32/__main_s.o libgcc/32/_absvsi2_s.o libgcc/32/_absvdi2_s.o
libgcc/32/_addvsi3_s.o libgcc/32/_addvdi3_s.o libgcc/32/_subvsi3_s.o
libgcc/32/_subvdi3_s.o libgcc/32/_mulvsi3_s.o libgcc/32/_mulvdi3_s.o
libgcc/32/_negvsi2_s.o libgcc/32/_negvdi2_s.o libgcc/32/_ctors_s.o
libgcc/32/_ffssi2_s.o libgcc/32/_ffsdi2_s.o libgcc/32/_clz_s.o
libgcc/32/_clzsi2_s.o libgcc/32/_clzdi2_s.o libgcc/32/_ctzsi2_s.o
libgcc/32/_ctzdi2_s.o libgcc/32/_popcount_tab_s.o
libgcc/32/_popcountsi2_s.o libgcc/32/_popcountdi2_s.o
libgcc/32/_paritysi2_s.o libgcc/32/_paritydi2_s.o libgcc/32/_powisf2_s.o
libgcc/32/_powidf2_s.o libgcc/32/_powixf2_s.o libgcc/32/_powitf2_s.o
libgcc/32/_mulsc3_s.o libgcc/32/_muldc3_s.o libgcc/32/_mulxc3_s.o
libgcc/32/_multc3_s.o libgcc/32/_divsc3_s.o libgcc/32/_divdc3_s.o
libgcc/32/_divxc3_s.o libgcc/32/_divtc3_s.o libgcc/32/_divdi3_s.o
libgcc/32/_moddi3_s.o libgcc/32/_udivdi3_s.o libgcc/32/_umoddi3_s.o
libgcc/32/_udiv_w_sdiv_s.o libgcc/32/_udivmoddi4_s.o
libgcc/32/unwind-dw2_s.o libgcc/32/unwind-dw2-fde_s.o
libgcc/32/unwind-sjlj_s.o libgcc/32/gthr-gnat_s.o libgcc/32/unwind-c_s.o
-lc && rm -f 32/libgcc_s.so && if [ -f 32/libgcc_s.so.1 ]; then mv -f
32/libgcc_s.so.1 32/libgcc_s.so.1.backup; else true; fi && mv
32/libgcc_s.so.1.tmp 32/libgcc_s.so.1 && ln -s libgcc_s.so.1
32/libgcc_s.so
/home/tux/buildroot/build_x86_64/staging_dir/bin/x86_64-linux-uclibc-ld:
skipping incompatible
/home/tux/buildroot/build_x86_64/staging_dir/lib/libc.so.0 when searching
for /home/tux/buildroot/build_x86_64/staging_dir/lib/libc.so.0
/home/tux/buildroot/build_x86_64/staging_dir/bin/x86_64-linux-uclibc-ld:
cannot find /home/tux/buildroot/build_x86_64/staging_dir/lib/libc.so.0
collect2: ld returned 1 exit status
make[4]: *** [32/libgcc_s.so] Error 1
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 06-17-06 12:47  
---------------------------------------------------------------------- 
disable multilib support 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-17-06 09:37  photon         New Issue                                    
06-17-06 09:37  photon         Status                   new => assigned     
06-17-06 09:37  photon         Assigned To               => uClibc          
06-17-06 09:37  photon         File Added: build.log.gz                     
06-17-06 12:47  vapier         Note Added: 0001430                          
06-17-06 12:47  vapier         Status                   assigned => closed  
06-17-06 12:47  vapier         Resolution               open => won't fix   
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
