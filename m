From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 17 Mar 2008 00:54:19 -0700
Subject: [Buildroot] [buildroot 0002614]: Cannot build toolchain with
	kernel-2.6.22.10 and uClibc 0.9.29
Message-ID: <c689152d8195b2260f5ee094fd3f0cdf@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2614 
====================================================================== 
Reported By:                Stanley
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2614
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-17-2008 00:54 PDT
Last Modified:              03-17-2008 00:54 PDT
====================================================================== 
Summary:                    Cannot build toolchain with kernel-2.6.22.10 and
uClibc 0.9.29
Description: 
I grab the toolchains and configure kernel as 2.6.22.10.
It fails while buding kernel.
Is there something wrong in my environment?

Following are the error message:
Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '3.4.6':                     Ok
C++ Compiler installed:             FALSE

You may have to install 'g++' on your build machine

bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf
/usr/local/src/buildroot/project_build_i386/uclibc/buildroot-config
mkdir -p /usr/local/src/buildroot/project_build_i386/uclibc
cp -dpRf package/config/buildroot-config
/usr/local/src/buildroot/project_build_ i386/uclibc/buildroot-config
rm -rf
/usr/local/src/buildroot/project_build_i386/uclibc/root/usr/include
find /usr/local/src/buildroot/project_build_i386/uclibc/root/usr/lib -name
'*.a'  -delete
find /usr/local/src/buildroot/project_build_i386/uclibc/root/lib -name
'*.a' -de lete
find /usr/local/src/buildroot/project_build_i386/uclibc/root/usr/lib -name
'*.la ' -delete
find /usr/local/src/buildroot/project_build_i386/uclibc/root/lib -name
'*.la' -d elete
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=i386
CFLAGS_KERNEL="- O0
-I/usr/local/src/buildroot/build_i386/staging_dir/usr/include
-I/usr/local/sr c/buildroot/build_i386/staging_dir/include -mtune=i386
-march=i386" INSTALL_MOD_
PATH=/usr/local/src/buildroot/project_build_i386/uclibc/root
CROSS_COMPILE=/usr/
local/src/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-
LDFLAGS="- L/usr/local/src/buildroot/build_i386/staging_dir/lib
-L/usr/local/src/buildroot/ build_i386/staging_dir/usr/lib"
LZMA="/usr/local/src/buildroot/toolchain_build_i 386/bin/lzma"  \
                -C
/usr/local/src/buildroot/project_build_i386/uclibc/linux-2.6. 22.10
bzImage
make[1]: Entering directory
`/usr/local/src/buildroot/project_build_i386/uclibc/ linux-2.6.22.10'
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHK     include/linux/compile.h
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      vmlinux
mm/built-in.o: In function `kmem_cache_init':
(.init.text+0x41ff): undefined reference to `__bad_size'
mm/built-in.o: In function `kmem_cache_init':
(.init.text+0x4225): undefined reference to `__bad_size'
mm/built-in.o: In function `kmem_cache_init':
(.init.text+0x4247): undefined reference to `__bad_size'
mm/built-in.o: In function `kmem_cache_init':
(.init.text+0x4294): undefined reference to `__bad_size'
mm/built-in.o: In function `kmem_cache_init':
(.init.text+0x42a5): undefined reference to `__bad_size'
mm/built-in.o:(.init.text+0x42be): more undefined references to
`__bad_size' fol low
arch/i386/lib/lib.a(usercopy.o): In function `__copy_to_user_ll':
usercopy.c:(.text+0x2c1): undefined reference to `__copy_user_intel'
arch/i386/lib/lib.a(usercopy.o): In function `__copy_from_user_ll':
usercopy.c:(.text+0x361): undefined reference to
`__copy_user_zeroing_intel'
arch/i386/lib/lib.a(usercopy.o): In function
`__copy_from_user_ll_nozero':
usercopy.c:(.text+0x401): undefined reference to `__copy_user_intel'
make[1]: *** [vmlinux] Error 1
make[1]: Leaving directory
`/usr/local/src/buildroot/project_build_i386/uclibc/l inux-2.6.22.10'
make: ***
[/usr/local/src/buildroot/binaries/uclibc/linux-kernel-2.6.22.10-i386] 
Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-17-08 00:54  Stanley        New Issue                                    
03-17-08 00:54  Stanley        Status                   new => assigned     
03-17-08 00:54  Stanley        Assigned To               => buildroot       
======================================================================
