From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Aug 2009 16:29:52 +0000 (UTC)
Subject: [Buildroot] [Bug 537] New: gzip complains about existing function
 futimens from glibc
Message-ID: <bug-537-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=537

              Host: Ubuntu 9.0.4 Server 32 Bit
            Target: i686
             Build: i686
           Summary: gzip complains about existing function futimens from
                    glibc
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d.albano at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

gzip complains, while compiling, about an existing function called futimens

Here is the output:
/home/daniele/Development/OPBXA/buildroot-git/build_i686/staging_dir//usr/include/sys/stat.h:370:
error: conflicting types for 'futimens'
utimens.h:2: error: previous declaration of 'futimens' was here
mv -f .deps/open-safer.Tpo .deps/open-safer.Po
utimens.c: In function 'utimens':
utimens.c:188: warning: passing argument 2 of 'futimens' from incompatible
pointer type
utimens.c:188: error: too many arguments to function 'futimens'
make[3]: *** [utimens.o] Error 1

On ubuntu launchpad i've discovered that newer glibc contains this function so
it doesn't compile with newer glibc, here is the link to ubuntu launchpad.

https://bugs.launchpad.net/ubuntu/+source/gzip/+bug/127206


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
