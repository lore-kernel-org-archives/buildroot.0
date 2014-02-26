From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 26 Feb 2014 20:42:29 +0100
Subject: [Buildroot] Few questions external toolchain
In-Reply-To: <530E1C12.9090400@gmail.com>
References: <530B8CEA.90306@gmail.com> <530C6DD2.4070605@gmail.com>
 <CAAXf6LUbFzxUgz+kkes-f7TO0as40kDuaF+v6BG2neWEBeR-hw@mail.gmail.com>
 <530E1C12.9090400@gmail.com>
Message-ID: <CAAXf6LUYGTL2BQJY07JMu5WmLb7qxf+Mb6AQvi-EWYvYxi3EXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Wed, Feb 26, 2014 at 5:53 PM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
[..]
> configure:3469: checking whether the C compiler works
> configure:3491:
> /home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
> -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -lm conftest.c  >&5
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find crt1.o: No such file or directory
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find crti.o: No such file or directory
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find -lm
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find -lgcc_s
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find -lc
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find -lgcc_s
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find crtn.o: No such file or directory
> collect2: ld returned 1 exit status
> configure:3495: $? = 1
> configure:3533: result: no
>
>

Can you run following command:
 /home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
-print-file-name=crt1.o
and verify that the reported file exists? What is the output?

Normally you shouldn't give any special environment flags.

You could also try to compile a simple hello world program with that
compiler in output/host/usr/bin, to see if that works correctly or
not.

Thanks,
Thomas
