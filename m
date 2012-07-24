From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Jul 2012 11:11:06 +0000 (UTC)
Subject: [Buildroot] [Bug 5396] New: Boot hangs when starting samba if
 BR2_ENABLE_LOCALE is enabled
Message-ID: <bug-5396-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5396

           Summary: Boot hangs when starting samba if BR2_ENABLE_LOCALE is
                    enabled
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: net147 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Booting hangs when starting samba if BR2_ENABLE_LOCALE is enabled.
Disabling the samba startup script and running smbd -FS shows the following
endless scrolling messages:

init_iconv: Attempting to replace with conversion from UTF-16LE to ASCII 
init_iconv: Conversion from UTF-8 to CP850 not supported 
init_iconv: Attempting to replace with conversion from ASCII to ASCII 
init_iconv: Conversion from ASCII to CP850 not supported 
init_iconv: Attempting to replace with conversion from ASCII to ASCII 
init_iconv: Conversion from CP850 to UTF-16LE not supported 
init_iconv: Attempting to replace with conversion from ASCII to UTF-16LE 
init_iconv: Conversion from CP850 to UTF-8 not supported 
init_iconv: Attempting to replace with conversion from ASCII to ASCII 
init_iconv: Conversion from CP850 to ASCII not supported 
init_iconv: Attempting to replace with conversion from ASCII to ASCII 
init_iconv: Conversion from CP850 to UTF8 not supported 
init_iconv: Attempting to replace with conversion from ASCII to ASCII 
init_iconv: Conversion from CP850 to UTF-16BE not supported 
init_iconv: Attempting to replace with conversion from ASCII to UTF-16BE 

The samba configure script enables native iconv support by default when cross
compiling. To resolve this, we pass --with-libiconv= to configure when the
libiconv package is not enabled to disable iconv support.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
