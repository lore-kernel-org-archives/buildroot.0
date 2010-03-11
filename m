From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Mar 2010 05:47:27 +0000 (UTC)
Subject: [Buildroot] [Bug 1261] New: The getline() in
 output/build/linux-2.6.28/scripts/unifdef.c in buildroot is buggy
Message-ID: <bug-1261-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1261

           Summary: The getline() in output/build/linux-
                    2.6.28/scripts/unifdef.c in buildroot is buggy
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Keywords: link-failure
          Severity: enhancement
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: vikki.km at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

Yesterday i was trying to buildroot for my ARM920t and i think this is the bug.

Target: ARM920t
OS: Fedora 12 ( 2.6.31 using)
Kernel Headers: 2.6.32
Kernel used: 2.6.28

output/build/linux-2.6.28/scripts/unifdef.c

the getline() function in unidef.c contradicts with the already present getline
function in stdio.h and gives this error

error:
/usr/include/stdio.h:653: note: previous declaration of ?getline? was here

How i fixed the error?

i changed the getline function in unidef.c to get_line ie. other than getline
and it works fine.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
