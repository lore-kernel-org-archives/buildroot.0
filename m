From: Emiliano Lopez <emiliano.lopez@gmail.com>
Date: Mon, 20 Aug 2007 13:38:08 -0300
Subject: [Buildroot] stdarg.h error
Message-ID: <50f131690708200938t13f4ae3dn12d12933ba6b6f24@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all.
I am trying to port linux on a routerboard 532 [1].
Actually I am having problems to compile the kernel.

I am using buildroot-20050818 download from [2] because y need to
compile a kernel version 2.4.30 or 2.4.31.

I can't do the cross compilation of my kernel because an error stop the process.

I modified the Makefile:
kgcc -> gcc
ARCH := mips
CROSS_COMPILE = mipsel-linux-

Then I export the correct PATH (/usr/local/uclibc-0.9.28/mipsel/bin/)
and finally, inside the kernel directory : make vmlinux

But the following error stop the compilation:
_______________________________________________________________________
/home/emiliano/p3/linux-2.4.31/include/linux/kernel.h:10:20: stdarg.h:
No such file or directory
In file included from /home/emiliano/p3/linux-2.4.31/include/linux/wait.h:13,
                 from /home/emiliano/p3/linux-2.4.31/include/linux/fs.h:12,
                 from
/home/emiliano/p3/linux-2.4.31/include/linux/capability.h:17,
                 from /home/emiliano/p3/linux-2.4.31/include/linux/binfmts.h:5,
                 from /home/emiliano/p3/linux-2.4.31/include/linux/sched.h:9,
                 from offset.c:13:
/home/emiliano/p3/linux-2.4.31/include/linux/kernel.h:76: error: parse
error before "va_list"
/home/emiliano/p3/linux-2.4.31/include/linux/kernel.h:77: warning:
function declaration isn't a prototype
/home/emiliano/p3/linux-2.4.31/include/linux/kernel.h:80: error: parse
error before "va_list"
/home/emiliano/p3/linux-2.4.31/include/linux/kernel.h:81: warning:
function declaration isn't a prototype
/home/emiliano/p3/linux-2.4.31/include/linux/kernel.h:85: error: parse
error before "va_list"
/home/emiliano/p3/linux-2.4.31/include/linux/kernel.h:86: warning:
function declaration isn't a prototype
make[1]: *** [offset.s] Error 1
make[1]: Leaving directory `/home/emiliano/p3/linux-2.4.31/arch/mips/tools'
make: *** [_dir_arch/mips/tools] Error 2
----------------------------------------------------------------------------------------------------------------------------------------------------------------

I don't know where is the problem or the solution.
Please, I need help.

Thanks.

Emiliano

[1] http://www.routerboard.com/rb500.html
[2] http://free-electrons.com/community/tools/uclibc/
