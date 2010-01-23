From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 23 Jan 2010 10:21:57 +0000 (UTC)
Subject: [Buildroot] [Bug 949] New: compile with debug info
Message-ID: <bug-949-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=949

           Summary: compile with debug info
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P4
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: yasser_kashfi at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


if user dos not select 'build with debug info' the default compile flag is set
to -g. however this is wrong. in this case compile flag (cflags & cxxflags)
must be set to -g0. I solved this problem by patch the fallowing file:
package/Makefile.in:
+ifneq ($(BR2_ENABLE_DEBUG),y)
+TARGET_DEBUGGING=-g0
+endif
ifeq ($(BR2_DEBUG_1),y)
TARGET_DEBUGGING=-g1
endif
...

best regards


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
