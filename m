From: Anton Copylov <a_copl@mail.ru>
Date: Thu, 08 Jan 2009 17:10:29 +0300
Subject: [Buildroot] uCLibc build error
Message-ID: <E1LKvaf-000HA9-00.a_copl-mail-ru@f142.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all.
I've building buildroot for PowerPC.
Here is some output, occured, when uCLibc builds:
gcc -c libc/sysdeps/linux/alpha/crt1.S -o 
lib/crt1.o -include ./include/libc-symbols.h -Wall -Wstrict-prototypes -fno-strict-aliasing -fno-stack-protector -fno-builtin -nostdinc -I./include -I. -I./libc/sysdeps/linux/alpha -fno-asm -DUCLIBC_INTERNAL -DSTATIC -Os -funit-at-a-time -fno-tree-loop-optimize -fno-tree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/alpha -I./libpthread/linuxthreads.old/sysdeps/alpha -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -I/usr/src/linux/include/ -I/usr/lib/gcc/i486-linux-gnu/4.3.2//include-fixed -I/usr/lib/gcc/i486-linux-gnu/4.3.2/include -DNDEBUG -MT 
lib/crt1.o -MD -MP -MF lib/.crt1.o.dep -D__ASSEMBLER__ -DL_crt1
libc/sysdeps/linux/alpha/crt1.S: Assembler messages:
libc/sysdeps/linux/alpha/crt1.S:43: Error: alignment not a power of 2
libc/sysdeps/linux/alpha/crt1.S:45: Error: unknown pseudo-op: `.ent'
libc/sysdeps/linux/alpha/crt1.S:57: Error: unknown pseudo-op: `.frame'
libc/sysdeps/linux/alpha/crt1.S:58: Error: no such instruction: `br $29,1f'
libc/sysdeps/linux/alpha/crt1.S:59: Error: no such instruction: `ldgp $29,0($29)'
libc/sysdeps/linux/alpha/crt1.S:60: Error: suffix or operands invalid for `sub'
libc/sysdeps/linux/alpha/crt1.S:61: Error: suffix or operands invalid for `mov'
libc/sysdeps/linux/alpha/crt1.S:62: Error: unknown pseudo-op: `.prologue'
libc/sysdeps/linux/alpha/crt1.S:65: Error: no such instruction: `lda $16,main'
libc/sysdeps/linux/alpha/crt1.S:67: Error: no such instruction: `ldl $17,16($30)'
libc/sysdeps/linux/alpha/crt1.S:68: Error: no such instruction: `lda $18,24($30)'
libc/sysdeps/linux/alpha/crt1.S:71: Error: no such instruction: `lda $19,_init'
libc/sysdeps/linux/alpha/crt1.S:72: Error: no such instruction: `lda $20,_fini'
libc/sysdeps/linux/alpha/crt1.S:75: Error: suffix or operands invalid for `mov'
libc/sysdeps/linux/alpha/crt1.S:78: Error: no such instruction: `stq $30,0($30)'
libc/sysdeps/linux/alpha/crt1.S:82: Error: no such instruction: `jsr $26,__uClibc_main'
libc/sysdeps/linux/alpha/crt1.S:86: Error: invalid character '_' in mnemonic

Path something/alpha/something looks strange, it seems like build for alpha processor, but i have PPC generic target 
choosed.
