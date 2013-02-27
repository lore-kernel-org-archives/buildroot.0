From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Feb 2013 14:59:14 +0000 (UTC)
Subject: [Buildroot] [Bug 5978] New: Erlang does not build for arm in
	2013.02-rc3
Message-ID: <bug-5978-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5978

           Summary: Erlang does not build for arm in 2013.02-rc3
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tbolsh at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I was trying to build Erlang int the latest RC (2013.02-rc3) for arm.
It did not recognize the platform correctly and, as a result, did not build.
Here is an excerpt from the log file:
________________________________________________________________________
>>> host-erlang R15B01 Patching libtool
>>> host-erlang R15B01 Configuring
(cd /root/buildroot-2013.02-rc3/output/build/host-erlang-R15B01/ && rm -rf
config.cache;
PATH=/root/buildroot-2013.02-rc3/output/host/bin:/root/buildroot-2013.02-rc3/output/host/usr/bin:/usr/lib/git-core:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/root/buildroot-2013.02-rc3/output/host/usr/bin/ccache /usr/bin/gcc"
GCC="/root/buildroot-2013.02-rc3/output/host/usr/bin/ccache /usr/bin/gcc"
CXX="/root/buildroot-2013.02-rc3/output/host/usr/bin/ccache /usr/bin/g++"
CPP="/usr/bin/cpp"
CPPFLAGS="-I/root/buildroot-2013.02-rc3/output/host/usr/include" CFLAGS="-O2
-I/root/buildroot-2013.02-rc3/output/host/usr/include" CXXFLAGS="-O2
-I/root/buildroot-2013.02-rc3/output/host/usr/include"
LDFLAGS="-L/root/buildroot-2013.02-rc3/output/host/lib
-L/root/buildroot-2013.02-rc3/output/host/usr/lib
-Wl,-rpath,/root/buildroot-2013.02-rc3/output/host/usr/lib"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG="/root/buildroot-2013.02-rc3/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/root/buildroot-2013.02-rc3/output/host/usr/lib/pkgconfig:/root/buildroot-2013.02-rc3/output/host/usr/share/pkgconfig"
PERLLIB="/root/buildroot-2013.02-rc3/output/host/usr/lib/perl"
LD_LIBRARY_PATH="/root/buildroot-2013.02-rc3/output/host/usr/lib:" CFLAGS="-O2
-I/root/buildroot-2013.02-rc3/output/host/usr/include"
LDFLAGS="-L/root/buildroot-2013.02-rc3/output/host/lib
-L/root/buildroot-2013.02-rc3/output/host/usr/lib
-Wl,-rpath,/root/buildroot-2013.02-rc3/output/host/usr/lib"  ./configure
--prefix="/root/buildroot-2013.02-rc3/output/host/usr"
--sysconfdir="/root/buildroot-2013.02-rc3/output/host/etc" --enable-shared
--disable-static --disable-gtk-doc --disable-doc --disable-docs
--disable-documentation --with-xmlto=no --with-fop=no --without-javac )
Ignoring the --cache-file argument since it can cause the system to be
erroneously configured
Disabling caching
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
                             !!!!!!!!!!!!!!!!!
checking for gcc... /root/buildroot-2013.02-rc3/output/host/usr/bin/ccache
/usr/bin/gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
________________________________________________________________________

Exactly the same happen in RC1 (that was my main reason to switch to RC3).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
