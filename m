From: Will Newton <will.newton@gmail.com>
Date: Thu, 24 May 2012 10:48:21 +0100
Subject: [Buildroot] GNUTLS
In-Reply-To: <CAG6aBkVLcuc-_p9WyV12pyVCP9vcn7Kcjy7d4OdzSduqDzOv2w@mail.gmail.com>
References: <CAG6aBkWMBN9uP-pTWo-MoyH7iUBG0mtNgEXdvKff1tDnVf0+VA@mail.gmail.com>
 <CAFbHwiQJN9RaoNsOhjomvEB8gbsMSqa_GtFxp_MPv=-qcWwBwA@mail.gmail.com>
 <CAG6aBkVLcuc-_p9WyV12pyVCP9vcn7Kcjy7d4OdzSduqDzOv2w@mail.gmail.com>
Message-ID: <CAFbHwiQokFq=8c5kyB-RbpPyvwn8tgz8+mzj6K7p8u88fSqL=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 24, 2012 at 10:28 AM, Nigel Sollars <nsollars@gmail.com> wrote:
> Hi will,
>
> Fair enough, sorry about that.
>
> Here is the one from the gnutls directory.
>
> Regards
> Nigel

Well, this is the error:

configure:8648: checking for libgcrypt
configure:8670:
/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-std=gnu99 -o conftest  -pipe -Os  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include
 conftest.c /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libgcrypt.so
/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libgpg-error.so
/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libintl.so
/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libc.so
-Wl,-rpath -Wl,/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
 >&5
/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.3/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld.real:
cannot find /lib/libc.so.0
/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.3/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld.real:
cannot find /usr/lib/uclibc_nonshared.a
/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.3/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld.real:
cannot find /lib/ld-uClibc.so.0
collect2: ld returned 1 exit status

Unfortunately I'm not sure what's causing it. It looks like your
toolchain may be broken in some way though. Perhaps someone familiar
with arm toolchains can shed some light on it?
