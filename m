From: Rex Ashbaugh <rexa@xeratech.com>
Date: Wed, 21 May 2008 06:15:33 -0700
Subject: [Buildroot] no file will execute - shell said always not found
In-Reply-To: <20080521085839.230490@gmx.net>
References: <20080521085839.230490@gmx.net>
Message-ID: <6311fe0b0805210615k7416e06eu8c1be7d31fb91eb9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The FILE_TO_EXECUTE and the rootfs should be built with the same toolchain,
same linux headers, etc.
Otherwise incompatibilities can result. You can't mix and match.
-Rex

On Wed, May 21, 2008 at 1:58 AM, Maik Steuer <Maik.Steuer@gmx.de> wrote:

> Hello,
>
> at the moment I build a toolchain with buildroot for arm xscale (pxa270)
> with the following config:
>
> Using built-in specs.
> Target: arm-linux-uclibc
> Configured with: /usr/src/buildroot/toolchain_build_arm/gcc-4.2.3/configure
> --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu
> --target=arm-linux-uclibc --enable-languages=c,c++
> --with-sysroot=/usr/src/buildroot/build_arm/staging_dir
> --with-build-time-tools=/usr/src/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin
> --enable-__cxa_atexit --enable-c99 --enable-long-long --enable-symvers=gnu
> --enable-shared --with-gmp=/usr/src/buildroot/toolchain_build_arm/gmp
> --with-mpfr=/usr/src/buildroot/toolchain_build_arm/mpfr --disable-nls
> --enable-threads --disable-multilib --with-float=soft
> Thread model: posix
> gcc version 4.2.3
>
> I can compile different things, but the shell on the embedded system says
> only "-sh: ./FILE_TO_EXECUTE: not found" after execute.
>
> Are my gcc configs wrong?
>
> Other toolchains (gcc 4.0.0) for example ELDK from DENX works fine.
> My rootfilesystem is an image from toradex and works also fine.
>
> Is it possible that I have to copy something else to the rootfilesystem,
> which is specific to the actually gcc-version?
>
> I hope sb can help me.
>
> Regards
>
> Maik
> --
> Ist Ihr Browser Vista-kompatibel? Jetzt die neuesten
> Browser-Versionen downloaden: http://www.gmx.net/de/go/browser
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080521/542c58da/attachment.htm 
