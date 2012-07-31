From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Jul 2012 07:37:57 +0000 (UTC)
Subject: [Buildroot] [Bug 5420] New: Dbus and /var/run management
Message-ID: <bug-5420-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5420

           Summary: Dbus and /var/run management
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: vincent at ouhena.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4466
  --> https://bugs.busybox.net/attachment.cgi?id=4466
Remove /var/run from target

Some BSP vendors manage /var/run as a symlink to /tmp. Dbus package creates a
target/var/run/dbus directory which can prevent the final symlink. Since
S30dbus handles the creation of /var/run/dbus, it can be removed from target
directory.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
