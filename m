From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Aug 2010 17:00:46 +0000 (UTC)
Subject: [Buildroot] [Bug 2395] New: libglib2-2.24.1 and libxml2-2.7.7 on
 MIPS because is missing -ldl
Message-ID: <bug-2395-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2395

           Summary: libglib2-2.24.1 and libxml2-2.7.7 on MIPS because is
                    missing -ldl
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sergio at sergiomb.no-ip.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


with buildroot git version from today . 
same config of bug #635 (https://bugs.busybox.net/attachment.cgi?id=2269)

I have to make cd buildroot/output/build/libglib2-2.24.1/
vi gio/Makefile 
and add -ldl to LIBS 
LIBS = -lintl -ldl

same for gio/tests/Makefile 

for libxml2-2.7.7 happens the same. 
cd buildroot/output/build/libxml2-2.7.7/
I had to add -ldl to LIBS on
Makefile
doc/examples/Makefile
example/Makefile

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
