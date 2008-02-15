From: Nicola Salvemini <nicolasalvemini@yahoo.it>
Date: Fri, 15 Feb 2008 12:31:47 +0000 (GMT)
Subject: [Buildroot] OpenSsh segmentation fault
Message-ID: <343951.24162.qm@web23404.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I have been trying to compile openssh using buildroot, it compiles without any problem,
but any executable halts with "segmentation
fault". 
Do you have any idea?

here is the strace output of ssh:

#strace ssh --help
execve("/usr/bin/ssh", ["ssh", "--help"], [/* 15 vars */]) = 0
mmap2(NULL, 20, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40005000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=1182, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
mmap2(NULL, 1182, PROT_READ, MAP_SHARED, 4, 0) = 0x40006000
close(4)                                = 0
open("/usr/lib/libcrypto.so..0.9.7", O_RDONLY) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=934220, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0$\260\2\000"..., 4096) = 4096
mmap2(NULL, 983040, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4000e000
mmap2(0x4000e000, 869240, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x4000e000
mmap2(0x400ea000, 64812, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0xd4) = 0x400ea000
mmap2(0x400fa000, 14456, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x400fa000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libutil.so.0", O_RDONLY)     = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=4783, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\20\10\0\000"..., 4096) = 4096
mmap2(NULL, 36864, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x400fe000
mmap2(0x400fe000, 3112, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x400fe000
mmap2(0x40106000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x40106000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/usr/lib/libz.so.1", O_RDONLY)    = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=71564, ....}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0h\24\0\000"..., 4096) = 4096
mmap2(NULL, 106496, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40107000
mmap2(0x40107000, 69832, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x40107000
mmap2(0x40120000, 876, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0x11) = 0x40120000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libcrypt.so.0", O_RDONLY)    = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=13019, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0d\4\0\000"...., 4096) = 4096
mmap2(NULL, 118784, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40121000
mmap2(0x40121000, 9032, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x40121000
mmap2(0x4012b000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0x2) = 0x4012b000
mmap2(0x4012c000, 70864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4012c000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libresolv.so.0", O_RDONLY)   = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=4712, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0p\2\0\000"..., 4096) = 4096
mmap2(NULL, 36864, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4013e000
mmap2(0x4013e000, 648, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x4013e000
mmap2(0x40146000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x40146000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0@\201\0\000"..., 4096) = 4096
mmap2(NULL, 278528, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40147000
mmap2(0x40147000, 221964, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x40147000
mmap2(0x40185000, 4960, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0x36) = 0x40185000
mmap2(0x40187000, 13592, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40187000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=9027, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\210\7\0\000"..., 4096) = 4096
mmap2(NULL, 40960, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4018b000
mmap2(0x4018b000, 5660, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x4018b000
mmap2(0x40194000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0x1) = 0x40194000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(4)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(4)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(4)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(4)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(4)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=227603, ...}) = 0
close(4)                                = 0
munmap(0x40006000, 1182)                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=21168, ...}) = 0
mprotect(0x40106000, 4096, PROT_READ)   = 0
mprotect(0x4012b000, 4096, PROT_READ)   = 0
mprotect(0x40146000, 4096, PROT_READ)   = 0
mprotect(0x40185000, 4096, PROT_READ)   = 0
mprotect(0x40194000, 4096, PROT_READ)   = 0
mprotect(0x4000c000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo ...}) = 0
open("/dev/null", O_RDWR|O_LARGEFILE)   = 4
close(4)                                = 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++
Process 760 detached

Thanks in advance and best regardes,

Nicola.





      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: http://it.docs.yahoo.com/nowyoucan.html
