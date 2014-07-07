From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jul 2014 00:02:07 +0200
Subject: [Buildroot] xserver_xorg-server-1.15.1 crash on RaspberryPi
 when compiled with gcc-4.9
In-Reply-To: <trinity-e2cf4efe-9b52-4b1c-a42e-28a15bb2f616-1402178338808@3capp-gmx-bs49>
References: <trinity-e2cf4efe-9b52-4b1c-a42e-28a15bb2f616-1402178338808@3capp-gmx-bs49>
Message-ID: <20140708000207.272e4d2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sat, 7 Jun 2014 23:58:58 +0200, Peter Seiderer wrote:

> running xserver (driver fbdev) on RaspberryPi crashes when compiled with gcc-4.9 (-Os).
> 
> Steps to reproduce (with buildroot-2014.05 release and additonal dillo package):

> Program received signal SIGSEGV, Segmentation fault.
> fbGlyphs (op=<optimized out>, pSrc=0x1, pDst=0x4, maskFormat=0x3b9d90, xSrc=0, ySrc=0, nlist=6, list=0xbefff490, glyphs=0x1)
>     at fbpict.c:140
> 140                 glyph = *glyphs++;
> (gdb) p glyphs
> $1 = (GlyphPtr *) 0x1

Thanks for the report. I wanted to let you know that I'm also seeing
the issue here, while testing the gtk-demo application under Xfbdev on
Qemu/ARM. I am also building with a gcc 4.9.x based toolchain, the
Linaro 14.05 toolchain. I haven't tested yet to rebuild with gcc 4.8.x
to see the difference.

Have you investigated the problem a bit more? Does it look like a
compiler issue?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
