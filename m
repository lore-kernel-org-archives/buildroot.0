From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Feb 2009 11:26:06 +0000 (UTC)
Subject: [Buildroot] [Bug 109] New: Make pppd package avoid bsd err
Message-ID: <bug-109-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=109

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Make pppd package avoid bsd err
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=67)
 --> (https://bugs.busybox.net/attachment.cgi?id=67)
Nuke bsd err usage in pppd and PPPD_CAT in mk file

The pppd package uses bsd err (which is an option in uclibc) in just two lines
of code in the pppoe plugin.
The rest of the package uses syslog, so avoid bsd err since the plugin silently
fails to build and get installed if uclibc is built without bsd err support.
Also why does pppd.mk use PPPD_CAT instead of ZCAT? The patch nukes that
duplication too (maybe there's a reason but it seems unlikely).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
