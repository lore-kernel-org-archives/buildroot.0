From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Wed, 26 Feb 2014 20:53:17 +0100
Subject: [Buildroot] Few questions external toolchain
In-Reply-To: <CAAXf6LUYGTL2BQJY07JMu5WmLb7qxf+Mb6AQvi-EWYvYxi3EXA@mail.gmail.com>
References: <530B8CEA.90306@gmail.com> <530C6DD2.4070605@gmail.com>
 <CAAXf6LUbFzxUgz+kkes-f7TO0as40kDuaF+v6BG2neWEBeR-hw@mail.gmail.com>
 <530E1C12.9090400@gmail.com>
 <CAAXf6LUYGTL2BQJY07JMu5WmLb7qxf+Mb6AQvi-EWYvYxi3EXA@mail.gmail.com>
Message-ID: <530E462D.50600@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Il 26/02/2014 20:42, Thomas De Schampheleire ha scritto:

> Can you run following command: 
> /home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc -print-file-name=crt1.o 
> and verify that the reported file exists? What is the output? 

The output is:

crt1.o

Furthermore:

find -name crt1.o
./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crt1.o


> Normally you shouldn't give any special environment flags. You could 
> also try to compile a simple hello world program with that compiler in 
> output/host/usr/bin, to see if that works correctly or not.

Compiling an hello world program with the (symbolic link) in 
output/host/usr/bin/arm-fsl-linux-gnueabi-gcc leads to the same linker 
errors described in the previous post.

But the original compiler 
(/home/marco/dev/fsl-linaro-toolchain/bin/arm-fsl-linux-gnueabi-gcc) 
works fine with the same hello world.

Thanks again!
Marco
