From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Aug 2010 18:55:19 +0000 (UTC)
Subject: [Buildroot] [Bug 2401] New: sysvinit-2.86 fails to build on MIPS
 because is missing -lcrypt
Message-ID: <bug-2401-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2401

           Summary: sysvinit-2.86 fails to build on MIPS because is
                    missing -lcrypt
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

buildroot/output/staging/usr/bin/mipsel-unknown-linux-uclibc-gcc
--sysroot=buildroot/output/staging  -o bootlogd bootlogd.o -lutil
sulogin.o: In function `main':
sulogin.c:(.text+0xf94): undefined reference to `crypt'
collect2: ld returned 1 exit status
make[1]: *** [sulogin] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `buildroot/output/build/sysvinit-2.86/src'
make: *** [buildroot/output/build/sysvinit-2.86/src/init] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
