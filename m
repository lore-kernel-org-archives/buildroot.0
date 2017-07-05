From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 5 Jul 2017 16:47:40 -0500
Subject: [Buildroot] [PATCH 1/1] paxtest: new package
In-Reply-To: <20170621222939.2f43e719@windsurf>
References: <1497906876-27014-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170621222939.2f43e719@windsurf>
Message-ID: <CANQCQpbO0rGSJDhOqPpkDuW4LCqQLZn9BeucupJhW_Qa0ScZPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All.

On Wed, Jun 21, 2017 at 3:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>

<snip>

>> +config BR2_PACKAGE_PAXTEST
>> +     bool "paxtest"
>> +     depends on BR2_TOOLCHAIN_USES_GLIBC
>
> Could you please add a comment about why we have this glibc dependency?
>

I started to look into this and I've found a few changes so far.....
1) It will require the "depends on BR2_TOOLCHAIN_USES_GLIBC" but I'll
add the following justification
        # No UCLIBC or MUSL because __NO_A_OUT_SUPPORT

2) Still looking into these assembler errors.  They don't seem to be
dependent on GCC version. (armv5-ctng-linux-gnueabi GCC4.8 /
sourcery-arm-armv4t GCC4.8  / sourcery-arm GCC4.8  /br-nios2-glibc
GCC6.0 )
    /home/buildroot/paxtest_gcc_GLIBC/armv5-ctng-linux-gnueabi/host/usr/bin/armv5-ctng-linux-gnueabi-gcc
 -o chpax chpax-0.7/aout.o chpax-0.7/chpax.o chpax-0.7/elf32.o
chpax-0.7/elf64.o chpax-0.7/flags.o chpax-0.7/io.o
    /home/buildroot/paxtest_gcc_GLIBC/armv5-ctng-linux-gnueabi/host/usr/bin/armv5-ctng-linux-gnueabi-gcc
-O2 -Wa,--noexecstack -U_FORTIFY_SOURCE -DRUNDIR=\".\"
-fno-stack-protector   -fPIC -o shlibtest.o -c shlibtest.c
    /tmp/ccoq8vb7.s: Assembler messages:
    /tmp/ccoq8vb7.s:27: Error: alignment too large: 15 assumed
    make[3]: *** [shlibtest.o] Error 1

Matt
