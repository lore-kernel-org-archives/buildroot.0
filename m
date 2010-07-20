From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Jul 2010 18:36:41 +0000 (UTC)
Subject: [Buildroot] [Bug 2257] New: Convert netsnmp package to autotargets
Message-ID: <bug-2257-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2257

              Host: i686-linux
            Target: arm
           Summary: Convert netsnmp package to autotargets
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2257
  --> https://bugs.busybox.net/attachment.cgi?id=2257
Convert netsnmp package to autotargets, take 1

Convert netsnmp package to autotargets:

* Enabled external toolchain builds, worked for me (built, not run) with ct-ng
(glibc).
* Install into staging for packages that might use it (tested with collectd,
not yet in BR).
* Ditched IPX transport, dunno if that still works and very likely irrelevant.
* Disabled ucd-snmp compatibility for size reasons, no package in BR links to
net-snmp so nothing to preserve there. Collectd links and works fine without
the compat bits.
* No need to do magic with the transport, it's autodetected.
* Ditched a lot of unnecessary configure options that are defaults.

Give it a nice spin and report back please, specially those who love external
toolchains.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
