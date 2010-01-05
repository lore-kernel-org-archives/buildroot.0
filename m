From: peter.stosz at mentat.hu <peter.stosz@mentat.hu>
Date: Tue, 5 Jan 2010 10:18:29 +0100
Subject: [Buildroot] mdev & usb problem
In-Reply-To: <4B42F7A6.1010100@free.fr>
References: <OF405E38C2.BA69D5BB-ONC12576A1.0082D712-C12576A2.00013AFE@mentat.hu>
	<4B42F7A6.1010100@free.fr>
Message-ID: <OF42E07C52.E79A00B9-ONC12576A2.00330B26-C12576A2.003321B3@mentat.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/opt # find / -name usb.ids*
/usr/share/usb.ids.gz
/opt # 
/opt # strace ./us
execve("./us", ["./us"], [/* 9 vars */]) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0x40005000
open("/lib/libusb-0.1.so.4", O_RDONLY)  = -1 ENOENT (No such file or 
directory)
open("/lib/libusb-0.1.so.4", O_RDONLY)  = -1 ENOENT (No such file or 
directory)
open("/usr/lib/libusb-0.1.so.4", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=28260, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0x40006000
read(3, 
"\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\354\21\0\0004\0\0\0\314"..., 
4096) = 4096
mmap2(NULL, 61440, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 
0x4000e000
mmap2(0x4000e000, 21548, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) 
= 0x4000e000
mmap2(0x4001b000, 6668, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 
0x5) = 0x4001b000
close(3)                                = 0
munmap(0x40006000, 4096)                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=41632, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0x40006000
read(3, 
"\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\340\35\0\0004\0\0\0\10"..., 
4096) = 4096
mmap2(NULL, 73728, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 
0x4001d000
mmap2(0x4001d000, 40008, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) 
= 0x4001d000
mmap2(0x4002e000, 3656, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 
0x9) = 0x4002e000
close(3)                                = 0
munmap(0x40006000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227711, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0x40006000
read(3, 
"\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0000{\0\0004\0\0\0\260"..., 
4096) = 4096
mmap2(NULL, 278528, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 
0x4002f000
mmap2(0x4002f000, 223610, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 
0) = 0x4002f000
mmap2(0x4006d000, 4908, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 
0x36) = 0x4006d000
mmap2(0x4006f000, 13216, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4006f000
close(3)                                = 0
munmap(0x40006000, 4096)                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=41632, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227711, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227711, ...}) = 0
close(3)                                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=21168, ...}) = 
0
mprotect(0x4006d000, 4096, PROT_READ)   = 0
mprotect(0x4000c000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo 
...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo 
...}) = 0
open("/dev/bus/usb", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No such 
file or directory)
open("/proc/bus/usb", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = 3
fstat(3, {st_mode=S_IFDIR|0555, st_size=0, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
brk(0)                                  = 0x11000
brk(0x12000)                            = 0x12000
getdents(3, /* 2 entries */, 984)       = 32
getdents(3, /* 0 entries */, 984)       = 0
close(3)                                = 0
open("", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No such file or 
directory)
exit(0) 

Julien Boibessot <julien.boibessot@free.fr> wrote on 2010.01.05 09:26:14:
> >
> > When I test it with our very simple usb test program, nothing happen.
> > I try to "test" it with lsusb, nothing too.
> For lsusb: do you have "/var/lib/misc/usb.ids" or an equivalent on your
> system ?
> For your usb test program you should probably give it a try with:
>     # strace us
> 
> Regards,
> Julien
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100105/2f1e4df8/attachment.htm>
