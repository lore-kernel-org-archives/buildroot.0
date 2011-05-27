From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 May 2011 04:58:52 +0000 (UTC)
Subject: [Buildroot] [Bug 3805] New: 2011.05rc2 dies at ./configure with
 binutils 2.21 on Debian Squeeze
Message-ID: <bug-3805-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3805

           Summary: 2011.05rc2 dies at ./configure with binutils 2.21 on
                    Debian Squeeze
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ibid_ag at lavabit.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3331
  --> https://bugs.busybox.net/attachment.cgi?id=3331
Config file

Using Debian Squeeze (i386) with GCC 4.4.5, with uclibc 0.9.31.x and binutils
2.21 selected for a target i386 system, make -j3 dies at the configure step for
binutils.

Here's the error:
>>> host-binutils 2.21 Configuring
(cd
/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/build/host-binutils-2.21/
&& rm -rf config.cache;
PATH=/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/bin:/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/bin:/home/idunham/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp"
CFLAGS="-O2
-I/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/include
-I/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/include"
CXXFLAGS="-I/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/include
-I/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/include"
LDFLAGS="-L/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/lib
-L/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/lib
-Wl,-rpath,/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/lib"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG="/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/lib/pkgconfig:/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/share/pkgconfig"
PERLLIB="/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/lib/perl"
LD_LIBRARY_PATH="/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/lib:"
CFLAGS="-O2
-I/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/include
-I/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/include"
LDFLAGS="-L/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/lib
-L/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/lib
-Wl,-rpath,/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/lib"
 ./configure
--prefix="/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr"
--sysconfdir="/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/etc"
--disable-multilib --disable-werror --target=-unknown-linux-uclibc
--with-sysroot=/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/host/usr/-unknown-linux-uclibc/sysroot
 )
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking target system type... configure: error: /bin/sh ./config.sub
-unknown-linux-uclibc failed
configure: WARNING: cache variable ac_cv_target contains a newline
make: ***
[/home/idunham/misc/toolchain/buildroot-2011.05-rc2/output/build/host-binutils-2.21/.stamp_configured]
Error 1

It had successfully built a few packages already, but I wasn't logging those.
This appears to be a quite different problem from 1789, since it's at the
configure stage.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
