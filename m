From: Diego Iastrubni <diegoiast@gmail.com>
Date: Sun, 15 Apr 2012 17:49:46 +0300
Subject: [Buildroot] Selecting X11R7/xorg-server fails to compile
In-Reply-To: <CALR4fEKzdOYyqTz7BdH=oDWCPbUn5LBnc6BFX1E19uwYRX80yA@mail.gmail.com>
References: <CALR4fEKzdOYyqTz7BdH=oDWCPbUn5LBnc6BFX1E19uwYRX80yA@mail.gmail.com>
Message-ID: <CALR4fE+A2+r_CWp+nGhRnvQBYCk3G6vJVTQ=AHp_mco0-FfPAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 11, 2012 at 3:49 PM, Diego Iastrubni <diegoiast@gmail.com>wrote:

> Hi all,
>
> Choosing  "make qemu_x86_defconfig" and the default external toolchain
> (Sourcery CodeBench x86/x86_64 2011.09) , the selecting X11R7/xorg-server
> fails to compile here (Ubuntu 12.04, 64bit):
>
>
Same when I compile for target=x86_64. Still libdrm fails to link with the
same error. I am working on a patch to disable the "tests", as it seems
that they are the cause (well, something else is broken, but I will
workaround it meanwhile).

/home/diego/src/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.6.1/../../../../i686-pc-linux-gnu/bin/ld:
> dristat.o: undefined reference to symbol 'clock_gettime@@GLIBC_2.2'
> /home/diego/src/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.6.1/../../../../i686-pc-linux-gnu/bin/ld:
> note: 'clock_gettime@@GLIBC_2.2' is defined in DSO
> /home/diego/src/buildroot/output/host/usr/i686-unknown-linux-gnu/sysroot/lib/librt.so.1
> so try adding it to the linker command line
> /home/diego/src/buildroot/output/host/usr/i686-unknown-linux-gnu/sysroot/lib/librt.so.1:
> could not read symbols: Invalid operation
> collect2: ld returned 1 exit status
> make[4]: *** [dristat] Error 1
> make[4]: Leaving directory
> `/home/diego/src/buildroot/output/build/libdrm-2.4.19/tests'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120415/6a9f8b6b/attachment.html>
