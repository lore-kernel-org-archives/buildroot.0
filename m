From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Apr 2012 02:23:26 +0000 (UTC)
Subject: [Buildroot] [Bug 5144] New: Patch to fix ixon bug in uemacs
Message-ID: <bug-5144-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5144

           Summary: Patch to fix ixon bug in uemacs
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: grant.b.edwards at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4298
  --> https://bugs.busybox.net/attachment.cgi?id=4298
Patch to buildroot that adds uemacs patch file that fixes ixon bug.

Attached is a patch to fix a long-known bug in uemacs.  

The bug is that uemacs doesn't clear the ixon termios flag when's it's
initializing it's tty device.  As a result of this, ctrl-S keystrokes
aren't seen by uemacs -- they're intercepted by the tty layer and
cause terminal output to stop until the user hits ctrl-Q.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
