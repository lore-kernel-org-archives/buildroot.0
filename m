From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Jun 2009 13:03:46 +0000 (UTC)
Subject: [Buildroot] [Bug 421] New: toolchain: Clean up toolchain locale
	support menu.
Message-ID: <bug-421-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=421

           Summary: toolchain: Clean up toolchain locale support menu.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=423)
 --> (https://bugs.busybox.net/attachment.cgi?id=423)
Clean up toolchain locale support menu.

This patch cleans up and fixes some minor issues with the locale support
section of the toolchain menu.

1. uClibc requires wchar support if locales are enabled, make locale support
select wchar support.
2. Allow purging of locale information even if there is no locale support in
the C library. This cleans up after packages that install things into
/usr/share/locale on the target.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
