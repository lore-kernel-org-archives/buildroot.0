From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Jul 2014 15:55:24 +0000 (UTC)
Subject: [Buildroot] [Bug 7262] New: Generating locale en_US.UTF-8 fails on
 64bit fedora linux host
Message-ID: <bug-7262-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7262

           Summary: Generating locale en_US.UTF-8 fails on 64bit fedora
                    linux host
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: normen.bolling at teufel.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi there,

on my fedora20 64bit linux PC the build process stopped with the following
error:

  Generating locale en_US.UTF-8
  cannot create temporary file: No such file or directory
  make: *** [target-generatelocales] Error 1

=> Corresponding Makefile target: "target-generatelocales"

Manually creation of a symbolic link "lib64" in the directory
"buildroot/output/target/usr" solved the problem:

ls -oga ~/git/buildroot/output/target/usr

total 44
drwxr-xr-x.  7  4096 Jul  2 17:30 .
drwxr-xr-x. 20  4096 Jul  2 17:30 ..
drwxr-xr-x.  2  4096 Jul  2 17:30 bin
drwxr-xr-x. 10 20480 Jul  2 17:30 lib
lrwxrwxrwx.  1     3 Jul  2 15:53 lib32 -> lib
lrwxrwxrwx.  1     3 Jul  2 17:24 lib64 -> lib
drwxr-xr-x.  3  4096 Jul  2 17:30 libexec
drwxr-xr-x.  2  4096 Jul  2 17:30 sbin
drwxr-xr-x. 15  4096 Jul  2 17:30 share

Cheers,
Normen Bolling

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
