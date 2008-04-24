From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 24 Apr 2008 13:49:44 -0700
Subject: [Buildroot] [buildroot 0002474]: Error building GCC-4.2.1
Message-ID: <fe0357216c2705dbb0165f49a8ec558a@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2474 
====================================================================== 
Reported By:                Olivier
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2474
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-07-2008 08:11 PST
Last Modified:              04-24-2008 13:49 PDT
====================================================================== 
Summary:                    Error building GCC-4.2.1
Description: 
Hello, 

I want to build a tool chain for a MPIS 32.
I use the dayly snapshoot of buildroot (07-Mar-2008).
I have confiured using 'make menuconfig' and when I whant to compile it, I
have the following error:

/home/buildroot-20080307/toolchain_build_mips/gcc-4.2.1-initial/./gcc/xgcc
-B/home/buildroot-20080307/toolchain_build_mips/gcc-4.2.1-initial/./gcc/
-B/home/buildroot-20080307/build_mips/staging_dir/usr/mips-linux-uclibc/bin/
-B/home/buildroot-20080307/build_mips/staging_dir/usr/mips-linux-uclibc/lib/
-isystem
/home/buildroot-20080307/build_mips/staging_dir/usr/mips-linux-uclibc/include
-isystem
/home/buildroot-20080307/build_mips/staging_dir/usr/mips-linux-uclibc/sys-include
-O2 -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem
./include  -I. -I.
-I/home/buildroot-20080307/toolchain_build_mips/gcc-4.2.1/gcc
-I/home/buildroot-20080307/toolchain_build_mips/gcc-4.2.1/gcc/.
-I/home/buildroot-20080307/toolchain_build_mips/gcc-4.2.1/gcc/../include
-I/home/buildroot-20080307/toolchain_build_mips/gcc-4.2.1/gcc/../libcpp/include
-I/home/buildroot-20080307/toolchain_build_mips/gmp/include
-I/home/buildroot-20080307/toolchain_build_mips/mpfr/include
-I/home/buildroot-20080307/toolchain_build_mips/gcc-4.2.1/gcc/../libdecnumber
-I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions
-fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder   \
          -c
/home/buildroot-20080307/toolchain_build_mips/gcc-4.2.1/gcc/crtstuff.c
-DCRT_BEGIN \
          -o crtbegin.o
/home/buildroot-20080307/toolchain_build_mips/gcc-4.2.1/gcc/crtstuff.c:1:
error: unsupported combination: -mabicalls -mabi=eabi
make[2]: *** [crtbegin.o] Erreur 1


I have replaced in the configuration Target ABI = EABI by Target ABI =
OABI, but the error is still the same.


I have put my .config file as attachement.

====================================================================== 

---------------------------------------------------------------------- 
 dpelton - 04-24-08 13:49  
---------------------------------------------------------------------- 
The patch referenced in the link below seems to address this issue.

http://buildroot.uclibc.org/lists/buildroot/2008-February/007070.html 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-07-08 08:11  Olivier        New Issue                                    
03-07-08 08:11  Olivier        Status                   new => assigned     
03-07-08 08:11  Olivier        Assigned To               => buildroot       
03-07-08 08:11  Olivier        File Added: .config                          
04-24-08 13:49  dpelton        Note Added: 0007064                          
======================================================================
