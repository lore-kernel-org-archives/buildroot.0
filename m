From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 22 Oct 2007 00:57:29 -0700
Subject: [Buildroot] [buildroot 0001546]: coreutils;
	empty filename in #include; with WCHAR defined
Message-ID: <5558f1d01a1939001b90d65105c18b4a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             10-22-2007 00:57 PDT
Last Modified:              10-22-2007 00:57 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-22-07 00:57  DestroyerOfWorldsNew Issue                                    
10-22-07 00:57  DestroyerOfWorldsStatus                   new => assigned     
10-22-07 00:57  DestroyerOfWorldsAssigned To               => buildroot       
======================================================================
