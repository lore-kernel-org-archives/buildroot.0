From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  8 Mar 2009 00:02:52 +0000 (UTC)
Subject: [Buildroot] [Bug 155] uClibc 0.9.28.3 fails to build
In-Reply-To: <bug-155-163@https.bugs.busybox.net/>
References: <bug-155-163@https.bugs.busybox.net/>
Message-ID: <20090308000252.D33B87646C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=155





--- Comment #1 from Luke <luke_tucker@yahoo.co.uk>  2009-03-08 00:02:52 UTC ---
I looked at 0.9.29 and found an easy patch:

--- uClibc-0.9.28.3/libc/sysdeps/linux/mips/clone.S.orig        2009-03-08
01:00:30.000000000 +0100
+++ uClibc-0.9.28.3/libc/sysdeps/linux/mips/clone.S     2009-03-08
01:01:06.000000000 +0100
@@ -24,7 +24,7 @@
 #include <sys/regdef.h>
 #define _ERRNO_H       1
 #include <bits/errno.h>
-#include <asm/asm.h>
+#include <sys/asm.h>

 /* int clone(int (*fn)(void *arg), void *child_stack, int flags, void *arg) */


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
