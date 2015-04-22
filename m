From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Apr 2015 11:18:28 +0000 (UTC)
Subject: [Buildroot] [Bug 8036] New: alsa-lib headers problem that prevents
 to compile alsa dependent projects
Message-ID: <bug-8036-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8036

           Summary: alsa-lib headers problem that prevents to compile alsa
                    dependent projects
           Product: buildroot
           Version: 2015.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jrmcorreo-linux at yahoo.es
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 6006
  --> https://bugs.busybox.net/attachment.cgi?id=6006
alsa-utils compilation errors

Hello,

I've built with success a kernel 3.15.4 and busybox for ARM 920t (S3C24XX),
that worked fine for my Micro2440 SDK board, and now I'm trying to build
openjdk-jdk9-b36 into the 2015.02 buildroot version using the patches provided
by Xerxes Ranby at his Rpi buildroot's version:
https://github.com/xranby/rpi-buildroot

I've found that there are several unknown types, related to alsa-lib
dependencies, that appear in different source files from openjdk. But they are
present on header files that aren't copied to the sysroot in the output of
buildroot.

In order to determine if the problem is related only to openjdk compilation,
I've tried to compile alsa-utils getting as a result the same kind of errors.
Then I searched for alsa-lib previous bugs, without finding any related to this
kind of error, before opening this one.

I attach the errors obtained during compilation of alsa-utils. Some words are
in spanish, but I think is so clear for anybody to understand the error
reasons.

I expect that fixing this problem with alsa headers it will be possible to
compile alsa-lib dependent code without errors due to this library dependency.


Thank You and Best Regards

Juan

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
