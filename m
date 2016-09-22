From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Sep 2016 06:56:14 +0000
Subject: [Buildroot] [Bug 9291] New: perl: SysV message queues not
 configured, even if available
Message-ID: <bug-9291-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9291

            Bug ID: 9291
           Summary: perl: SysV message queues not configured, even if
                    available
           Product: buildroot
           Version: 2016.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mail2k at web.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Buildroot 2016.02 with perl-5.22.1 compiled for i686-linux:
Problem on the target: 
  perl -e "msgget(90001, 1);"
  msgget not implemented at -e line 1.

This is a configuration error. SysV-IPC is available on the target.
./configure in the perl directory gives the following:
...
Checking for msgctl ... found
Checking for msgget ... found
Checking for msgrcv ... found
Checking for msgsnd ... found
Checking for msync ... found
Checking for munmap ... found
...

Nevertheless, HAS_MSG is not defined in config.h and the message queues are not
compiled in.
If I manually define HAS_MSG in config.h and do "make", I get a perl executable
with msgget that works on my target. But that is not the way to solve this
problem.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
