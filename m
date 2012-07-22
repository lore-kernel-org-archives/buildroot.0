From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jul 2012 15:23:14 +0200
Subject: [Buildroot] =?utf-8?b?5Zue5aSNOiBEb2VzIGFueW9uZSBlbmNvdW50ZXIg?=
 =?utf-8?q?issue_as_/usr/bin/ld=3A_cannot_find_-lc?=
In-Reply-To: <201207222045094067924@163.com> (Zewan's message of "Sun, 22 Jul
 2012 20:45:09 +0800")
References: <201207222031244996643@163.com> <201207222045094067924@163.com>
Message-ID: <87obn8orp9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zewan" == Zewan  <amoid@163.com> writes:

Hi,

Please send buildroot mails to the buildroot mailing list, and not
directly to me.

 Zewan> my log messages as following.
 Zewan> host-module-init-tools 3.15 Building
 Zewan> PATH=/home/amoid/work/buildroot-2012.05/output/host/bin:/home/amoid/work/
 Zewan> buildroot-2012.05/output/host/usr/bin:/usr/lib/qt-3.3/bin:/usr/lib/ccache:/usr/
 Zewan> local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/amoid/bin:/opt/
 Zewan> FriendlyARM/toolschain/4.4.3/bin LD_LIBRARY_PATH="/home/amoid/work/
 Zewan> buildroot-2012.05/output/host/usr/lib:" PKG_CONFIG="/home/amoid/work/
 Zewan> buildroot-2012.05/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/
 Zewan> " PKG_CONFIG_LIBDIR="/home/amoid/work/buildroot-2012.05/output/host/usr/lib/
 Zewan> pkgconfig" PERLLIB="/home/amoid/work/buildroot-2012.05/output/host/usr/lib/
 Zewan> perl"  /usr/bin/make -j2  -C /home/amoid/work/buildroot-2012.05/output/build/
 Zewan> host-module-init-tools-3.15/
 Zewan> make[1]: Entering directory `/home/amoid/work/buildroot-2012.05/output/build/
 Zewan> host-module-init-tools-3.15'
 Zewan> MAKE i686-pc-linux-gnu : 0 * all-all
 Zewan> make[2]: Entering directory `/home/amoid/work/buildroot-2012.05/output/build/
 Zewan> host-module-init-tools-3.15/build'
 Zewan> /usr/lib/ccache/gcc  -O2 -I/home/amoid/work/buildroot-2012.05/output/host/
 Zewan> include -I/home/amoid/work/buildroot-2012.05/output/host/usr/
 Zewan> include -Wunused -Wall -static -L/home/amoid/work/buildroot-2012.05/output/host
 Zewan> /lib -L/home/amoid/work/buildroot-2012.05/output/host/usr/lib -Wl,-rpath,/home/
 Zewan> amoid/work/buildroot-2012.05/output/host/usr/
 Zewan> lib -o insmod.static insmod.o libmodtools.a 
 Zewan> /usr/bin/ld: cannot find -lc

This is (was?) a FAQ:

module-init-tools fails to build with cannot find -lc

If the build of module-init-tools for the host fails with:
   /usr/bin/ld: cannot find -lc

then probably you are running a Fedora (or similar) distribution, and
you should install the glibc-static package. This is because the
module-init-tools build - process wants to link statically against the C
library.

This problem is btw fixed in git since ~1 month.

-- 
Bye, Peter Korsgaard
