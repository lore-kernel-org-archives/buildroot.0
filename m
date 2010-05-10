From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 May 2010 09:29:12 +0000 (UTC)
Subject: [Buildroot] [Bug 1741] New: external toolchain linking error
Message-ID: <bug-1741-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1741

           Summary: external toolchain linking error
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mensch0815 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When you use an external toolchain to compile packages you get an error like:
"cannot find /lib/libc.so.0"

Fix this by changing the paths in toolchain-folder/usr/lib/libc.so :

--- libc.so.old 2010-05-10 10:54:45.602118000 +0200
+++ libc.so 2010-05-10 11:05:57.337434000 +0200
@@ -3,4 +3,4 @@
* the static library, so try that secondarily. */
OUTPUT_FORMAT("elf32-avr32", "elf32-avr32", "elf32-avr32")
-GROUP ( /lib/libc.so.0 /usr/lib/uclibc_nonshared.a AS_NEEDED (
/lib/ld-uClibc.so.0 ) )
+GROUP ( ../lib/libc.so.0 ../usr/lib/uclibc_nonshared.a AS_NEEDED ( ../lib
ld-uClibc.so.0 ) )

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
