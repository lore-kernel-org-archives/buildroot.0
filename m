From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 28 Jul 2014 07:07:31 +0000
Subject: [Buildroot] [PATCH] uclibc: build tests after uClibc libs are
 installed to staging location
In-Reply-To: <1406039278-19117-1-git-send-email-abrodkin@synopsys.com>
References: <1406039278-19117-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1406531251.3364.2.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2014-07-22 at 18:27 +0400, Alexey Brodkin wrote:
> If libuClibc is not installed to staging on attempt to build tests following
> errors happen:
> ============
>   TEST_LINK termios/ termios
> .../host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/crt1.o: In function `__start':
> .../build/uclibc/libc/sysdeps/linux/arc/crt1.S:53: undefined reference to `__uClibc_main'
> termios.o: In function `main':
> .../build/uclibc/test/termios/termios.c:13: undefined reference to `printf'
> .../build/uclibc/test/termios/termios.c:14: undefined reference to `printf'
> .../build/uclibc/test/termios/termios.c:16: undefined reference to `stdout'
> .../build/uclibc/test/termios/termios.c:16: undefined reference to `fileno'
> .../build/uclibc/test/termios/termios.c:16: undefined reference to `ioctl'
> .../build/uclibc/test/termios/termios.c:19: undefined reference to `perror'
> .../build/uclibc/test/termios/termios.c:21: undefined reference to `printf'
> .../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `memcpy'
> .../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `malloc'
> .../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `abort'
> .../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `calloc'
> .../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `dl_iterate_phdr'
> .../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `realloc'
> .../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `memset'
> .../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `strlen'
> .../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `free'
> collect2: error: ld returned 1 exit status
> make[3]: *** [termios] Error 1
> ============
> 
> And the simplest solution is to build tests right before installation in
> UCLIBC_INSTALL_TARGET_CMDS which follows UCLIBC_INSTALL_STAGING_CMDS so
> all required libs are in place.
> 
> Interesting note - if one enables uClibc tests after initial full buildroot
> build mentioned errors don't happen. This is because uClibc libc libs are
> already installed to staging. That's why I didn't noticed this problem before.

I'm wondering if there're any comments on this one?

Regards,
Alexey
