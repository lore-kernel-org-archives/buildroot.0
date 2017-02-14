From: LogiSch17 <logi.tss@hotmail.de>
Date: Tue, 14 Feb 2017 02:36:54 -0800 (PST)
Subject: [Buildroot] Shell scripts does not emit finished() to QProcess
In-Reply-To: <1487066819690-156977.post@n4.nabble.com>
References: <1486997512738-156891.post@n4.nabble.com>
 <ce6994a6-76f7-a075-51b6-e80dc306cdd8@gmail.com>
 <1487066819690-156977.post@n4.nabble.com>
Message-ID: <1487068614309-156991.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the strace -f of the cpupdt.sh file.
Can i also strace -f my qt gui programm? cause when i try i am stuck i an
nano sleep.. an the gui never shows up.
Sry for this nooby question but i never worked with strace before.

execve("/bin/su", ["su", "root", "/usr/bin/cpupdt.sh"], [/* 12 vars */]) = 0
readlinkat(AT_FDCWD, "/proc/self/exe", "/bin/busybox", 4096) = 12
mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0xb6f34000
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=432252, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0xb6f33000
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0P\345\0\0004\0\0\0"..., 4096)
= 4096
mmap2(NULL, 589824, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb6e90000
mmap2(0xb6e90000, 425136, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0)
= 0xb6e90000
mmap2(0xb6f08000, 4860, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0x68000) = 0xb6f08000
mmap2(0xb6f0a000, 88100, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6f0a000
close(3)                                = 0
munmap(0xb6f33000, 4096)                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=28512, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0xb6f33000
set_tls(0xb6f33490, 0xb6f33000, 0xb6f33b38, 0xb6f33490, 0xb6f35f70) = 0
mprotect(0xb6f08000, 4096, PROT_READ)   = 0
mprotect(0xb6f35000, 4096, PROT_READ)   = 0
set_tid_address(0xb6f33068)             = 161
set_robust_list(0xb6f33070, 12)         = 0
rt_sigaction(SIGRTMIN, {0xb6eec30c, [], SA_RESTORER|SA_SIGINFO, 0xb6e9eda0},
NULL, 8) = 0
rt_sigaction(SIGRT_1, {0xb6eec1cc, [], SA_RESTORER|SA_RESTART|SA_SIGINFO,
0xb6e9eda0}, NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
ugetrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0
ioctl(1, TCGETS, 0xbeda4a5c)            = -1 ENOTTY (Inappropriate ioctl for
device)
getuid32()                              = 0
getuid32()                              = 0
fstat64(2, {st_mode=S_IFREG|0644, st_size=1993, ...}) = 0
ioctl(2, TCGETS, 0xbeda4a64)            = -1 ENOTTY (Inappropriate ioctl for
device)
brk(NULL)                               = 0x1997000
brk(0x1998000)                          = 0x1998000
open("/etc/passwd", O_RDONLY)           = 3
ioctl(3, TCGETS, 0xbeda4b74)            = -1 ENOTTY (Inappropriate ioctl for
device)
brk(0x1999000)                          = 0x1999000
read(3, "root:x:0:0:root:/root:/bin/sh\nda"..., 4096) = 340
close(3)                                = 0
socket(AF_UNIX, SOCK_DGRAM, 0)          = 3
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
fcntl(3, F_GETFL)                       = 0x2 (flags O_RDWR)
fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK)    = 0
connect(3, {sa_family=AF_UNIX, sun_path="/dev/log"}, 16) = 0
fcntl(3, F_GETFL)                       = 0x802 (flags O_RDWR|O_NONBLOCK)
fcntl(3, F_SETFL, O_RDWR)               = 0
setsockopt(3, SOL_SOCKET, SO_SNDTIMEO, "\1\0\0\0\0\0\0\0", 8) = 0
gettimeofday({248, 571604}, NULL)       = 0
open("/etc/TZ", O_RDONLY)               = -1 ENOENT (No such file or
directory)
open("/etc/localtime", O_RDONLY)        = -1 ENOENT (No such file or
directory)
send(3, "<37>Jan  1 00:04:08 su: + none r"..., 41, MSG_NOSIGNAL) = 41
close(3)                                = 0
open("/etc/group", O_RDONLY)            = 3
ioctl(3, TCGETS, 0xbeda4a5c)            = -1 ENOTTY (Inappropriate ioctl for
device)
read(3, "root:x:0:\ndaemon:x:1:\nbin:x:2:\ns"..., 4096) = 321
read(3, "", 4096)                       = 0
close(3)                                = 0
setgroups32(2, [0, 10])                 = 0
setgid32(0)                             = 0
setuid32(0)                             = 0
execve("/bin/sh", ["sh", "/usr/bin/cpupdt.sh"], [/* 12 vars */]) = 0
readlinkat(AT_FDCWD, "/proc/self/exe", "/bin/busybox", 4096) = 12
mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0xb6f15000
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=432252, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0xb6f14000
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0P\345\0\0004\0\0\0"..., 4096)
= 4096
mmap2(NULL, 589824, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb6e71000
mmap2(0xb6e71000, 425136, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0)
= 0xb6e71000
mmap2(0xb6ee9000, 4860, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0x68000) = 0xb6ee9000
mmap2(0xb6eeb000, 88100, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6eeb000
close(3)                                = 0
munmap(0xb6f14000, 4096)                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=28512, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0xb6f14000
set_tls(0xb6f14490, 0xb6f14000, 0xb6f14b38, 0xb6f14490, 0xb6f16f70) = 0
mprotect(0xb6ee9000, 4096, PROT_READ)   = 0
mprotect(0xb6f16000, 4096, PROT_READ)   = 0
set_tid_address(0xb6f14068)             = 161
set_robust_list(0xb6f14070, 12)         = 0
rt_sigaction(SIGRTMIN, {0xb6ecd30c, [], SA_RESTORER|SA_SIGINFO, 0xb6e7fda0},
NULL, 8) = 0
rt_sigaction(SIGRT_1, {0xb6ecd1cc, [], SA_RESTORER|SA_RESTART|SA_SIGINFO,
0xb6e7fda0}, NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
ugetrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0
ioctl(1, TCGETS, 0xbee58a5c)            = -1 ENOTTY (Inappropriate ioctl for
device)
getuid32()                              = 0
brk(NULL)                               = 0x1cf000
brk(0x1d0000)                           = 0x1d0000
brk(0x1d1000)                           = 0x1d1000
rt_sigaction(SIGCHLD, {SIG_DFL, [CHLD], SA_RESTORER|SA_RESTART, 0xb6e7fd94},
{SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGHUP, {SIG_DFL, [HUP], SA_RESTORER|SA_RESTART, 0xb6e7fd94},
{SIG_DFL, [], 0}, 8) = 0
getppid()                               = 159
uname({sysname="Linux", nodename="buildroot", ...}) = 0
stat64("/usr", {st_mode=S_IFDIR|0755, st_size=1024, ...}) = 0
stat64(".", {st_mode=S_IFDIR|0755, st_size=1024, ...}) = 0
open("/usr/bin/cpupdt.sh", O_RDONLY|O_LARGEFILE) = 3
fcntl64(3, F_DUPFD, 10)                 = 10
close(3)                                = 0
fcntl64(10, F_SETFD, FD_CLOEXEC)        = 0
rt_sigaction(SIGINT, NULL, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGINT, {0x43c48, ~[], SA_RESTORER, 0xb6e7fd94}, NULL, 8) = 0
rt_sigaction(SIGQUIT, NULL, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGQUIT, {SIG_IGN, ~[], SA_RESTORER, 0xb6e7fd94}, NULL, 8) = 0
rt_sigaction(SIGTERM, NULL, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGTERM, {SIG_DFL, ~[], SA_RESTORER, 0xb6e7fd94}, NULL, 8) = 0
read(10, "#!/bin/sh\nLOGFILE=\"/var/ziesel/s"..., 1023) = 409
wait4(-1, 0xbee58708, WNOHANG, NULL)    = -1 ECHILD (No child processes)
brk(0x1d2000)                           = 0x1d2000
wait4(-1, 0xbee585c0, WNOHANG, NULL)    = -1 ECHILD (No child processes)
stat64("/usr/update", 0xbee58338)       = -1 ENOENT (No such file or
directory)
wait4(-1, 0xbee585c0, WNOHANG, NULL)    = -1 ECHILD (No child processes)
stat64("/usr/update.enc", 0xbee58338)   = -1 ENOENT (No such file or
directory)
wait4(-1, 0xbee585c0, WNOHANG, NULL)    = -1 ECHILD (No child processes)
stat64("/usr/update.zip", 0xbee58338)   = -1 ENOENT (No such file or
directory)
stat64("/bin/cp", {st_mode=S_IFREG|S_ISUID|0755, st_size=682680, ...}) = 0
clone(child_stack=NULL,
flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
child_tidptr=0xb6f14068) = 162
wait4(-1, strace: Process 162 attached
 <unfinished ...>
[pid   162] close(10)                   = 0
[pid   162] rt_sigaction(SIGQUIT, {SIG_DFL, ~[], SA_RESTORER, 0xb6e7fd94},
NULL, 8) = 0
[pid   162] execve("/bin/cp", ["cp", "-f", "/media/upStick/update.enc",
"/usr/update.enc"], [/* 12 vars */]) = 0
[pid   162] readlinkat(AT_FDCWD, "/proc/self/exe", "/bin/busybox", 4096) =
12
[pid   162] mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0xb6fb2000
[pid   162] open("/lib/libc.so.0", O_RDONLY) = 3
[pid   162] fstat(3, {st_mode=S_IFREG|0755, st_size=432252, ...}) = 0
[pid   162] mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0xb6fb1000
[pid   162] read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0P\345\0\0004\0\0\0"..., 4096)
= 4096
[pid   162] mmap2(NULL, 589824, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0xb6f0e000
[pid   162] mmap2(0xb6f0e000, 425136, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6f0e000
[pid   162] mmap2(0xb6f86000, 4860, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x68000) = 0xb6f86000
[pid   162] mmap2(0xb6f88000, 88100, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6f88000
[pid   162] close(3)                    = 0
[pid   162] munmap(0xb6fb1000, 4096)    = 0
[pid   162] stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755,
st_size=28512, ...}) = 0
[pid   162] mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0xb6fb1000
[pid   162] set_tls(0xb6fb1490, 0xb6fb1000, 0xb6fb1b38, 0xb6fb1490,
0xb6fb3f70) = 0
[pid   162] mprotect(0xb6f86000, 4096, PROT_READ) = 0
[pid   162] mprotect(0xb6fb3000, 4096, PROT_READ) = 0
[pid   162] set_tid_address(0xb6fb1068) = 162
[pid   162] set_robust_list(0xb6fb1070, 12) = 0
[pid   162] rt_sigaction(SIGRTMIN, {0xb6f6a30c, [], SA_RESTORER|SA_SIGINFO,
0xb6f1cda0}, NULL, 8) = 0
[pid   162] rt_sigaction(SIGRT_1, {0xb6f6a1cc, [],
SA_RESTORER|SA_RESTART|SA_SIGINFO, 0xb6f1cda0}, NULL, 8) = 0
[pid   162] rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
[pid   162] ugetrlimit(RLIMIT_STACK, {rlim_cur=8192*1024,
rlim_max=RLIM_INFINITY}) = 0
[pid   162] ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0
[pid   162] ioctl(1, TCGETS, 0xbead2a3c) = -1 ENOTTY (Inappropriate ioctl
for device)
[pid   162] getuid32()                  = 0
[pid   162] stat64("/media/upStick/update.enc", {st_mode=S_IFREG|0755,
st_size=2504300, ...}) = 0
[pid   162] stat64("/usr/update.enc", 0xbead2b40) = -1 ENOENT (No such file
or directory)
[pid   162] stat64("/media/upStick/update.enc", {st_mode=S_IFREG|0755,
st_size=2504300, ...}) = 0
[pid   162] lstat64("/usr/update.enc", 0xbead2a40) = -1 ENOENT (No such file
or directory)
[pid   162] open("/media/upStick/update.enc", O_RDONLY|O_LARGEFILE) = 3
[pid   162] open("/usr/update.enc", O_WRONLY|O_CREAT|O_EXCL|O_LARGEFILE,
0100755) = 4
[pid   162] sendfile64(4, 3, NULL, 16777216) = 2504300
[pid   162] sendfile64(4, 3, NULL, 16777216) = 0
[pid   162] close(4)                    = 0
[pid   162] close(3)                    = 0
[pid   162] exit_group(0)               = ?
[pid   162] +++ exited with 0 +++
<... wait4 resumed> [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 162
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=162, si_uid=0,
si_status=0, si_utime=0, si_stime=14} ---
open("/var/ziesel/script.txt", O_WRONLY|O_CREAT|O_APPEND|O_LARGEFILE, 0666)
= 3
fcntl64(1, F_DUPFD, 10)                 = 11
dup2(3, 1)                              = 1
close(3)                                = 0
wait4(-1, 0xbee58708, WNOHANG, NULL)    = -1 ECHILD (No child processes)
write(1, "Update Script Copy has been exec"..., 40) = 40
dup2(11, 1)                             = 1
close(11)                               = 0
open("/var/ziesel/script.txt", O_WRONLY|O_CREAT|O_APPEND|O_LARGEFILE, 0666)
= 3
fcntl64(1, F_DUPFD, 10)                 = 11
dup2(3, 1)                              = 1
close(3)                                = 0
wait4(-1, 0xbee58708, WNOHANG, NULL)    = -1 ECHILD (No child processes)
write(1, "================================"..., 60) = 60
dup2(11, 1)                             = 1
close(11)                               = 0
wait4(-1, 0xbee58708, WNOHANG, NULL)    = -1 ECHILD (No child processes)
exit_group(0)                           = ?
+++ exited with 0 +++



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Shell-scripts-does-not-emit-finished-to-QProcess-tp156891p156991.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
