From: Ozgun <ozgun.gunay@gmail.com>
Date: Wed, 1 Feb 2012 09:58:33 +0200
Subject: [Buildroot] lib files
Message-ID: <CAPeX=+uthjbtNySUJ7j0sGG3Xzd=iF-uwT2=85VDGcV_iSN7-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I used chroot environment to get the error log easily. Normally I use the
rootfs in a embedded pc.
But the error message are same.

When I try to run application (./affine), it gives "file not found" error.

When I check the dependency (ldd affine)  below log occurs. (even the file
compiled static.)
It looks like dynamic library loader finds the .so files under /lib but
couldn't find .so files under /usr/lib

I used crosstool glibc instead of uclibc toolchain and the problem solved.
(with same etc folder)
But I want to know what cause this problem.

thanks,
Ozgun



    libdl.so.0 => /lib/libdl.so.0 (0xb7788000)
    libc.so.0 => /lib/libc.so.0 (0xb7733000)
    ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0xb778e000)
    ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0xb77f9000)
    libc.so.0 => /lib/libc.so.0 (0xb783d000)
    ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0xb7894000)
    libc.so.0 => /lib/libc.so.0 (0xb777c000)
    ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0xb77d3000)
checking sub-depends for '/usr/lib/libSM.so.6'
checking sub-depends for '/usr/lib/libICE.so.6'
checking sub-depends for '/usr/lib/libXrender.so.1'
checking sub-depends for '/usr/lib/libXcursor.so.1'
checking sub-depends for '/usr/lib/libfontconfig.so.1'
checking sub-depends for '/usr/lib/libfreetype.so.6'
checking sub-depends for '/usr/lib/libXext.so.6'
checking sub-depends for '/usr/lib/libX11.so.6'
checking sub-depends for 'not found'
checking sub-depends for 'not found'
checking sub-depends for '/usr/lib/libGL.so.1'
checking sub-depends for '/lib/libpthread.so.0'
checking sub-depends for '/usr/lib/libstdc++.so.6'
checking sub-depends for 'not found'
checking sub-depends for '/lib/libgcc_s.so.1'
checking sub-depends for 'not found'
checking sub-depends for '/lib/libc.so.0'
checking sub-depends for '/usr/lib/libXfixes.so.3'
checking sub-depends for '/usr/lib/libz.so.1'
checking sub-depends for '/usr/lib/libbz2.so.1.0'
checking sub-depends for '/usr/lib/libexpat.so.1'
checking sub-depends for '/usr/lib/libxcb.so.1'
checking sub-depends for '/lib/libdl.so.0'
checking sub-depends for '/usr/lib/libXdamage.so.1'
checking sub-depends for '/usr/lib/libXxf86vm.so.1'
checking sub-depends for '/usr/lib/libdrm.so.2'
checking sub-depends for '/lib/libm.so.0'
checking sub-depends for '/usr/lib/libXau.so.6'
checking sub-depends for '/usr/lib/libXdmcp.so.6'
    libSM.so.6 => /usr/lib/libSM.so.6 (0x00000000)
    libICE.so.6 => /usr/lib/libICE.so.6 (0x00000000)
    libXrender.so.1 => /usr/lib/libXrender.so.1 (0x00000000)
    libXcursor.so.1 => /usr/lib/libXcursor.so.1 (0x00000000)
    libfontconfig.so.1 => /usr/lib/libfontconfig.so.1 (0x00000000)
    libfreetype.so.6 => /usr/lib/libfreetype.so.6 (0x00000000)
    libXext.so.6 => /usr/lib/libXext.so.6 (0x00000000)
    libX11.so.6 => /usr/lib/libX11.so.6 (0x00000000)
    libdl.so.2 => not found (0x00000000)
    librt.so.1 => not found (0x00000000)
    libGL.so.1 => /usr/lib/libGL.so.1 (0x00000000)
    libpthread.so.0 => /lib/libpthread.so.0 (0x00000000)
    libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00000000)
    libm.so.6 => not found (0x00000000)
    libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x00000000)
    libc.so.6 => not found (0x00000000)
    libc.so.0 => /lib/libc.so.0 (0x00000000)
    libXfixes.so.3 => /usr/lib/libXfixes.so.3 (0x00000000)
    libz.so.1 => /usr/lib/libz.so.1 (0x00000000)
    libbz2.so.1.0 => /usr/lib/libbz2.so.1.0 (0x00000000)
    libexpat.so.1 => /usr/lib/libexpat.so.1 (0x00000000)
    libxcb.so.1 => /usr/lib/libxcb.so.1 (0x00000000)
    libdl.so.0 => /lib/libdl.so.0 (0x00000000)
    libXdamage.so.1 => /usr/lib/libXdamage.so.1 (0x00000000)
    libXxf86vm.so.1 => /usr/lib/libXxf86vm.so.1 (0x00000000)
    libdrm.so.2 => /usr/lib/libdrm.so.2 (0x00000000)
    libm.so.0 => /lib/libm.so.0 (0x00000000)
    /lib/ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x00000000)
    libXau.so.6 => /usr/lib/libXau.so.6 (0x00000000)
    libXdmcp.so.6 => /usr/lib/libXdmcp.so.6 (0x00000000)
    not a dynamic executable





Date: Tue, 31 Jan 2012 17:22:42 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] lib files
> Message-ID: <20120131172242.3a84c018@skate>
> Content-Type: text/plain; charset=UTF-8
>
> Le Tue, 31 Jan 2012 18:01:01 +0200,
> Ozgun <ozgun.gunay@gmail.com> a ?crit :
>
> > I built rootfs with opengl and QT without problem. (The compiled examples
> > of QT also run in ubuntu without problem)
> > But when I tried to run these qt examples in created rootfs, it gives
> "file
> > not found" error. (I both tried these examples static and shared
> compiled.)
>
> Can you show exactly how this error appears? If it appears when you try
> to run the application, then it usually means that the kernel can't
> find your dynamic library loader.
>
> I never use Buildroot to generate a filesystem in which I'm chroot-ing.
> If the target architecture is the same as the host, it should work, but
> there might be issues, it's not the common use case for Buildroot
> (usually, you take the generated root filesystem image and put it on a
> target device).
>
> > Then I cheked the dependency of application, you can see results below.
> > The /usr/lib folder has the lib files but in a .a format.
> > For example libm.a is exist but libm.so absent.
>
> The shared versions of the C library and related libraries (libm, etc.)
> are in /lib, not in /usr/lib.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120201/05c9755a/attachment.html>
