From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 22 Oct 2007 07:15:33 -0700
Subject: [Buildroot] [buildroot 0001546]: coreutils;
	empty filename in #include; with WCHAR defined
Message-ID: <0be87e637acd9257a29afd44568569ca@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1546 
====================================================================== 
Reported By:                DestroyerOfWorlds
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1546
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 reopened
Fixed in Version:           
====================================================================== 
Date Submitted:             10-22-2007 00:57 PDT
Last Modified:              10-22-2007 07:15 PDT
====================================================================== 
Summary:                    coreutils; empty filename in #include; with WCHAR
defined
Description: 
Previous buildroot builds work, then, define development and WCHAR and
fails as below.  Looks similar to 0001479 and 0001527 but I
do have WCHAR defined and I still get this error.

Version is buildroot-20070927.tar

[root at localhost buildrootDEV]# make

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
C compiler '/usr/lib/ccache/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/lib/ccache/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /root/buildrootDEV/project_build_mipsel/uclibc/buildroot-config
mkdir -p /root/buildrootDEV/project_build_mipsel/uclibc
cp -dpRf package/config/buildroot-config
/root/buildrootDEV/project_build_mipsel/uclibc/buildroot-config
/usr/bin/make -j1 -C /root/buildrootDEV/build_mipsel/coreutils-6.9
make[1]: Entering directory
`/root/buildrootDEV/build_mipsel/coreutils-6.9'
Making all in lib
make[2]: Entering directory
`/root/buildrootDEV/build_mipsel/coreutils-6.9/lib'
/usr/bin/make  all-am
make[3]: Entering directory
`/root/buildrootDEV/build_mipsel/coreutils-6.9/lib'
/root/buildrootDEV/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe  -I/root/buildrootDEV/build_mipsel/staging_dir/usr/include
-I/root/buildrootDEV/build_mipsel/staging_dir/include
--sysroot=/root/buildrootDEV/build_mipsel/staging_dir/ -isysroot
/root/buildrootDEV/build_mipsel/staging_dir  -I.      -g -O2 -c mbchar.c
In file included from mbchar.h:157,
                 from mbchar.c:22:
./wchar.h:41:12: error: empty filename in #include
In file included from mbchar.c:22:
mbchar.h:242: error: expected ')' before 'wc'
make[3]: *** [mbchar.o] Error 1
make[3]: Leaving directory
`/root/buildrootDEV/build_mipsel/coreutils-6.9/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/root/buildrootDEV/build_mipsel/coreutils-6.9/lib'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/root/buildrootDEV/build_mipsel/coreutils-6.9'
make: *** [/root/buildrootDEV/build_mipsel/coreutils-6.9/src/vdir] Error
2
[root at localhost buildrootDEV]# 

====================================================================== 

---------------------------------------------------------------------- 
 Ulf Samuelsson - 10-22-07 05:47  
---------------------------------------------------------------------- 
If you change WCHAR or any other toolchain configuration, 
you have to rebuild the toolchain and all applications. 

---------------------------------------------------------------------- 
 DestroyerOfWorlds - 10-22-07 06:27  
---------------------------------------------------------------------- 
Hello again,

  I get the same error when I do a 'make clean; make'.

  Should I do somethingelse to 'rebuild' the toolchain?

thanks

DoW 

---------------------------------------------------------------------- 
 UlfSamuelsson - 10-22-07 07:15  
---------------------------------------------------------------------- 
I do not think you deleted your toolchain

rm -rf binaries
rm -rf toolchain_build_<arch>
rm -rf project_build_<arch>
rm -rf build_<arch> 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-22-07 00:57  DestroyerOfWorldsNew Issue                                    
10-22-07 00:57  DestroyerOfWorldsStatus                   new => assigned     
10-22-07 00:57  DestroyerOfWorldsAssigned To               => buildroot       
10-22-07 05:47  Ulf Samuelsson Status                   assigned => closed  
10-22-07 05:47  Ulf Samuelsson Note Added: 0002854                          
10-22-07 05:47  Ulf Samuelsson Resolution               open => fixed       
10-22-07 06:27  DestroyerOfWorldsStatus                   closed => feedback  
10-22-07 06:27  DestroyerOfWorldsResolution               fixed => reopened   
10-22-07 06:27  DestroyerOfWorldsNote Added: 0002855                          
10-22-07 07:15  UlfSamuelsson  Status                   feedback => closed  
10-22-07 07:15  UlfSamuelsson  Note Added: 0002856                          
======================================================================
