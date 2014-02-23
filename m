From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Feb 2014 20:03:11 +0000 (UTC)
Subject: [Buildroot] [Bug 6842] Checking external toolchain for eabihf
In-Reply-To: <bug-6842-163@https.bugs.busybox.net/>
References: <bug-6842-163@https.bugs.busybox.net/>
Message-ID: <20140223200311.213209B97B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6842

--- Comment #6 from syntheticpp at gmx.net 2014-02-23 20:03:10 UTC ---
command line for crtl1.o looks like this:

$ /opt/testgcc4.8.2/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -c
libc/sysdeps/linux/arm/crt1.S -o lib/crt1.o -include ./include/libc-symbols.h
-Wall -Wstrict-prototypes -Wstrict-aliasing -funsigned-char -fno-builtin
-fno-asm -mlittle-endian -fno-stack-protector -nostdinc -I./include -I./include
-I. -I./libc/sysdeps/linux -I./libc/sysdeps/linux/arm -Os -funit-at-a-time
-fmerge-all-constants -fstrict-aliasing -fno-tree-loop-optimize
-fno-tree-dominator-opts -fno-strength-reduce -DHAVE_FORCED_UNWIND
-I./libpthread/nptl -I./libpthread/nptl
-I./libpthread/nptl/sysdeps/unix/sysv/linux/arm/
-I./libpthread/nptl/sysdeps/unix/sysv/linux/arm -I./libpthread/nptl/sysdeps/arm
-I./libpthread/nptl/sysdeps/arm -I./libpthread/nptl/sysdeps/unix/sysv/linux
-I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpthread/nptl/sysdeps/pthread
-I./libpthread/nptl/sysdeps/pthread/bits -I./libpthread/nptl/sysdeps/generic
-I./ldso/ldso/arm -I./ldso/include -I./libc/sysdeps/linux/common
-I/opt/testgcc4.8.2/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/
-isystem
/opt/testgcc4.8.2/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/4.8.2/include-fixed
-isystem
/opt/testgcc4.8.2/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/4.8.2/include
-DNDEBUG -D__USE_STDIO_FUTEXES__ -MT lib/crt1.o -MD -MP -MF lib/.crt1.o.dep
-D__ASSEMBLER__ -Wa,--noexecstack    -DL_crt1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
