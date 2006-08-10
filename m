From: Drew Cohan <drewcohan@gmail.com>
Date: Thu, 10 Aug 2006 16:11:27 -0400
Subject: [Buildroot] Packages that error out during build
In-Reply-To: <20060810175113.GA20615@codepoet.org>
References: <bf61e79a0608100739p4899b15brb988f9063f044978@mail.gmail.com>
	<20060810175113.GA20615@codepoet.org>
Message-ID: <bf61e79a0608101311r59a27c37qf9d9ed60a16d2f0b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some more build errors:

using gcc version 3.4.5 20051201 (Red Hat 3.4.5-2) with buildroot 15795:

Fakeroot:

make -j1 CC=/home/user/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc
-C /home/user/buildroot/build_i686/fakeroot-1.5.8
make[1]: Entering directory `/home/user/buildroot/build_i686/fakeroot-1.5.8'
make  all-recursive
make[2]: Entering directory `/home/user/buildroot/build_i686/fakeroot-1.5.8'
Making all in scripts
make[3]: Entering directory
`/home/user/buildroot/build_i686/fakeroot-1.5.8/scripts'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/user/buildroot/build_i686/fakeroot-1.5.8/scripts'
Making all in doc
make[3]: Entering directory `/home/user/buildroot/build_i686/fakeroot-1.5.8/doc'
po4a -k 0 --variable "srcdir=./" ./po4a/po4a.cfg
/bin/sh: po4a: command not found
make[3]: *** [po4a] Error 127
make[3]: Leaving directory `/home/user/buildroot/build_i686/fakeroot-1.5.8/doc'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/user/buildroot/build_i686/fakeroot-1.5.8'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/user/buildroot/build_i686/fakeroot-1.5.8'
make: *** [/home/user/buildroot/build_i686/fakeroot-1.5.8/faked] Error 2

I understand that my dev envrionment is missing "po4a" but is that a
required binary for compiling fakeroot?  No other module seems to care
that I'm missing the documentation tool "po4a".

Libusb:

/bin/sh ./libtool --mode=compile
/home/user/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-g++
-DHAVE_CONFIG_H   -I.    -c -o usbpp.lo usbpp.cpp
 /home/user/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-g++
-DHAVE_CONFIG_H -I. -c usbpp.cpp  -DPIC
./libtool: line 1092:
/home/user/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-g++:
No such file or directory
make[3]: *** [usbpp.lo] Error 1
make[3]: Leaving directory `/home/user/buildroot/build_i686/libusb-0.1.12'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/user/buildroot/build_i686/libusb-0.1.12'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/user/buildroot/build_i686/libusb-0.1.12'
make: *** [/home/user/buildroot/build_i686/libusb-0.1.12/libusb.la] Error 2

Portage:

(wrong url for download)

wget --passive-ftp -P /home/user/buildroot/dl
http://gentoo.osuosl.org/distfiles/sandbox-1.2.13.tar.bz2
--15:48:29--  http://gentoo.osuosl.org/distfiles/sandbox-1.2.13.tar.bz2
           => `/home/user/buildroot/dl/sandbox-1.2.13.tar.bz2'
Resolving gentoo.osuosl.org... 64.50.236.52, 64.50.238.52
Connecting to gentoo.osuosl.org|64.50.236.52|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
15:48:29 ERROR 404: Not Found.

make: *** [/home/user/buildroot/dl/sandbox-1.2.13.tar.bz2] Error 1

-- Drew
