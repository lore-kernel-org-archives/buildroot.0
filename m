From: Jamie Guinan <guinan@bluebutton.com>
Date: Mon, 4 Dec 2006 13:38:55 -0500 (EST)
Subject: [Buildroot] PowerPC build using today's snapshot
In-Reply-To: <Pine.LNX.4.64.0612011745320.29314@gemini.home.net>
References: <Pine.LNX.4.64.0612011745320.29314@gemini.home.net>
Message-ID: <Pine.LNX.4.64.0612041336460.22519@gemini.home.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 1 Dec 2006, Jamie Guinan wrote:

> Hi,
> 
> I tried running buildroot for powerpc today (my targets will be mpc823 
> and mpc8347).
> 
> $ tar -xjf buildroot-20061201.tar.bz2
> $ mv buildroot buildroot-20061201
> $ cp -rpl buildroot-20061201 buildroot-20061201-mpc823
> $ cd buildroot-20061201-mpc823
> $ make menuconfig
> [ tooks defaults for most everything ]
> $ make
> [ defaults again ]
> 
> It bombs while buidling gcc (crtbegin.o),
> 
> /home/guinan/projects/cross-tools/buildroot-20061201-mpc823/toolchain_build_powerpc/uClibc_dev//usr/include/bits/uClibc_local_lim.h:15:3: 
> #error local_lim.h was incorrectly updated, use the NPTL version from glibc
> make[2]: *** [crtbegin.o] Error 1
> make[2]: Leaving directory 
> `/home/guinan/projects/cross-tools/buildroot-20061201-mpc823/toolchain_build_powerpc/gcc-3.4.2-initial/gcc'
> make[1]: *** [all-gcc] Error 2
> make[1]: Leaving directory 
> `/home/guinan/projects/cross-tools/buildroot-20061201-mpc823/toolchain_build_powerpc/gcc-3.4.2-initial'
> 
> 
> Highlights from .config,

<snip>

Well, whatever the problem was, it seems to have gone away with the 
20061204 snapshot, and I have a working powerpc toolchain and nice 
rootfs now.

Thanks,
-Jamie
