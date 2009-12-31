From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Dec 2009 20:36:45 +0000 (UTC)
Subject: [Buildroot] [Bug 835] New: Package Dataflashboot-1.05 does not
 compile with builroot toolchain
Message-ID: <bug-835-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=835

              Host: i686-pc-linux-gnu
            Target: linux-uclibcgnueabi
           Summary: Package Dataflashboot-1.05 does not compile with
                    builroot toolchain
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: o.doering at tu-bs.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The toolchain that buildroot generates never compiles Dataflashboot-1.05. This
is used on the AT91RM9200 to copy u-boot to SDRAM and jump to it. I tried
different versions of buildroot from historic to current snapshot, the error
occurs in all of them. Might be related to a software/hardware float issue.

/home/oliver/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-ld -T
elf32-littlearm.lds -Ttext 0 -n -o DataflashBoot-1.05.out objs/cstartup_ram.o
objs/at45.o objs/com.o objs/dataflash.o objs/div0.o objs/init.o objs/main.o
objs/stdio.o objs/asm_isr.o objs/jump.o objs/_udivsi3.o objs/_umodsi3.o
objs/led.o
objs/at45.o: In function `AT91F_DataFlashSendCommand':
at45.c:(.text+0xf0): undefined reference to `__aeabi_uidiv'
at45.c:(.text+0x104): undefined reference to `__aeabi_uidivmod'
objs/at45.o: In function `AT91F_PartialPageWrite':
at45.c:(.text+0x4a8): undefined reference to `__aeabi_uidiv'
at45.c:(.text+0x4f8): undefined reference to `__aeabi_uidivmod'
objs/at45.o: In function `AT91F_DataFlashWrite':
at45.c:(.text+0x5f4): undefined reference to `__aeabi_uidivmod'
at45.c:(.text+0x680): undefined reference to `__aeabi_uidiv'
objs/stdio.o: In function `number':
stdio.c:(.text+0x2a4): undefined reference to `__aeabi_uidiv'
stdio.c:(.text+0x2b8): undefined reference to `__aeabi_uidivmod'
make[1]: *** [DataflashBoot-1.05.out] Fehler 1
make[1]: leaving directory
'/home/oliver/buildroot/output/build/DataflashBoot-1.05'
make: ***
[/home/oliver/buildroot/output/build/DataflashBoot-1.05/DataflashBoot-1.05.bin]
error 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
