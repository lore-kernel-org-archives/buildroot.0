From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2011 02:53:54 +0000 (UTC)
Subject: [Buildroot] [Bug 4357] New: prevent patch commands from accessing
	source control
Message-ID: <bug-4357-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4357

           Summary: prevent patch commands from accessing source control
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d_mo1234 at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3655
  --> https://bugs.busybox.net/attachment.cgi?id=3655
patch file

A little while back, I ran into a problem compiling buildroot on an older
Ubuntu (9.xx I think), where patch was attempting to perform Perforce source
control operations.  We had to fix this by adding -g0 to the patch script.  I
think this may not be a problem on newer distributions, but perhaps it would be
good to ensure that patch doesn't attempt such ops in the future by using the
-g0.

The line that we fixed is in apply-patches.sh, but I noticed that there is also
a patch command in grub.mk too.  I have attached a patch for both.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
