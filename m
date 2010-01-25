From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Jan 2010 21:43:27 +0000 (UTC)
Subject: [Buildroot] [Bug 955] New: Grub fails to build with External
	Toolchain
Message-ID: <bug-955-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=955

            Target: i686-nptl-linux-gnu
             Build: x86_64
           Summary: Grub fails to build with External Toolchain
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: patch
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: clark.rawlins at escient.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=979)
 --> (https://bugs.busybox.net/attachment.cgi?id=979)
Fix external toolchain build error for grub and migrate grub to the autotools
macro

When building grub with an external toolchain I get the following failure.

make[1]: Entering directory
`/home/clark/src/br-upstream/output/build/grub-0.97/grub'
/opt/x-tools/i686-nptl-linux-gnu/bin/i686-nptl-linux-gnu-gcc  -static   -o grub
 main.o asmstub.o ../stage2/libgrub.a  ../lib/libcommon.a -lncurses 
/opt/x-tools/i686-nptl-linux-gnu/lib/gcc/i686-nptl-linux-gnu/4.3.2/../../../../i686-nptl-linux-gnu/bin/ld:
cannot find -lncurses
collect2: ld returned 1 exit status
make[1]: *** [grub] Error 1
make[1]: Leaving directory
`/home/clark/src/br-upstream/output/build/grub-0.97/grub'
make: *** [/home/clark/src/br-upstream/output/build/grub-0.97/grub/grub] Error
2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
