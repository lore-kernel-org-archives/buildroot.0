From: Peter Mendham <petermendham@computing.dundee.ac.uk>
Date: Thu, 30 Nov 2006 16:44:38 +0000
Subject: [Buildroot] uClibc/gcc build problems?
Message-ID: <456F0A76.9060501@computing.dundee.ac.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am attempting to build buildroot revision 16738 (the latest at the 
time of writing) for a powerpc.  It seems to hit a snag during the 
compilation of gcc.  I don't think my configuration makes any difference 
at this stage of play, but if it does: I went with almost all the 
default options apart from software FP, I remooved the hdparm and sudo 
packages and added DHCP client support, I answered all of the prompts 
during make (is there an MMU etc.) with the default options.  The 
relevant (I hope) portion of the output from the make is given below.

I don't really know where to start with this. Any help greatly appreciated.
-- Peter

/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2-initial/gcc/xgcc 
-B/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2-initial/gcc/ 
-B/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/staging_dir/powerpc-linux-uclibc/bin/ 
-B/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/staging_dir/powerpc-linux-uclibc/lib/ 
-isystem 
/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/staging_dir/powerpc-linux-uclibc/include 
-isystem 
/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/staging_dir/powerpc-linux-uclibc/sys-include 
-O2 -DIN_GCC -DCROSS_COMPILE  -DUSE_UCLIBC -W -Wall -Wwrite-strings 
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  
-isystem ./include  -I. -I. 
-I/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2/gcc 
-I/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2/gcc/. 
-I/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2/gcc/../include   
-g0 -finhibit-size-directive -fno-inline-functions -fno-exceptions 
-fno-zero-initialized-in-bss -fno-unit-at-a-time -msdata=none \
          -c 
/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2/gcc/crtstuff.c 
-DCRT_BEGIN \
         -o crtbegin.o
In file included from 
/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/uClibc_dev//usr/include/bits/posix1_lim.h:154, 

                from 
/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/uClibc_dev//usr/include/limits.h:144, 

                from 
/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2-initial/gcc/include/limits.h:122, 

                from 
/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2-initial/gcc/include/syslimits.h:7, 

                from 
/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2-initial/gcc/include/limits.h:11, 

                from 
/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2/gcc/tsystem.h:97, 

                from 
/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2/gcc/crtstuff.c:62: 

/home/pmendham/powerpc-405-linux-gnu/buildroot/toolchain_build_powerpc_nofpu/uClibc_dev//usr/include/bits/uClibc_local_lim.h:15:3: 
#error local_lim.h was incorrectly updated, use the NPTL version from glibc
make[2]: *** [crtbegin.o] Error 1
