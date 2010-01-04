From: Robert Randall <robert@r3ware.com>
Date: Mon, 4 Jan 2010 15:26:15 -0600
Subject: [Buildroot] hacking in new packages...
Message-ID: <C7E92A65-48FF-40DA-A1FE-2E9873B19839@r3ware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm new to hacking in new packages and I'm having an issue with libtool getting a bit crabby.

>>> attr 2.4.43-1 Building
PATH="/home/robert/build2/buildroot/output/host/bin:/home/robert/build2/buildroot/output/host/usr/bin:/home/robert/build2/buildroot/output/host/usr/sbin/:/home/robert/build2/buildroot/output/toolchain/bin:/home/robert/x-tools/arm-pranah-linux-gnu/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/ptxdist/bin"  /usr/bin/make -j1  -C /home/robert/build2/buildroot/output/build/attr-2.4.43-1/
make[1]: Entering directory `/home/robert/build2/buildroot/output/build/attr-2.4.43-1'
=== include ===
rm -f attr
ln -s . attr
=== libmisc ===
/usr/bin/libtool --mode=compile /home/robert/x-tools/arm-pranah-linux-gnu/bin/arm-pranah-linux-gnu-gcc -Os -pipe -Os -g2 --sysroot /home/robert/build2/buildroot/output/staging/ -g -O2  -funsigned-char -fno-strict-aliasing -Wall -DVERSION=\"2.4.43\" -DLOCALEDIR=\"/usr/share/locale\" -DPACKAGE=\"attr\" -I../include -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64   -c quote.c
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
make[2]: *** [quote.lo] Error 1
make[1]: *** [default] Error 2
make[1]: Leaving directory `/home/robert/build2/buildroot/output/build/attr-2.4.43-1'
make: *** [/home/robert/build2/buildroot/output/build/attr-2.4.43-1/.stamp_built] Error 2

Is there a polite or preferred way to fix this or do I just patch/hack the makefile that comes with the package to fix-up the LIBTOOL tags?

Regards,
Robert.
