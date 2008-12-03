From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Dec 2008 14:58:13 +0100
Subject: [Buildroot] [PATH] adds libusb_0.1.12-13
In-Reply-To: <49366A5C.8020408@walsimou.com>
References: <49366A5C.8020408@walsimou.com>
Message-ID: <20081203145813.10110eb0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 03 Dec 2008 12:15:40 +0100,
Gaye Abdoulaye Walsimou <walsimou@walsimou.com> a ?crit :

> without this little path, when you try to add libusb, buildroot will 
> fail because libusb_0.1.12-12.diff.gz is missing.

I wanted to apply and commit your patch, but ran into troubles while
trying to compile libusb:

make[3]: Entering directory `/home/thomas/local/buildroot2/build_arm/libusb-0.1.12'
depbase=`echo usb.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
        /bin/bash ./libtool --tag=CC   --mode=compile /usr/local/xtools/arm-unknown-linux-uclibcgnueabi//bin/arm-unknown-linux-uclibcgnueabi-gcc -Os  -I/home/thomas/local/buildroot2/build_arm/staging_dir/include -I/home/thomas/local/buildroot2/build_arm/staging_dir/usr/include -I/usr/local/xtools/arm-unknown-linux-uclibcgnueabi//arm-unknown-linux-uclibcgnueabi/include --sysroot /home/thomas/local/buildroot2/build_arm/staging_dir/ -DHAVE_CONFIG_H   -I.  -Werror  -g -O2 -Wall -MT usb.lo -MD -MP -MF $depbase.Tpo -c -o usb.lo usb.c &&\
        mv -f $depbase.Tpo $depbase.Plo
./libtool: line 463: CDPATH: command not found
./libtool: line 1141: func_opt_split: command not found
libtool: Version mismatch error.  This is libtool 2.2.4 Debian-2.2.4-0ubuntu4, but the
libtool: definition of this LT_INIT comes from an older release.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.4 Debian-2.2.4-0ubuntu4
libtool: and run autoconf again.
make[3]: *** [usb.lo] Error 63

I must confess I don't know why autoreconf has to be run on libusb
prior to running ./configure.

I'm sorry, but I don't have the time to investigate this right now,
maybe someone else will pick up the task.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
