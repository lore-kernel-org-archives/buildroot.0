From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Mar 2014 07:40:58 +0100
Subject: [Buildroot] NPTL compile error without MMU (ARM)
In-Reply-To: <5333C645.8000203@samsung.com>
References: <5333C645.8000203@samsung.com>
Message-ID: <20140327074058.4059aa56@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sangjung,

On Thu, 27 Mar 2014 15:33:41 +0900, Sangjung wrote:
> Dear developers.
> 
> Hi. I found out that nptl make a compile error when MMU (i.e. 'Toolchain 
> - Enable MMU support')  is disabled.
> 
> Detailed error message is as below.
> 
> -------------------------------------------------------------------------------- 
> 
> In file included from 
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.c:31:0:
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:17: error: 
> 'fork' undeclared here (not in a function)
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:63:1: error: 
> '__libc_fork' redeclared as different kind of symbol
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:23: note: 
> previous declaration of '__libc_fork' was here
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:228:1: error: 
> 'fork' redeclared as different kind of symbol
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:227:1: note: 
> previous declaration of 'fork' was here
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:229:1: error: 
> '__EI_fork' aliased to undefined symbol '__GI_fork'
> make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.os] Error 1
> -------------------------------------------------------------------------------- 
> 
> This problem is already reported by Axel Lin.
> (Link: http://lists.uclibc.org/pipermail/uclibc-cvs/2013-May/031094.html)
> 
> However, it looks like that this issue is not solved for a long time.
> If someone let me know the alternative solution, I'd be really happy.

Thanks for your report. The problem really looks like a uClibc problem,
so I would suggest you to take the uClibc configuration file in
output/build/uclibc-<version>/.config, and sent the report to the
uClibc developers. I am also on the uClibc mailing list, so I will be
able to add additional Buildroot-specific details if requested by the
uClibc developers.

Outside of this, it is interesting to see that you are looking at the
ARM non-MMU support. Do you have an actual hardware platform? In fact,
I have been interested by looking into ARM non-MMU support in Buildroot
for a long time, but I have never found a hardware platform, or
emulated platform, to test things on. If this is something you can help
with, I'm pretty sure the ARM non-MMU support would make more
significant progress.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
