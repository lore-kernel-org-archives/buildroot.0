From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Feb 2012 14:42:12 +0000 (UTC)
Subject: [Buildroot] [Bug 4808] ccache may build against wrong zlib
In-Reply-To: <bug-4808-163@https.bugs.busybox.net/>
References: <bug-4808-163@https.bugs.busybox.net/>
Message-ID: <20120229144212.5FC6590BC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4808

--- Comment #3 from Ra?l S?nchez Siles <rsanchezs@infoglobal.es> 2012-02-29 14:42:12 UTC ---
..and now I'm not sure if ccache is exactly to blame. I removed the rpath from
cache and tried to make again. I had the same error as before. This is the
result:
/repos/mcv_buildroot/output/build/host-lzo-2.05$
PATH=/home/rasasi/repos/mcv_buildroot/output/host/bin:/home/rasasi/repos/mcv_buildroot/output/host/usr/bin:/home/rasasi/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/home/rasasi/repos/mcv_buildroot/output/host/usr/bin/ccache /usr/bin/gcc"
GCC="/home/rasasi/repos/mcv_buildroot/output/host/usr/bin/ccache /usr/bin/gcc"
CXX="/home/rasasi/repos/mcv_buildroot/output/host/usr/bin/ccache /usr/bin/g++"
CPP="/usr/bin/cpp" CFLAGS="-O2
-I/home/rasasi/repos/mcv_buildroot/output/host/include
-I/home/rasasi/repos/mcv_buildroot/output/host/usr/include"
CXXFLAGS="-I/home/rasasi/repos/mcv_buildroot/output/host/include
-I/home/rasasi/repos/mcv_buildroot/output/host/usr/include"
LDFLAGS="-L/home/rasasi/repos/mcv_buildroot/output/host/lib
-L/home/rasasi/repos/mcv_buildroot/output/host/usr/lib
-Wl,-rpath,/home/rasasi/repos/mcv_buildroot/output/host/usr/lib"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG="/home/rasasi/repos/mcv_buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/home/rasasi/repos/mcv_buildroot/output/host/usr/lib/pkgconfig:/home/rasasi/repos/mcv_buildroot/output/host/usr/share/pkgconfig"
PERLLIB="/home/rasasi/repos/mcv_buildroot/output/host/usr/lib/perl"
LD_LIBRARY_PATH="/home/rasasi/repos/mcv_buildroot/output/host/usr/lib:"
CFLAGS="-O2 -I/home/rasasi/repos/mcv_buildroot/output/host/include
-I/home/rasasi/repos/mcv_buildroot/output/host/usr/include"
LDFLAGS="-L/home/rasasi/repos/mcv_buildroot/output/host/lib
-L/home/rasasi/repos/mcv_buildroot/output/host/usr/lib
-Wl,-rpath,/home/rasasi/repos/mcv_buildroot/output/host/usr/lib"  ./configure
--prefix="/home/rasasi/repos/mcv_buildroot/output/host/usr"
--sysconfdir="/home/rasasi/repos/mcv_buildroot/output/host/etc" --enable-shared
--disable-static
configure: Configuring LZO 2.05
checking build system type... Invalid configuration `x86_64-unknown-linux-':
machine `x86_64-unknown-linux' not recognized
configure: error: /bin/sh autoconf/config.sub x86_64-unknown-linux- failed

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
