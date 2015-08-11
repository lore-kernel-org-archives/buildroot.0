From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2015 01:49:53 +0000 (UTC)
Subject: [Buildroot] [Bug 8276] New: package/dropbear: symlink resolution
	incorrect
Message-ID: <bug-8276-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8276

           Summary: package/dropbear: symlink resolution incorrect
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nospam+busybox at jtang.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Commit 6dc5c7ff changed how the /etc/dropbear symlink is detected, by using
readlink to resolve the target location. When using coreutils's readlink,
"readlink -f /etc/dropbear" will return /var/run/dropbear. However, if using
busybox's readlink, the same "readlink -f /etc/dropbear" returns an empty
string. I am not sure if this is a bug in the /etc/init.d/S50dropbear script,
or if busybox is not honoring the "-f" flag.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
