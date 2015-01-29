From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Jan 2015 00:04:18 +0000 (UTC)
Subject: [Buildroot] [Bug 7844] New: Lua with hard-float on MIPS by
 buildroot doesn't work
Message-ID: <bug-7844-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7844

           Summary: Lua with hard-float on MIPS by buildroot doesn't work
           Product: buildroot
           Version: 2014.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: brotherjinho at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I found something strange.

I wrote simple script that print the variable in Lua. It worked on x86 on
linux. I tried to run it on my target device that is MIPS little endian. I
prepared the lua by buildroot. I used 'hard-float' option for performance
issue. But this simple script doesn't work. I used Sourcery CodeBench.

I tested it with 'soft-float' option. Then lua worked correctly. Have you the
experience like that?

The lua code is like below.

=================
local var = 131523;
print(var);
=================

It must print 131523. But my target printed 0 . What's wrong?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
