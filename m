From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 10 Oct 2019 23:03:16 -0300
Subject: [Buildroot] beaglebone_qt5 does not build since commit a7914499b80
Message-ID: <CAJ4jsae64FAUnKVqj2wEbYpEaLC31=gJuZuGCV3ZLjLbOP6djQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

configs/beaglebone_qt5_defconfig contain BR2_GCC_VERSION_5_X=y because
the Linux 4.1 kernel used on the board does not compile with gcc 6.x
and later.

At the same time it contains BR2_TOOLCHAIN_BUILDROOT_GLIBC=y, which
invalidated the CGG version selection because
since commit a7914499b80 glbc requires GCC 6.2 or later.

Switching to uClibc is not an option, since ti-sgx-um requires glibc.

-- 
Carlos Santos <unixmania@gmail.com>
