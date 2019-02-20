From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Feb 2019 21:17:54 +0000
Subject: [Buildroot] [Bug 11681]
 .../buildroot/output/host/bin/x86_64-buildroot-linux-gnu-ld:
 arch/x86/kernel/head_64.o: unable to initialize decompress status for
 section .debug_line
In-Reply-To: <bug-11681-163@https.bugs.busybox.net/>
References: <bug-11681-163@https.bugs.busybox.net/>
Message-ID: <bug-11681-163-yPfbFwiRMz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11681

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
You need to set BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y.

Perhaps we should add a check in linux.mk that detects that the kernel build
will use libelf, and error out before building if
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF is not set.

For now, however, I'm marking this as WORKSFORME.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
