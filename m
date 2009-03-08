From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  8 Mar 2009 00:22:35 +0000 (UTC)
Subject: [Buildroot] [Bug 155] uClibc 0.9.28.3 fails to build
In-Reply-To: <bug-155-163@https.bugs.busybox.net/>
References: <bug-155-163@https.bugs.busybox.net/>
Message-ID: <20090308002235.A64D97646C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=155





--- Comment #2 from Luke <luke_tucker@yahoo.co.uk>  2009-03-08 00:22:35 UTC ---
Ooops, I jumped the gun a bit. The asm directory also needs patching in the
following files.


--- uClibc-0.9.28.3/libc/sysdeps/linux/mips/pipe.S.orig 2009-03-08
01:15:35.000000000 +0100
+++ uClibc-0.9.28.3/libc/sysdeps/linux/mips/pipe.S      2009-03-08
01:16:35.000000000 +0100
@@ -3,9 +3,9 @@
 /*see uClibc's sh/pipe.c and glibc-2.2.4's mips/pipe.S */

 #include <features.h>
-#include <asm/asm.h>
+#include <sys/asm.h>
 #include <asm/unistd.h>
-#include <asm/regdef.h>
+#include <sys/regdef.h>

         .globl  pipe
         .ent    pipe, 0
--- uClibc-0.9.28.3/libc/sysdeps/linux/mips/syscall.S.orig      2009-03-08
01:07:34.000000000 +0100
+++ uClibc-0.9.28.3/libc/sysdeps/linux/mips/syscall.S   2009-03-08
01:09:24.000000000 +0100
@@ -17,8 +17,8 @@
    02111-1307 USA.  */

 #include <features.h>
-#include <asm/asm.h>
-#include <asm/regdef.h>
+#include <sys/asm.h>
+#include <sys/regdef.h>

 #ifdef __PIC__
        .option pic2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
