From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2011 21:49:39 +0100
Subject: [Buildroot] Problem building package usbutils under
 buildroot-2011.11
In-Reply-To: <1323013713.2865.9.camel@ceri>
References: <1323013713.2865.9.camel@ceri>
Message-ID: <20111204214939.29b10ebe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 04 Dec 2011 15:48:33 +0000,
Mike Davies <busybox_mail@rovoreed.com> a ?crit :

> /bin/sh ../libtool --tag=CC   --mode=link /home/mike/br/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc  -Os -Wall  -Os  -fPIC -DPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -o usbhid-dump usbhid-dump.o ../lib/libusbhid_dump.la -lusb-1.0 
> libtool: link: /home/mike/br/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc -Os -Wall -Os -fPIC -DPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o usbhid-dump usbhid-dump.o  ../lib/.libs/libusbhid_dump.a /usr/local/lib/libusb-1.0.so -lrt -pthread -Wl,-rpath -Wl,/usr/local/lib -Wl,-rpath -Wl,/usr/local/lib

Here it's linking against /usr/local/lib/libusb-1.0.so and not the
libusb that has been built by Buildroot against uClibc and installed in
$(STAGING_DIR). A quick, but very ugly, workaround is to uninstall
libusb-dev from your development machine. But we need to find why
usbutils is preferring the host libusb instead of the one built by
Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
