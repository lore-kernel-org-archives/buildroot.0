From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  3 Jun 2014 12:36:19 +0000 (UTC)
Subject: [Buildroot] [Bug 7154] New: Local uClibc config file gets
 overwritten using make uclibc-update-config
Message-ID: <bug-7154-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7154

           Summary: Local uClibc config file gets overwritten using make
                    uclibc-update-config
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: oliver.kasten at trsystems.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I've defined an external place for the uClibc config file using
BR_UCLIBC_CONFIG. After editing the configuration with make uclibc-menuconfig I
want to copy the edited config file with make uclibc-update-config to the
external place.

It seems that before copying the config file to the external place, it gets
re-configured using the UCLIBC_CONFIGURE_CMDS, which overwrites the local
config file with the external file.

For me deleting the .stamp_configured file in the uclibc-menuconfig entry of
the makefile seems not to be a good idea.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
