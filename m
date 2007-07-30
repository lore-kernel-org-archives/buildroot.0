From: Gabbar Singh <gabbar_singh_new@yahoo.com>
Date: Mon, 30 Jul 2007 05:21:25 -0700 (PDT)
Subject: [Buildroot] Kernel compilation fails while using uclibc toolchain
In-Reply-To: <1185792081.1057.1.camel@localhost.localdomain>
Message-ID: <904057.85022.qm@web52102.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I dont know where to post this.. so I apologize if this is not the correct list and pls point me to the same.
I was trying to build the linux kernel 2.6.22 using the toolchain created with buildroot for arm (generic).
I am getting the following errors:

 CHK     include/linux/version.h
  SYMLINK include/asm-arm/arch -> include/asm-arm/arch-versatile
  Generating include/asm-arm/mach-types.h
  CHK     include/linux/utsrelease.h
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/docproc
  CC      arch/arm/kernel/asm-offsets.s

In file included from include/linux/irqflags.h:46,
                 from include/asm/system.h:78,
                 from include/asm/bitops.h:23,
                 from include/linux/bitops.h:9,
                 from include/linux/thread_info.h:20,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:49,
                 from include/linux/capability.h:47,
                 from include/linux/sched.h:46,
                 from arch/arm/kernel/asm-offsets.c:13:
include/asm/irqflags.h:11:5: warning: "__LINUX_ARM_ARCH__" is not defined
In file included from include/asm/bitops.h:23,
                 from include/linux/bitops.h:9,
                 from include/linux/thread_info.h:20,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:49,
                 from include/linux/capability.h:47,
                 from include/linux/sched.h:46,
                 from arch/arm/kernel/asm-offsets.c:13:
include/asm/system.h:153:5: warning: "__LINUX_ARM_ARCH__" is not defined
include/asm/system.h:159:5: warning: "__LINUX_ARM_ARCH__" is not defined
include/asm/system.h:163:35: warning: "__LINUX_ARM_ARCH__" is not defined
include/asm/system.h:293:5: warning: "__LINUX_ARM_ARCH__" is not defined
include/asm/system.h:298:5: warning: "__LINUX_ARM_ARCH__" is not defined
In file included from include/linux/bitops.h:9,
                 from include/linux/thread_info.h:20,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:49,
                 from include/linux/capability.h:47,
                 from include/linux/sched.h:46,
                 from arch/arm/kernel/asm-offsets.c:13:
include/asm/bitops.h:233:5: warning: "__LINUX_ARM_ARCH__" is not defined
In file included from include/asm/thread_info.h:16,
                 from include/linux/thread_info.h:21,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:49,
                 from include/linux/capability.h:47,
                 from include/linux/sched.h:46,
                 from arch/arm/kernel/asm-offsets.c:13:
include/asm/fpstate.h:28:5: warning: "__LINUX_ARM_ARCH__" is not defined
In file included from include/linux/spinlock.h:326,
                 from include/linux/capability.h:47,
                 from include/linux/sched.h:46,
                 from arch/arm/kernel/asm-offsets.c:13:
include/asm/atomic.h:25:5: warning: "__LINUX_ARM_ARCH__" is not defined
In file included from include/linux/jiffies.h:4,
                 from include/linux/sched.h:51,
                 from arch/arm/kernel/asm-offsets.c:13:
include/linux/calc64.h: In function 'do_div_llr':
include/linux/calc64.h:25: error: '__LINUX_ARM_ARCH__' undeclared (first use in this function)
include/linux/calc64.h:25: error: (Each undeclared identifier is reported only once
include/linux/calc64.h:25: error: for each function it appears in.)
In file included from include/linux/prefetch.h:14,
                 from include/linux/list.h:8,
                 from include/linux/wait.h:22,
                 from include/asm/semaphore.h:9,
                 from include/linux/sched.h:59,
                 from arch/arm/kernel/asm-offsets.c:13:
include/asm/processor.h:103:5: warning: "__LINUX_ARM_ARCH__" is not defined
In file included from include/asm/semaphore.h:13,
                 from include/linux/sched.h:59,
                 from arch/arm/kernel/asm-offsets.c:13:
include/asm/locks.h:15:5: warning: "__LINUX_ARM_ARCH__" is not defined
In file included from include/asm/page.h:32,
                 from include/linux/sched.h:60,
                 from arch/arm/kernel/asm-offsets.c:13:
include/asm/glue.h:119:2: error: #error Unknown data abort handler type
In file included from include/linux/sched.h:60,
                 from arch/arm/kernel/asm-offsets.c:13:
include/asm/page.h:106:2: error: #error Unknown user operations model
make[1]: *** [arch/arm/kernel/asm-offsets.s] Error 1
make: *** [prepare0] Error 2


Regards,
Naren

       
---------------------------------
Get the Yahoo! toolbar and be alerted to new email wherever you're surfing. 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070730/cf0895e9/attachment.htm 
