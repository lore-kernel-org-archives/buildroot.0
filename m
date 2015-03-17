From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Mar 2015 21:50:33 +0000 (UTC)
Subject: [Buildroot] [Bug 7941] glibc-2.20 fails to build for
	sparc-buildroot-linux-gnu
In-Reply-To: <bug-7941-163@https.bugs.busybox.net/>
References: <bug-7941-163@https.bugs.busybox.net/>
Message-ID: <20150317215033.48B6E807B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7941

--- Comment #2 from mail at waldemar-brodkorb.de 2015-03-17 21:50:33 UTC ---
You could also apply this simple patch:
diff -Nur glibc-2.20.orig/sysdeps/sparc/sparc32/sem_trywait.c
glibc-2.20/sysdeps/sparc/sparc32/sem_trywait.c
--- glibc-2.20.orig/sysdeps/sparc/sparc32/sem_trywait.c 2014-09-07
10:09:09.000000000 +0200
+++ glibc-2.20/sysdeps/sparc/sparc32/sem_trywait.c      2014-09-13
10:21:44.000000000 +0200
@@ -22,6 +22,7 @@
 #include <lowlevellock.h>
 #include <internaltypes.h>
 #include <semaphore.h>
+#include <sparc-nptl.h>

 #include <shlib-compat.h>

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
