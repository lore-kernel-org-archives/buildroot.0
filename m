From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Sep 2010 10:19:38 +0000 (UTC)
Subject: [Buildroot] [Bug 2623] New: buildroot-snapshot-20100922 fails when
 compiling development packages to target
Message-ID: <bug-2623-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2623

           Summary: buildroot-snapshot-20100922 fails when compiling
                    development packages to target
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tselmeci at open-st.eu
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2527
  --> https://bugs.busybox.net/attachment.cgi?id=2527
buildroot-20100922 config file

I'm using the latest snapshot of buildroot (buildroot-20100922) on Arch Linux.
Target is an ARM (Xscale) machine, what I need is only the toolchain. Toolchain
is generated without any problem.

I'd need a native toolchain on the ARM machine, which runs on ARM and creates
output for the ARM machine. Buildroot seems to support this. These are switched
on under "Package Selection for the Target --> Development tools":
-  native toolchain in the target filesystem;
- gmp;
- gmp headers;
- make;
- mpfr;
- mpfr headers;
- libtool;

See the attached file for the exact buildroot configuration I've been using.

Buildroot stops compiling native toolchain with the following error:

-------------------------------------------------------------
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether gcc __attribute__ ((mode (XX))) works... yes
checking for recent GMP... yes
checking for gmp internal files... no
checking for working alloca.h... yes
checking for alloca... yes
checking for __gmpz_init in -lgmp... no
configure: error: libgmp not found or uses a different ABI.
Please read the INSTALL file -- see "In case of problem".
make[1]: ***
[/home/tselmeci/repos/uah/uah.169/trunk/packages/buildroot/buildroot-20100922-tools/output/build/mpfr-2.4.1/.configured]
Error 1
make[1]: Leaving directory
`/home/tselmeci/repos/uah/uah.169/trunk/packages/buildroot/buildroot-20100922-tools'
make: *** [.DEFAULT] Error 2
-------------------------------------------------------------

I made several attempts with buildroot-2010.08, buildroot-2010.05 and with this
daily snapshot, but regardless of gcc selection, EABI/OABI, it always failed.

Please have a look at the problem, thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
