From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Apr 2013 10:28:44 +0000 (UTC)
Subject: [Buildroot] [Bug 6218] New: binutils-2.23.2/gas fails with
 undefined reference to `mbstowcs'
Message-ID: <bug-6218-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6218

           Summary: binutils-2.23.2/gas fails with undefined reference to
                    `mbstowcs'
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: a.nielsen at shikadi.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I am building for arm7tdmi using the git version of buildroot, with
binutils-2.23.2, but it fails:

libtool: link: [...] -o as-new [...]
read.o: In function `read_symbol_name':
read.c:(.text+0x3634): undefined reference to `mbstowcs'
collect2: error: ld returned 1 exit status
make[5]: *** [as-new] Error 1
make[5]: Leaving directory `buildroot/build/binutils-2.23.2/gas'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory `buildroot/build/binutils-2.23.2/gas'
make[3]: *** [all] Error 2
make[3]: Leaving directory `buildroot/build/binutils-2.23.2/gas'
make[2]: *** [all-gas] Error 2
make[2]: Leaving directory `buildroot/build/binutils-2.23.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory `buildroot/build/binutils-2.23.2'

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
