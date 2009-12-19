From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 19 Dec 2009 16:16:00 +0000 (UTC)
Subject: [Buildroot] [Bug 819] New: kexec for ARM compile error
Message-ID: <bug-819-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=819

            Target: ARM
           Summary: kexec for ARM compile error
           Product: buildroot
           Version: 2009.08
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jasaw81 at yahoo.com.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


kexec-zImage-arm.c: error: asm/page.h: No such file or directory

Need a patch to fix this:



--- kexec-tools-1.101.orig/kexec/arch/arm/kexec-zImage-arm.c 2009-07-07
13:24:17.000000000 +0100
+++ kexec-tools-1.101/kexec/arch/arm/kexec-zImage-arm.c 2009-07-07
13:24:56.000000000 +0100
@@ -11,7 +11,7 @@
 #include <stdint.h>
 #include <getopt.h>
 #include <arch/options.h>
-#include <asm/page.h>
+#include <unistd.h>
 #include "../../kexec.h"

 #define COMMAND_LINE_SIZE 1024


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
