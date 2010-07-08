From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 Jul 2010 13:45:23 +0000 (UTC)
Subject: [Buildroot] [Bug 2185] New: pixman can't apply
	pixman-0.10.0-no-tests.patch
Message-ID: <bug-2185-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2185

           Summary: pixman can't apply pixman-0.10.0-no-tests.patch
           Product: buildroot
           Version: 2010.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bourgeois at bertin.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2185
  --> https://bugs.busybox.net/attachment.cgi?id=2185
my config file

I've got this error when I made my config :

>>> pixman 0.17.6 Extracting
>>> pixman 0.17.6 Patching package/pixman

Applying pixman-0.10.0-no-tests.patch using plaintext: 
can't find file to patch at input line 3
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|--- a/Makefile.in.orig 2008-05-23 14:04:37.000000000 +0000
|+++ b/Makefile.in      2008-05-23 14:04:50.000000000 +0000
--------------------------
File to patch: 


It appears that Makefile.in doesn't exist in my output/build/pixman-0.17.6 .
This Makefile.in is produced after a ./autogen.sh then I set
PIXMAN_AUTORECONF=YES in the pixman.mk but this solution doesn't work neither.
AUTORECONF is execute as a POST_PATCH_HOOKS and the patch fails before reaching
the AUTORECONF hook.

What is the good solution ? Fix Makefile.autoconf.in to process AUTORECONF as a
POST_EXTRACT_HOOKS or run ./autogen.sh manually ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
