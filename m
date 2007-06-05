From: z4ziggy <z4ziggy@gmail.com>
Date: Tue, 5 Jun 2007 17:00:30 +0300
Subject: [Buildroot] problem with openssh
Message-ID: <e19d85410706050700s69e06497gef032dddb6eef9c9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Ive been trying to compile openssh using buildroot, and just like
samba, it compiles fine but any executable halts with "segmentation
fault". Ive tried making buildroot with both gcc 4.2.0 and 3.4.6
(uclibc 0.9.29) - same results. I would appreciate if anyone can
please tell me how he had succeeded compiling (and executing...)
openssh successfully.

here is the strace output of ssh :

[root at zmob /]$ strace ssh --help
execve("/usr/bin/ssh", ["ssh", "--help"], [/* 42 vars */]) = 0
mmap2(NULL, 20, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7fd8000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=1139, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
mmap2(NULL, 1139, PROT_READ, MAP_SHARED, 3, 0) = 0xb7fd7000
close(3)                                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=45712, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7fd6000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\20\21\0"...,
4096) = 4096
mmap2(NULL, 49152, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7fca000
mmap2(0xb7fca000, 40932, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0xb7fca000
mmap2(0xb7fd4000, 4100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0xa) = 0xb7fd4000
close(3)                                = 0
munmap(0xb7fd6000, 4096)                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=52972, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7fd6000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\340C\0"...,
4096) = 4096
mmap2(NULL, 81920, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7fb6000
mmap2(0xb7fb6000, 45516, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0xb7fb6000
mmap2(0xb7fc2000, 6852, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0xb) = 0xb7fc2000
mmap2(0xb7fc4000, 23424, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7fc4000
close(3)                                = 0
munmap(0xb7fd6000, 4096)                = 0
open("/usr/lib/libcrypto.so.0.9.7", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=820612, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7fd6000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\320\250"...,
4096) = 4096
mmap2(NULL, 835584, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7eea000
mmap2(0xb7eea000, 748012, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0xb7eea000
mmap2(0xb7fa1000, 69956, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0xb7) = 0xb7fa1000
mmap2(0xb7fb3000, 11416, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7fb3000
close(3)                                = 0
munmap(0xb7fd6000, 4096)                = 0
open("/lib/libutil.so.0", O_RDONLY)     = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=4656, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7fd6000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\224\7\0"...,
4096) = 4096
mmap2(NULL, 8192, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7ee8000
mmap2(0xb7ee8000, 2924, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3,
0) = 0xb7ee8000
mmap2(0xb7ee9000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0xb7ee9000
close(3)                                = 0
munmap(0xb7fd6000, 4096)                = 0
open("/usr/lib/libz.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=59136, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7fd6000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0p\25\0\000"...,
4096) = 4096
mmap2(NULL, 61440, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7ed9000
mmap2(0xb7ed9000, 57008, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0xb7ed9000
mmap2(0xb7ee7000, 704, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0xe) = 0xb7ee7000
close(3)                                = 0
munmap(0xb7fd6000, 4096)                = 0
open("/lib/libcrypt.so.0", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=8796, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7fd6000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\214\3\0"...,
4096) = 4096
mmap2(NULL, 86016, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7ec4000
mmap2(0xb7ec4000, 7510, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3,
0) = 0xb7ec4000
mmap2(0xb7ec6000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x1) = 0xb7ec6000
mmap2(0xb7ec7000, 70940, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7ec7000
close(3)                                = 0
munmap(0xb7fd6000, 4096)                = 0
open("/lib/libresolv.so.0", O_RDONLY)   = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=4640, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7fd6000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\350\1\0"...,
4096) = 4096
mmap2(NULL, 8192, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7ec2000
mmap2(0xb7ec2000, 516, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3,
0) = 0xb7ec2000
mmap2(0xb7ec3000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0xb7ec3000
close(3)                                = 0
munmap(0xb7fd6000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=273180, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7fd6000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\0\251\0"...,
4096) = 4096
mmap2(NULL, 299008, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7e79000
mmap2(0xb7e79000, 267352, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0xb7e79000
mmap2(0xb7ebb000, 5304, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x41) = 0xb7ebb000
mmap2(0xb7ebd000, 16988, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7ebd000
close(3)                                = 0
munmap(0xb7fd6000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=273180, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=273180, ...}) = 0
close(3)                                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=8968, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7fd6000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0,\7\0\000"...,
4096) = 4096
mmap2(NULL, 16384, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7e75000
mmap2(0xb7e75000, 4782, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3,
0) = 0xb7e75000
mmap2(0xb7e77000, 4172, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x1) = 0xb7e77000
close(3)                                = 0
munmap(0xb7fd6000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=273180, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=273180, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=273180, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=273180, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=273180, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=273180, ...}) = 0
close(3)                                = 0
munmap(0xb7fd7000, 1139)                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=17000, ...}) = 0
mprotect(0xb7fd4000, 4096, PROT_READ)   = 0
mprotect(0xb7fc2000, 4096, PROT_READ)   = 0
mprotect(0xb7ee9000, 4096, PROT_READ)   = 0
mprotect(0xb7ec6000, 4096, PROT_READ)   = 0
mprotect(0xb7ec3000, 4096, PROT_READ)   = 0
mprotect(0xb7ebb000, 4096, PROT_READ)   = 0
mprotect(0xb7e77000, 4096, PROT_READ)   = 0
mprotect(0xb7fdd000, 4096, PROT_READ)   = 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++
Process 11453 detached
[root at zmob /]$


Blessings,
Elia Yehuda.
