From: dishui <dishui@gmail.com>
Date: Fri, 17 Oct 2008 10:13:10 +0800
Subject: [Buildroot] ssh related command result segmentation fault(attached
	strace output)
Message-ID: <200810171013066872698@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi, all
    All the ssh related commands got segmentation fault, can anyone give me a solution from the attatched log? thanks.

execve("/usr/sbin/sshd", ["/usr/sbin/sshd"], [/* 21 vars */]) = 0
mmap2(NULL, 20, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40005000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=1093, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
mmap2(NULL, 1093, PROT_READ, MAP_SHARED, 3, 0) = 0x40006000
close(3)                                = 0
open("/lib/libcrypto.so.0.9.8", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libcrypto.so.0.9.8", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0555, st_size=1458848, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0H<\3\0004"..., 4096) = 4096
mmap2(NULL, 1249280, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4000e000
mmap2(0x4000e000, 1126128, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x4000e000
mmap2(0x40129000, 74612, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x113) = 0x40129000
mmap2(0x4013c000, 10032, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4013c000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libutil.so.0", O_RDONLY)     = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=4783, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\20\10\0\000"..., 4096) = 4096
mmap2(NULL, 36864, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4013f000
mmap2(0x4013f000, 3104, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x4013f000
mmap2(0x40147000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40147000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libz.so.1", O_RDONLY)        = -1 ENOENT (No such file or directory)
open("/usr/lib/libz.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=71564, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0h\24\0\000"..., 4096) = 4096
mmap2(NULL, 106496, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40148000
mmap2(0x40148000, 69832, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40148000
mmap2(0x40161000, 876, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x11) = 0x40161000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libcrypt.so.0", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=13019, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0d\4\0\000"..., 4096) = 4096
mmap2(NULL, 118784, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40162000
mmap2(0x40162000, 9024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40162000
mmap2(0x4016c000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x2) = 0x4016c000
mmap2(0x4016d000, 70864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4016d000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libresolv.so.0", O_RDONLY)   = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=4712, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0p\2\0\000"..., 4096) = 4096
mmap2(NULL, 36864, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4017f000
mmap2(0x4017f000, 648, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x4017f000
mmap2(0x40187000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40187000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libssp.so.0", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=24347, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0l\7\0\000"..., 4096) = 4096
mmap2(NULL, 40960, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40188000
mmap2(0x40188000, 3820, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40188000
mmap2(0x40191000, 344, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x1) = 0x40191000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\320\201\0"..., 4096) = 4096
mmap2(NULL, 278528, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40192000
mmap2(0x40192000, 222216, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40192000
mmap2(0x401d0000, 4960, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x36) = 0x401d0000
mmap2(0x401d2000, 13592, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x401d2000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=9027, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\210\7\0\000"..., 4096) = 4096
mmap2(NULL, 40960, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x401d6000
mmap2(0x401d6000, 5672, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x401d6000
mmap2(0x401df000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x1) = 0x401df000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(3)                                = 0
munmap(0x40006000, 1093)                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=21168, ...}) = 0
mprotect(0x40147000, 4096, PROT_READ)   = 0
mprotect(0x4016c000, 4096, PROT_READ)   = 0
mprotect(0x40187000, 4096, PROT_READ)   = 0
mprotect(0x401d0000, 4096, PROT_READ)   = 0
mprotect(0x401df000, 4096, PROT_READ)   = 0
mprotect(0x4000c000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo ...}) = 0
open("/dev/urandom", O_RDONLY)          = 3
read(3, "`\237B\370", 4)                = 4
close(3)                                = 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++
Process 794 detached

2008-10-17
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081017/32d11cc4/attachment-0001.htm 
