From: Martin Hicks <mort@bork.org>
Date: Mon, 14 Feb 2011 14:18:17 -0500
Subject: [Buildroot] Strange hang while executing commands
Message-ID: <AANLkTikvXk7qzFov-25Xu_MmUXdkYMdwkKkGtsRzhUwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Does anyone have any clues where I might start looking for the reason
behind commands within the procps package just hanging?

The built-in busybox commands work fine.  I wanted vmstat from procps,
but it hangs too.

Strace shows:

execve("/bin/ps", ["ps", "aux"], [/* 15 vars */]) = 0 <0.001063>
brk(0)                                  = 0x10040000 <0.000065>
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4801e000 <0.000084>
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
directory) <0.000104>

[...snip...]

mmap(0xffae000, 9500, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffae000 <0.000082>
close(3)                                = 0 <0.000032>
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x48020000 <0.000057>
mprotect(0xffa9000, 16384, PROT_READ)   = 0 <0.000104>
mprotect(0x4802e000, 4096, PROT_READ)   = 0 <0.000077>
munmap(0x4801f000, 64)                  = 0 <0.000098>
uname({sys="Linux", node="targa4v2", ...}) = 0 <0.000115>
--- SIGINT (Interrupt) @ 0 (0) ---
+++ killed by SIGINT +++


-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
