From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2011 23:45:48 +0000 (UTC)
Subject: [Buildroot] [Bug 4387] New: Make sure that dest dir exists before
 installing mtd files
Message-ID: <bug-4387-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4387

           Summary: Make sure that dest dir exists before installing mtd
                    files
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d_mo1234 at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3697
  --> https://bugs.busybox.net/attachment.cgi?id=3697
patch file

I ran into a situation where a custom target skeleton did not have a /usr/sbin
- it relied on something else to make it (busybox?).  So when mtd.mk tried to
install things to it, install bombed out.  (I think that we were probably using
the new version of "make", which no longer sorts wildcards in alphabetical
order - so mtd might have been before busybox.)

I have attached a patch to make sure installation directory actually exists. 
Seems like a prudent thing to do.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
