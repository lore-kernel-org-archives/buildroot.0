From: Mike Davies <busybox_mail@rovoreed.com>
Date: Mon, 05 Dec 2011 12:22:12 +0000
Subject: [Buildroot] Problem building package usbutils under
 buildroot-2011.11
In-Reply-To: <20111204214939.29b10ebe@skate>
References: <1323013713.2865.9.camel@ceri>  <20111204214939.29b10ebe@skate>
Message-ID: <1323087732.3037.2.camel@ceri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2011-12-04 at 21:49 +0100, Thomas Petazzoni wrote:
> Le Sun, 04 Dec 2011 15:48:33 +0000,
> Mike Davies <busybox_mail@rovoreed.com> a ?crit :
> 
> > /bin/sh ../libtool --tag=CC   --mode=link /home/mike/br/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc  -Os -Wall  -Os  -fPIC -DPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -o usbhid-dump usbhid-dump.o ../lib/libusbhid_dump.la -lusb-1.0 
> > libtool: link: /home/mike/br/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc -Os -Wall -Os -fPIC -DPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o usbhid-dump usbhid-dump.o  ../lib/.libs/libusbhid_dump.a /usr/local/lib/libusb-1.0.so -lrt -pthread -Wl,-rpath -Wl,/usr/local/lib -Wl,-rpath -Wl,/usr/local/lib
> 
> Here it's linking against /usr/local/lib/libusb-1.0.so and not the
> libusb that has been built by Buildroot against uClibc and installed in
> $(STAGING_DIR). A quick, but very ugly, workaround is to uninstall
> libusb-dev from your development machine. But we need to find why
> usbutils is preferring the host libusb instead of the one built by
> Buildroot.
> 


Thanks for the reply. I can confirm I have now built the package by
moving the following files (and then putting them back)

[root at ceri br]# ls -al /usr/local/lib/libusb*
-rw-r--r--. 1 root root 316586 May 18  2011 /usr/local/lib/libusb-1.0.a
-rwxr-xr-x. 1 root root    955 May 18  2011 /usr/local/lib/libusb-1.0.la
lrwxrwxrwx. 1 root root     19 May 18  2011 /usr/local/lib/libusb-1.0.so -> libusb-1.0.so.0.0.0
lrwxrwxrwx. 1 root root     19 May 18  2011 /usr/local/lib/libusb-1.0.so.0 -> libusb-1.0.so.0.0.0
-rwxr-xr-x. 1 root root 195061 May 18  2011 /usr/local/lib/libusb-1.0.so.0.0.0
[root at ceri br]#


Mike
