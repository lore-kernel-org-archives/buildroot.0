From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Mar 2020 15:04:43 +0100
Subject: [Buildroot] Help: error LONG_BIT definition appears wrong for
 platform
In-Reply-To: <CAA0OSwgGcbzMe9o35FRqmLBZ5PFMx=1+fDYyiqq0yLk5YJyNpQ@mail.gmail.com>
References: <CAA0OSwgGcbzMe9o35FRqmLBZ5PFMx=1+fDYyiqq0yLk5YJyNpQ@mail.gmail.com>
Message-ID: <20200313150443.682fdc5a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Mar 2020 18:26:38 +0800
Mark Leo Sumadero <fryu771@gmail.com> wrote:

> /home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc

This is the cross-compiler: good!

> -prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -Os  -DLINUX -D_REENTRANT -D_GNU_SOURCE
>  -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
>  -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
> 
> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../../../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m

This is a path to header of host components: BAD!

And this is where your problem is, this header path should *NOT* be
there when you cross-compile.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
