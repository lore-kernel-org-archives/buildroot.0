From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 28 Mar 2018 20:57:09 +0200
Subject: [Buildroot] Allow building a toolchain without (non-trivial)
 dependencies
Message-ID: <CADYdroNk0nCYZTZt6aVact8URP_fDu5x9pPkKRMHoYEw_KtmdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I would like to have an option to make a reasonable "portable" toolchain,
means no dependencies apart from the C libs (libc libm libdl).

As you see below, I cant run the toolchain without keeping the libs
around and setting the LD path,
limiting its use outside the (locally built) rootfs.

ie. all support libs from gcc should be optionally linked statically

$ ldd cc1plus
linux-vdso.so.1 (0x00007ffdacd5e000)
libisl.so.15 => /usr/lib/x86_64-linux-gnu/libisl.so.15 (0x00007f591aad0000)
libmpc.so.3 => /usr/lib/x86_64-linux-gnu/libmpc.so.3 (0x00007f591a8b7000)
libmpfr.so.4 => not found
libgmp.so.10 => /usr/lib/x86_64-linux-gnu/libgmp.so.10 (0x00007f591a633000)
libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f591a42f000)
libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f591a09c000)
libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f5919ce2000)
/lib64/ld-linux-x86-64.so.2 (0x00007f591ae78000)
libmpfr.so.6 => /usr/lib/x86_64-linux-gnu/libmpfr.so.6 (0x00007f5919a60000)

Kind regards,
Norbert
