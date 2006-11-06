From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Mon, 6 Nov 2006 10:54:13 +0100
Subject: [Buildroot] strace unknown syscall trap 0xe1a00000
Message-ID: <20061106095413.GA5528@synertronixx3>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks!

Currently I am debugging a segfault in my toolchain and realize that
strace is still not working on my ARM9:

# strace echo
execve("/bin/echo", ["echo"], [/* 15 vars */]) = 0
syscall: unknown syscall trap 0xe1a00000

This is strace-4.5.12 build from a buidlroot snapshot of early November
with these patches applied:

Applying strace-dont-use-REG_SYSCALL-for-sh.patch using plaintext: 
patching file process.c
Hunk #1 succeeded at 2662 (offset -1 lines).

Applying strace-fix-arm-bad-syscall.patch using plaintext: 
patching file syscall.c

Applying strace-superh-update.patch using plaintext: 
patching file configure

Applying strace-undef-syscall.patch using plaintext: 
patching file linux/syscallent.h

One patch I loaded down by myself in case to fix that from

http://www.fluff.org/ben/patches/strace/strace-fix-arm-bad-syscall.patch

But the error is the same with or without.

Is there a way to fix this?

Regards, Konsti


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
