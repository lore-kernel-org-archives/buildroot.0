From: Doha Ehab <dohaehab@gmail.com>
Date: Thu, 4 Jan 2018 10:34:05 +0200
Subject: [Buildroot] GNU Bison package
Message-ID: <CAEjFr-Z5vQ3uaFmDvh4pBs4VeTCH5Qyn9+CA7ZBHqFQn3vOcsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
 I have generated uclibc toolchain using buildroot-2017.02-rc3. I am trying
to use it to cross compile Gnu GCC for Android. I have checked flex and
gettext from target packages-> development tools but I cannot find bison
library and I always get this error:

/home/Desktop/gcc_5/missing bison -y --name-prefix=__gettext --output
plural.c ../.././intl/plural.y
/home/Desktop/gcc_5/missing: 81: /home/Desktop/gcc_5/missing: bison: not
found
WARNING: 'bison' is missing on your system.
         You should only need it if you modified a '.y' file.
         You may want to install the GNU Bison package:
         <http://www.gnu.org/software/bison/>
Makefile:136: recipe for target 'plural.c' failed
make[2]: *** [plural.c] Error 127
make[2]: Leaving directory
'/home/Desktop/gcc_5/host-aarch64-buildroot-linux-uclibc/intl'
Makefile:5345: recipe for target 'all-intl' failed
make[1]: *** [all-intl] Error 2
make[1]: Leaving directory '/home/Desktop/gcc_5'
Makefile:855: recipe for target 'all' failed
make: *** [all] Error 2

My configuration options:
./configure --prefix=/home/Desktop/gcc_5/build/
CC=/home/Desktop/buildroot-2017.02-rc3/output/host/usr/bin/aarch64-linux-gcc
CXX=/home/Desktop/buildroot-2017.02-rc3/output/host/usr/bin/aarch64-linux-g++
CFLAGS="-I/home/Desktop/buildroot-2017.02-rc3/output/host/usr/include/
-fPIC -static -lgmp -lmpfr -lmpc"
LDFLAGS="-L/home/Desktop/buildroot-2017.02-rc3/output/host/usr/lib"
--host=aarch64-buildroot-linux-uclibc  --disable-shared --disable-f77
--disable-fc --disable-fortran
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180104/dbba4c2b/attachment.html>
