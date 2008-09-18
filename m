From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 18 Sep 2008 07:48:09 -0700
Subject: [Buildroot] [buildroot 0005104]: Alsamixer always fails with
	alsamixer: function snd_mixer_load failed: Inappropriate
	ioctl for device
Message-ID: <9c1881253b702d6ac058493509062f58@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5104 
====================================================================== 
Reported By:                kb3lms
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5104
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-18-2008 07:48 PDT
Last Modified:              09-18-2008 07:48 PDT
====================================================================== 
Summary:                    Alsamixer always fails with alsamixer: function
snd_mixer_load failed: Inappropriate ioctl for device
Description: 
I am working with an ARM processor on the at91SAM9260-ek board and am
trying to get sound to work.  I've looked at all the information on the
web that I can find and while I find references to this issue, I have
tried all of the patches and remedies to no avail.  Alsa-lib is version
1.0.16 and alsa-utils is version 1.0.16.  Have tried different versions
with no effect as well as the alsa-lib-util patch from this site with no
effect either.  Maybe I am doing something dumb?  If so, please point me
in a direction but this appears to be a bug. 

Incidentally, no other alsa utils work any better.

Thanks,
Jason

Strace shows:

~ # strace alsamixer
execve("/usr/bin/alsamixer", ["alsamixer"], [/* 6 vars */]) = 0
mmap2(NULL, 20, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x40005000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=2534, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
mmap2(NULL, 2534, PROT_READ, MAP_SHARED, 3, 0) = 0x40006000
close(3)                                = 0
open("/lib/libncurses.so.5", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=272720, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\30\336\0"..., 4096)
= 4096
mmap2(NULL, 307200, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x4000e000
mmap2(0x4000e000, 239380, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3,
0) = 0x4000e000
mmap2(0x40050000, 34096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0x3a) = 0x40050000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721620, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\330\357\1"...,
4096) = 4096
mmap2(NULL, 753664, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x40059000
mmap2(0x40059000, 700700, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3,
0) = 0x40059000
mmap2(0x4010d000, 15948, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0xac) = 0x4010d000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=45939, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\264\22\0"..., 4096)
= 4096
mmap2(NULL, 81920, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x40111000
mmap2(0x40111000, 41872, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0)
= 0x40111000
mmap2(0x40123000, 4100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0xa) = 0x40123000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=9027, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\210\7\0\000"...,
4096) = 4096
mmap2(NULL, 40960, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x40125000
mmap2(0x40125000, 5760, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0)
= 0x40125000
mmap2(0x4012e000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0x1) = 0x4012e000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=63979, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\224=\0\000"...,
4096) = 4096
mmap2(NULL, 106496, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x4012f000
mmap2(0x4012f000, 41892, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0)
= 0x4012f000
mmap2(0x40141000, 21732, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0xa) = 0x40141000
mmap2(0x40147000, 5796, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40147000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=522823, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0`\237\0\000"...,
4096) = 4096
mmap2(NULL, 577536, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x40149000
mmap2(0x40149000, 519172, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3,
0) = 0x40149000
mmap2(0x401cf000, 5020, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0x7e) = 0x401cf000
mmap2(0x401d1000, 17004, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x401d1000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=522823, ...}) = 0
close(3)                                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=45939, ...}) = 0
close(3)                                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=9027, ...}) = 0
close(3)                                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=63979, ...}) = 0
close(3)                                = 0
open("/lib/librt.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=4735, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0004\5\0\000"...,
4096) = 4096
mmap2(NULL, 36864, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x401d6000
mmap2(0x401d6000, 2300, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0)
= 0x401d6000
mmap2(0x401de000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0)
= 0x401de000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=522823, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=522823, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=522823, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=522823, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=522823, ...}) = 0
close(3)                                = 0
munmap(0x40006000, 2534)                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=21168, ...}) =
0
mprotect(0x40123000, 4096, PROT_READ)   = 0
mprotect(0x4012e000, 4096, PROT_READ)   = 0
mprotect(0x40141000, 4096, PROT_READ)   = 0
mprotect(0x401cf000, 4096, PROT_READ)   = 0
mprotect(0x401de000, 4096, PROT_READ)   = 0
mprotect(0x4000c000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo
...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo
...}) = 0
getpid()                                = 832
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=1075059928}) = 0
setrlimit(RLIMIT_STACK, {rlim_cur=2040*1024, rlim_max=1075059928}) = 0
rt_sigaction(SIGRTMIN, {0x4013910c, [], 0x4000000 /* SA_??? */}, NULL, 8)
= 0
rt_sigaction(SIGRT_1, {0x4013903c, [RTMIN], 0x4000000 /* SA_??? */}, NULL,
8) = 0
rt_sigaction(SIGRT_2, {0x4013866c, [], 0x4000000 /* SA_??? */}, NULL, 8) =
0
rt_sigprocmask(SIG_BLOCK, [RTMIN], NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RT_1], NULL, 8) = 0
brk(0)                                  = 0x11000
brk(0x12000)                            = 0x12000
stat64("/usr/share/alsa/alsa.conf", {st_mode=S_IFREG|0644, st_size=8617,
...}) = 0
open("/usr/share/alsa/alsa.conf", O_RDONLY|O_LARGEFILE) = 3
ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbef38a48) = -1 ENOTTY
(Inappropriate ioctl for device)
brk(0x13000)                            = 0x13000
read(3, "#\n#  ALSA library configuration "..., 4096) = 4096
brk(0x14000)                            = 0x14000
brk(0x15000)                            = 0x15000
brk(0x16000)                            = 0x16000
read(3, " refer\n\t\t\t\tname defaults.pcm.dev"..., 4096) = 4096
brk(0x17000)                            = 0x17000
brk(0x18000)                            = 0x18000
brk(0x19000)                            = 0x19000
brk(0x1a000)                            = 0x1a000
brk(0x1b000)                            = 0x1b000
read(3, "fault {\n\t\t\t at func refer\n\t\t\tname d"..., 4096) = 425
read(3, "", 4096)                       = 0
close(3)                                = 0
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=2534, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
mmap2(NULL, 2534, PROT_READ, MAP_SHARED, 3, 0) = 0x40006000
close(3)                                = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721620, ...}) = 0
close(3)                                = 0
access("/etc/asound.conf", R_OK)        = -1 ENOENT (No such file or
directory)
access("~/.asoundrc", R_OK)             = -1 ENOENT (No such file or
directory)
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721620, ...}) = 0
close(3)                                = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721620, ...}) = 0
close(3)                                = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721620, ...}) = 0
close(3)                                = 0
open("/dev/snd/controlC0", O_RDONLY|O_LARGEFILE) = 3
close(3)                                = 0
open("/dev/snd/controlC0", O_RDWR|O_LARGEFILE) = 3
ioctl(3, USBDEVFS_CONTROL, 0xbef38b24)  = 0
ioctl(3, UI_DEV_CREATE, 0xbef38c18)     = 0
close(3)                                = 0
stat64("/usr/share/alsa/alsa.conf", {st_mode=S_IFREG|0644, st_size=8617,
...}) = 0
open("/usr/share/alsa/alsa.conf", O_RDONLY|O_LARGEFILE) = 3
ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbef38a18) = -1 ENOTTY
(Inappropriate ioctl for device)
read(3, "#\n#  ALSA library configuration "..., 4096) = 4096
read(3, " refer\n\t\t\t\tname defaults.pcm.dev"..., 4096) = 4096
read(3, "fault {\n\t\t\t at func refer\n\t\t\tname d"..., 4096) = 425
read(3, "", 4096)                       = 0
close(3)                                = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721620, ...}) = 0
close(3)                                = 0
access("/etc/asound.conf", R_OK)        = -1 ENOENT (No such file or
directory)
access("~/.asoundrc", R_OK)             = -1 ENOENT (No such file or
directory)
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721620, ...}) = 0
close(3)                                = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721620, ...}) = 0
close(3)                                = 0
open("/dev/snd/controlC0", O_RDONLY|O_LARGEFILE) = 3
close(3)                                = 0
open("/dev/snd/controlC0", O_RDWR|O_LARGEFILE) = 3
ioctl(3, USBDEVFS_CONTROL, 0xbef38af4)  = 0
fcntl64(3, F_GETFL)                     = 0x20002 (flags
O_RDWR|O_LARGEFILE)
fcntl64(3, F_SETFL, O_RDWR|O_NONBLOCK|O_LARGEFILE) = 0
ioctl(3, USBDEVFS_RELEASEINTERFACE, 0xbef38ba8) = 0
ioctl(3, USBDEVFS_RELEASEINTERFACE, 0xbef38ba8) = 0
ioctl(3, USBDEVFS_CONNECTINFO, 0xbef38938) = 0
ioctl(3, USBDEVFS_IOCTL, 0xbef384f0)    = -1 ENOTTY (Inappropriate ioctl
for device)
write(1, "\n", 1
)                       = 1
write(2, "alsamixer: function ", 20alsamixer: function )    = 20
write(2, "snd_mixer_load", 14snd_mixer_load)          = 14
write(2, " failed: ", 9 failed: )                = 9
write(2, "Inappropriate ioctl for device", 30Inappropriate ioctl for
device) = 30
write(2, "\n", 1
)                       = 1
exit(2)                                 = ?
Process 832 detached
~ # 


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-18-08 07:48  kb3lms         New Issue                                    
09-18-08 07:48  kb3lms         Status                   new => assigned     
09-18-08 07:48  kb3lms         Assigned To               => buildroot       
======================================================================
