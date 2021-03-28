From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 28 Mar 2021 17:41:43 +0000
Subject: [Buildroot] [Bug 13671] openSSH server closes connection before
 authentication is finished
In-Reply-To: <bug-13671-163@https.bugs.busybox.net/>
References: <bug-13671-163@https.bugs.busybox.net/>
Message-ID: <bug-13671-163-GT6qOwdQXc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13671

--- Comment #10 from romain.naour at gmail.com ---
See https://lore.kernel.org/lkml/20190719170343.GA13680 at linux.intel.com/

"Using __NR_clock_gettime64 instead of __NR_clock_gettime breaks userspace
applications that use seccomp filtering to block syscalls, as applications
are completely unaware of the newly added of __NR_clock_gettime64, e.g.
sshd gets zapped on syscall(403) when attempting to ssh into the system."

The issue doesn't seems fixed with a running kernel 5.10.7 with a system built
with a toolchain using 4.19.x kernel headers.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
