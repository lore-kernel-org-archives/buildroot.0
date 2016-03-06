From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 06 Mar 2016 12:55:58 +0000
Subject: [Buildroot] [Bug 8766] Compiling host-gcc-final-4.9.3 broken on i386
In-Reply-To: <bug-8766-163@https.bugs.busybox.net/>
References: <bug-8766-163@https.bugs.busybox.net/>
Message-ID: <bug-8766-163-KrIr9Yrq7m@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8766

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
(In reply to Thomas Petazzoni from comment #1)
>  2/ Are we also seeing this <pthread.h> missing problem when building with no
> threads on i486+. If we also have this problem, then I don't see how the "none" 
> thread implementation can still be useful.

I just tested, it also fails with the same error on i486 with thread support
disabled. I.E this defconfig:

BR2_x86_i486=y
BR2_PTHREADS_NONE=y

fails to build with:

../../../libgcc/generic-morestack-thread.c:41:21: fatal error: pthread.h: No
such file or directory
 #include <pthread.h>
                     ^
compilation terminated.
make[4]: *** [generic-morestack-thread.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [all-target-libgcc] Error 2
make[2]: *** [all] Error 2
make[1]: ***
[/home/test/outputs/i486-nothread/build/host-gcc-final-4.9.3/.stamp_built]
Error 2
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
