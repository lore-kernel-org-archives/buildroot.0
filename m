From: Andrew Wiley <debio264@gmail.com>
Date: Tue, 19 Jan 2010 01:08:17 -0600
Subject: [Buildroot] EP9302 Sound and/or Module-Init-Tools: No such file
	or directory?
In-Reply-To: <ecbbfeda1001182226w3011d340t56a2e685738168b2@mail.gmail.com>
References: <ecbbfeda1001182226w3011d340t56a2e685738168b2@mail.gmail.com>
Message-ID: <ecbbfeda1001182308r606cc4ectf02a9c5a528d2481@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's the strace output:

execve("/sbin/modprobe", ["modprobe", "zd1211rw"], [/* 16 vars */]) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x40005000
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=313971, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x40006000
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\0\251\0\0004\0\0\0T"...,
4096) = 4096
mmap2(NULL, 364544, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x4000e000
mmap2(0x4000e000, 307024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0)
= 0x4000e000
mmap2(0x40061000, 5064, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0x4b) = 0x40061000
mmap2(0x40063000, 15024, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40063000
close(3)                                = 0
munmap(0x40006000, 4096)                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=21200, ...}) = 0
mprotect(0x40061000, 4096, PROT_READ)   = 0
mprotect(0x4000c000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B57600 opost isig icanon echo ...})
= 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e893c) = -1 ENOTTY
(Inappropriate ioctl for device)
uname({sys="Linux", node="buildroot", ...}) = 0
fstat(2, {st_mode=S_IFREG|0644, st_size=1291, ...}) = 0
brk(0)                                  = 0x16000
brk(0x17000)                            = 0x17000
open("/etc/modprobe.conf", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No
such file or directory)
open("/etc/modprobe.conf", O_RDONLY)    = -1 ENOENT (No such file or
directory)
open("/etc/modprobe.d", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No
such file or directory)
open("/etc/modprobe.d", O_RDONLY)       = -1 ENOENT (No such file or
directory)
brk(0x18000)                            = 0x18000
ioctl(2147483647, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e890c) = -1 EBADF (Bad
file descriptor)
brk(0x19000)                            = 0x19000
open("/lib/modules/2.6.32.3/modules.dep", O_RDONLY) = 3
ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e896c) = -1 ENOTTY
(Inappropriate ioctl for device)
read(3, "kernel/crypto/ecb.ko:\nkernel/cryp"..., 4096) = 4096
close(3)                                = 0
open("kernel/net/wireless/cfg80211.ko", O_RDWR) = -1 ENOENT (No such file or
directory)
open("kernel/net/wireless/cfg80211.ko", O_RDONLY) = -1 ENOENT (No such file
or directory)
ioctl(2147483647, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e875c) = -1 EBADF (Bad
file descriptor)
ioctl(2147483647, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e874c) = -1 EBADF (Bad
file descriptor)
brk(0x1a000)                            = 0x1a000
write(2, "WARNING: Could not open 'kernel/n"..., 85WARNING: Could not open
'kernel/net/wireless/cfg80211.ko': No such file or directory
) = 85
open("kernel/net/mac80211/mac80211.ko", O_RDWR) = -1 ENOENT (No such file or
directory)
open("kernel/net/mac80211/mac80211.ko", O_RDONLY) = -1 ENOENT (No such file
or directory)
ioctl(2147483647, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e87cc) = -1 EBADF (Bad
file descriptor)
ioctl(2147483647, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e87bc) = -1 EBADF (Bad
file descriptor)
write(2, "WARNING: Could not open 'kernel/n"..., 85WARNING: Could not open
'kernel/net/mac80211/mac80211.ko': No such file or directory
) = 85
open("kernel/drivers/base/firmware_class.ko", O_RDWR) = -1 ENOENT (No such
file or directory)
open("kernel/drivers/base/firmware_class.ko", O_RDONLY) = -1 ENOENT (No such
file or directory)
ioctl(2147483647, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e883c) = -1 EBADF (Bad
file descriptor)
ioctl(2147483647, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e882c) = -1 EBADF (Bad
file descriptor)
write(2, "WARNING: Could not open 'kernel/d"..., 91WARNING: Could not open
'kernel/drivers/base/firmware_class.ko': No such file or directory
) = 91
open("kernel/drivers/net/wireless/zd1211rw/zd1211rw.ko", O_RDWR) = -1 ENOENT
(No such file or directory)
open("kernel/drivers/net/wireless/zd1211rw/zd1211rw.ko", O_RDONLY) = -1
ENOENT (No such file or directory)
ioctl(2147483647, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e88ac) = -1 EBADF (Bad
file descriptor)
ioctl(2147483647, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9e889c) = -1 EBADF (Bad
file descriptor)
write(2, "FATAL: Could not open 'kernel/dri"..., 100FATAL: Could not open
'kernel/drivers/net/wireless/zd1211rw/zd1211rw.ko': No such file or
directory
) = 100
exit(1)                                 = ?


It looks like it's only searching in the current directory, and modprobe
does start working when I go to /lib/modules/2.6.32.3, but I don't
understand why that would happen. I don't have a modprobe.conf, but from
what I'm reading, that shouldn't matter when the path is determined?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100119/ea33c4c0/attachment-0001.htm>
