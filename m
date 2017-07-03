From: Mark Jackson <mpfj-list@newflow.co.uk>
Date: Mon, 3 Jul 2017 16:14:22 +0100
Subject: [Buildroot] Unable to compile current master
Message-ID: <d7a64db4-2f26-6f27-98e1-6017ca8a95a5@newflow.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to bring an old 2012 buildroot project up-to-date, so to test my current setup I've branched the git master and tried:-

$ git checkout origin/master -b master
$ git reset --hard origin/master
$ make clean
$ make beaglebone_defconfig
$ make

But this fails when compiling gcc with the following:-

...
/usr/bin/g++ -fno-PIE -c   -O2 -I/home/mpfj/buildroot/output/host/usr/include -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE   -fno-exceptions -fno-rtti -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. -I. -I../../gcc -I../../gcc/. -I../../gcc/../include -I../../gcc/../libcpp/include -I/home/mpfj/buildroot/output/host/usr/include -I/home/mpfj/buildroot/output/host/usr/include -I/home/mpfj/buildroot/output/host/usr/include  -I../../gcc/../libdecnumber -I../../gcc/../libdecnumber/dpd -I../libdecnumber -I../../gcc/../libbacktrace   -o insn-extract.o -MT insn-extract.o -MMD -MP -MF ./.deps/insn-extract.TPo insn-extract.c
Makefile:2201: recipe for target 's-attrtab' failed
make[3]: *** [s-attrtab] Killed
make[3]: *** Waiting for unfinished jobs....
rm gcc.pod
Makefile:4113: recipe for target 'all-gcc' failed
make[2]: *** [all-gcc] Error 2
package/pkg-generic.mk:227: recipe for target '/home/mpfj/buildroot/output/build/host-gcc-initial-6.3.0/.stamp_built' failed
make[1]: *** [/home/mpfj/buildroot/output/build/host-gcc-initial-6.3.0/.stamp_built] Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

Can anyone help out ?

If it's any help, the "gcc" portion of the build log is here (https://pastebin.com/PRaPh5n1)
