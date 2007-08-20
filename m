From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 21 Aug 2007 00:30:00 +0200
Subject: [Buildroot] building tiny-x or x11R7 with latest snapshot
References: <022b01c7e35f$9df9f1b0$2600a8c0@engineering5>
Message-ID: <0ad801c7e382$8bb6dfe0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>I receive errors if I want to build either tiny-x or the full X11R7.  has
> anyone else had these?  Is this something in the environment?
> 
> 
> 
> I have a snapshot from a couple of months ago and I can build tiny-x without
> a problem on it.
> 
> 
> 
> X11R7:
[snip]

> 
> 
> tiny-x: 
> 
> making imake with BOOTSTRAPCFLAGS= in config/imake
> 
> /home/christopher/sb/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclib
> c-gcc -Os -pipe
> -I/home/christopher/sb/buildroot/build_arm/staging_dir/usr/include
> -I/home/christopher/sb/buildroot/build_arm/staging_dir/include
> -mtune=arm920t -o ccimake  -O -I../../include
> -I../../imports/x11/include/X11 ccimake.c
> 

As you can see from above, you are compiling ccimage.c using the ARM cross compiler.

> /home/christopher/sb/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclib
> c-gcc -Os -pipe
> -I/home/christopher/sb/buildroot/build_arm/staging_dir/usr/include
> -I/home/christopher/sb/buildroot/build_arm/staging_dir/include
> -mtune=arm920t -c  -O -I../../include -I../../imports/x11/include/X11
> `./ccimake` imake.c
> 
> /bin/sh: ./ccimake: cannot execute binary file

And now you try to run the ARM binary on your PC.

> 
[snip]
> ./config/imake/imake -I./config/cf  -s ./config/makedepend/Makefile.proto -f
> ./config/makedepend/Imakefile -DTOPDIR=../.. -DCURDIR=./config/makedepend
> 
> ./config/imake/imake: ./config/imake/imake: cannot execute binary file
> 

I have seen the same problem, tinyx simply does not build.
Xorg does not build either, and x11r7 is still work in progress.



Best Regards
Ulf Samuelsson 
