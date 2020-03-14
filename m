From: Mark Leo Sumadero <fryu771@gmail.com>
Date: Sat, 14 Mar 2020 11:17:26 +0800
Subject: [Buildroot] Help: error LONG_BIT definition appears wrong for
 platform
In-Reply-To: <20200313150443.682fdc5a@windsurf>
References: <CAA0OSwgGcbzMe9o35FRqmLBZ5PFMx=1+fDYyiqq0yLk5YJyNpQ@mail.gmail.com>
 <20200313150443.682fdc5a@windsurf>
Message-ID: <CAA0OSwjn+8OKw_PT-scyrH1cC5TPvnDpLq0mMDVe3oN+dKaTfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the reply, What value should i provide then, if i remove it i'm
getting this error now "arm-buildroot-linux-uclibcgnueabihf-gcc: ERROR:
unsafe header/library path used in cross-compilation:
'-I/usr/include/python2.7'"

>
/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/build-1/libtool
--silent --mode=compile
/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os  -DLINUX -D_REENTRANT -D_GNU_SOURCE
 -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
 -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1

-I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
-I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../../../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-I/usr/include/python2.7 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DNDEBUG -D_FORTIFY_SOURCE=2  -c -o
src/server/mod_wsgi.lo src/server/mod_wsgi.c && touch
src/server/mod_wsgi.slo
arm-buildroot-linux-uclibcgnueabihf-gcc: ERROR: unsafe header/library path
used in cross-compilation: '-I/usr/include/python2.7'
apxs:Error: Command failed with rc=65536

Sorry this is my first time adding a package. Is  a package that need to be
patch?

On Fri, Mar 13, 2020 at 10:04 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Fri, 13 Mar 2020 18:26:38 +0800
> Mark Leo Sumadero <fryu771@gmail.com> wrote:
>
> >
> /home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
>
> This is the cross-compiler: good!
>
> > -prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > -D_FILE_OFFSET_BITS=64 -Os  -DLINUX -D_REENTRANT -D_GNU_SOURCE
> >
> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
> >
> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
> >
> >
> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
> >
> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../../../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
> > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
> >
> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m
>
> This is a path to header of host components: BAD!
>
> And this is where your problem is, this header path should *NOT* be
> there when you cross-compile.
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200314/2cce121c/attachment.html>
