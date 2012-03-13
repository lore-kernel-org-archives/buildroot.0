From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 13 Mar 2012 18:17:27 +0100
Subject: [Buildroot] anyone else ?  : curl  Segmentation fault
Message-ID: <4BD5A99434B24CCFAD6CFE527BE9D595@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
Just have build the curl lib and curl binary...
Platform ARM9 , gcc 4.5.3 uclibc 0.9.33
 
#  curl
Segmentation fault
 
Tested the 2012.02 and the one currently in git.
 
If this can be any help : part of the output of strace curl 

open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=341800, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=341800, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=341800, ...}) = 0
close(3)                                = 0
mprotect(0x40199000, 4096, PROT_READ)   = 0
mprotect(0x40015000, 4096, PROT_READ)   = 0
mprotect(0x4009a000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo ...}) =
0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo ...}) =
0
pipe([3, 4])                            = 0
close(3)                                = 0
close(4)                                = 0
brk(0)                                  = 0x19000
brk(0x1a000)                            = 0x1a000
brk(0x1b000)                            = 0x1b000
brk(0x1c000)                            = 0x1c000
brk(0x1d000)                            = 0x1d000
brk(0x1e000)                            = 0x1e000
brk(0x1f000)                            = 0x1f000
brk(0x20000)                            = 0x20000
brk(0x21000)                            = 0x21000
brk(0x22000)                            = 0x22000
brk(0x23000)                            = 0x23000
brk(0x25000)                            = 0x25000
brk(0x26000)                            = 0x26000
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++
Segmentation fault
# 


Sagaert Johan
