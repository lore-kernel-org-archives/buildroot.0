From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 29 Nov 2014 18:48:24 +0000 (UTC)
Subject: [Buildroot] [Bug 7676] New: Package procps-ng installs binaries to
 nonsensical folder.
Message-ID: <bug-7676-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7676

           Summary: Package procps-ng installs binaries to nonsensical
                    folder.
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: kwrzalik at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Some of the files this package installs land in /usr/usr/bin directory, which I
guess is not what we need. Adding --exec-prefix=/ to PROCPS_NG_CONF_OPT in
procps-ng.mk seems to resolve this problem (or at least it installs programs
like pgrep pkill free to /usr/bin).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
