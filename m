From: Mike Davies <busybox_mail@rovoreed.com>
Date: Sun, 04 Dec 2011 15:48:33 +0000
Subject: [Buildroot] Problem building package usbutils under
	buildroot-2011.11
Message-ID: <1323013713.2865.9.camel@ceri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Have a problem building the package usbutils under buildroot-2011.11.

I'm supposed to be using uClibc but it appears to be trying to link with
libraries in my hosts root filesystem i.e. glibc stuff

i.e.

make[5]: Entering directory `/home/mike/buildroot-2011.11/output/build/usbutils-004/usbhid-dump/src'
/home/mike/br/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I..   -I/home/mike/br/output/build/usbutils-004/usbhid-dump -I/home/mike/br/output/build/usbutils-004/usbhid-dump/include -D_GNU_SOURCE -DNDEBUG   -Os -Wall  -Os  -fPIC -DPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -MT usbhid-dump.o -MD -MP -MF .deps/usbhid-dump.Tpo -c -o usbhid-dump.o usbhid-dump.c
mv -f .deps/usbhid-dump.Tpo .deps/usbhid-dump.Po
/bin/sh ../libtool --tag=CC   --mode=link /home/mike/br/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc  -Os -Wall  -Os  -fPIC -DPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -o usbhid-dump usbhid-dump.o ../lib/libusbhid_dump.la -lusb-1.0 
libtool: link: /home/mike/br/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc -Os -Wall -Os -fPIC -DPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o usbhid-dump usbhid-dump.o  ../lib/.libs/libusbhid_dump.a /usr/local/lib/libusb-1.0.so -lrt -pthread -Wl,-rpath -Wl,/usr/local/lib -Wl,-rpath -Wl,/usr/local/lib
/home/mike/buildroot-2011.11/output/host/usr/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.2/../../../../x86_64-unknown-linux-uclibc/bin/ld: warning: librt.so.1, needed by /usr/local/lib/libusb-1.0.so, not found (try using -rpath or -rpath-link)
/home/mike/buildroot-2011.11/output/host/usr/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.2/../../../../x86_64-unknown-linux-uclibc/bin/ld: warning: libc.so.6, needed by /usr/local/lib/libusb-1.0.so, not found (try using -rpath or -rpath-link)
/usr/local/lib/libusb-1.0.so: undefined reference to `memset at GLIBC_2.2.5'
/usr/local/lib/libusb-1.0.so: undefined reference to `clock_gettime at GLIBC_2.2.5'
/usr/local/lib/libusb-1.0.so: undefined reference to `strlen at GLIBC_2.2.5'

... etc (there are lots undefines)

I'm not sure if I've ever tried building this package before, and I'm
not sure how to fix the problem.

Can anyone offer advice ?
