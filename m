From: Alex Potapenko <opotapenko@gmail.com>
Date: Sat, 9 Apr 2016 13:06:50 +0300
Subject: [Buildroot]  powerpc 8548: error building eglibc toolchain
Message-ID: <CAF5aO=JJ6fPZRetUKsbeAYQL+tms-7NKA=jzkjaVzD08DiPBgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to compile a powerpc 8548 hard-float eglibc toolchain using
Buildroot 2016.02 (see config file attached). I'm getting this error
when linking libc.so:

> /home/alex/optware/buildroot-ppc-e500v2/toolchain/buildroot-2016.02/output/host/usr/lib/gcc/powerpc-buildroot-linux-gnuspe/5.3.0/../../../../powerpc-buildroot-linux-gnuspe/bin/ld: /home/alex/optware/buildroot-ppc-e500v2/toolchain/buildroot-2016.02/output/build/glibc-2.18-svnr23787/build/libc_pic.os: In function `__gen_tempname':
> (.text+0x4764c): @local call to ifunc __GI___gettimeofday
> /home/alex/optware/buildroot-ppc-e500v2/toolchain/buildroot-2016.02/output/build/glibc-2.18-svnr23787/build/libc_pic.os: error adding symbols: Bad value
> collect2: error: ld returned 1 exit status

Is eglibc toolchain not supported for this target? Should I switch to uclibc-ng?


Thanks,
Alex Potapenko
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 57745 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160409/d9413dbc/attachment.obj>
