From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Jan 2014 21:02:27 +0000 (UTC)
Subject: [Buildroot] [Bug 6752] New: genext2fs: e2fsck must run before
	tunefs -U random
Message-ID: <bug-6752-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6752

           Summary: genext2fs: e2fsck must run before tunefs -U random
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: daniel at exxm.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5138
  --> https://bugs.busybox.net/attachment.cgi?id=5138
patch

In fs/ext2/genext2fs.sh, e2fsck must run after changing filesystem options and
before setting the UUID with "tune2fs -U random". Otherwise, the latter command
will fail.

I previously got this error message

"tune2fs 1.42.9 (28-Dec-2013)

Please run e2fsck on the filesystem."

It worked for me after moving e2fsck before "tune2fs -U random"

This is based on commit bfbe4dd19e94fb24037e3b6080acd75435adbb67

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
