From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Oct 2010 14:18:42 +0000 (UTC)
Subject: [Buildroot] [Bug 2737] New: buildroot configuration tool crashing
 when the path exceeds 128 characters
Message-ID: <bug-2737-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2737

           Summary: buildroot configuration tool crashing when the path
                    exceeds 128 characters
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: honyakeprt at centrum.cz
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2629
  --> https://bugs.busybox.net/attachment.cgi?id=2629
quick fix

Install the buildroot to a directory, where the path length exceed 128
characters. Try to run "make oldconfig", the configuration tool is crashing
with message buffer overflow detected. The tool "make menuconfig" is probably
crashing as well.

The buggy file is located here:
..../package/config/confdata.c
Function:
int conf_write(const char *name) 
uses arrays of size 128B for path.


Am sending you quick fix, which is working for us.

Regars

JK

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
