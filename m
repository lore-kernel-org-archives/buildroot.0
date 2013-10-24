From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Oct 2013 13:08:43 +0000 (UTC)
Subject: [Buildroot] [Bug 6602] New: ebtables 64 bit kernel + 32 bit
 userland alignment error - fix included
Message-ID: <bug-6602-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6602

           Summary: ebtables 64 bit kernel + 32 bit userland alignment
                    error - fix included
           Product: buildroot
           Version: 2013.08
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cassiano at idbinfo.com.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


ebtables fails add or list any kernel rules. it prints the following message:

"The kernel doesn't support the ebtables filter table."


I've had to add the following cflags to the build process: -DEBT_MIN_ALIGN=8
-DKERNEL_64_USERSPACE_32

This fixes when building a 32 bit userland and a 64 bit kernel on mips64
platform. 

Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
