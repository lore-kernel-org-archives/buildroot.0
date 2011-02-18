From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 07:35:11 +0000 (UTC)
Subject: [Buildroot] [Bug 3295] New: slang fails to build on mipsel
Message-ID: <bug-3295-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3295

           Summary: slang fails to build on mipsel
           Product: buildroot
           Version: 2010.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


/home/test/toolchains/br-mipsel-full/usr/bin/mipsel-linux-gcc
--sysroot=/home/test/outputs/test-379/host/usr/mipsel-unknown-linux-uclibc/sysroot
-o libslang.so -shared -Wl,-soname,libslang.so.1 sldisply.o slerr.o slgetkey.o
slmisc.o slsignal.o slsmg.o sltermin.o slutty.o slcurses.o slkeypad.o
slkeymap.o slstring.o slmemcmp.o
/home/test/toolchains/br-mipsel-full/usr/bin/../lib/gcc/mipsel-unknown-linux-uclibc/4.4.4/../../../../mipsel-unknown-linux-uclibc/bin/ld:
sldisply.o: relocation R_MIPS_HI16 against `a local symbol' can not be used
when making a shared object; recompile with -fPIC
sldisply.o: could not read symbols: Bad value
collect2: ld returned 1 exit status
make[1]: *** [libslang.so] Error 1
make[1]: Leaving directory `/home/test/outputs/test-379/build/slang-1.4.5'
make: *** [/home/test/outputs/test-379/build/slang-1.4.5/.stamp_built] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
