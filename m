From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 13 Mar 2010 14:04:51 +0000 (UTC)
Subject: [Buildroot] [Bug 1279] New: Buildroot compiled Busybox and
	Coreutils LFS issues
Message-ID: <bug-1279-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1279

           Summary: Buildroot compiled Busybox and Coreutils LFS issues
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: richard-bugs at nod.at
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1225)
 --> (https://bugs.busybox.net/attachment.cgi?id=1225)
Buildroot configuration

I set up a very basic root filesystem with large file support (BR2_LARGEFILE=y)
using Buildroot.
But ls from both Busybox and Coreutils fails on large directories.
In my case /mnt, which is a 1.4TB cifs share. On a smaller(~100GB) one it works
fine.

Strace shows that ls fires fstat() instead of fstat64().
So I wore a small testtool, which uses the fstat() library call.
It worked perfectly. According to strace my tool uses fstat64().

It seems that Buildroot messes something up while building Busybox and
Coreutils with large file support.

Config files, strace logs and my testtool are attached.

I reproduced this issue with Buildroot 2010.02 and snapshot from yesterday.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
