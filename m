From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  9 Sep 2011 23:17:00 +0000 (UTC)
Subject: [Buildroot] [Bug 4171] New: makedevs-unused-but-set-variable.patch
Message-ID: <bug-4171-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4171

           Summary: makedevs-unused-but-set-variable.patch
           Product: buildroot
           Version: 2010.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hector.oron at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,

  makedevs package in buildroot fails to build when `-Wunused-but-set-variable'
is set in the compiler. The following patch attempts to fix this issue:


Index: buildroot-2010.11/package/makedevs/makedevs.c
===================================================================
--- buildroot-2010.11.orig/package/makedevs/makedevs.c  2011-09-09
22:33:32.948124813 +0100
+++ buildroot-2010.11/package/makedevs/makedevs.c       2011-09-09
22:33:55.044124824 +0100
@@ -531,5 +531,5 @@
        if (system("/bin/sync"))
                bb_error_msg("sync failed, continuing anyway");

-       return 0;
+       return ret;
 }


Best regards,
  -- Hector Oron

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
