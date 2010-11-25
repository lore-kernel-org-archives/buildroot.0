From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Nov 2010 18:34:54 +0000 (UTC)
Subject: [Buildroot] [Bug 2857] New: OBJDUMP definition is missing from
 TARGET_CONFIGURE_OPTS
Message-ID: <bug-2857-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2857

           Summary: OBJDUMP definition is missing from
                    TARGET_CONFIGURE_OPTS
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mroberto at cpti.cetuc.puc-rio.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2737
  --> https://bugs.busybox.net/attachment.cgi?id=2737
Patch to fix the missing OBJDUMP definition issue.

The OBJDUMP was missing from TARGET_CONFIGURE_OPTS.

In my case, I had problems when installing a package of my own that had a linux
kernel module. The call to objdump would fail.

This patch adds it to the proper place in package/Makefile.in.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
