From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 07:33:44 +0000 (UTC)
Subject: [Buildroot] [Bug 3289] New: speech-tools fails to build
Message-ID: <bug-3289-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3289

           Summary: speech-tools fails to build
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


/home/test/outputs/test-378/external-toolchain/bin/arm-none-linux-gnueabi-g++
--sysroot=/home/test/outputs/test-378/host/usr/arm-unknown-linux-gnueabi/sysroot
-shared -o libestbase.so.1.2.96 \
                shared_space/*.o -L. -leststring $libs -L. -lesd
/home/test/outputs/test-378/external-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/../../../../arm-none-linux-gnueabi/bin/ld:
cannot find -lesd
collect2: ld returned 1 exit status
make[2]: *** [libestbase.so] Error 1
make[1]: *** [lib] Error 2
make[1]: *** Waiting for unfinished jobs....
/home/test/outputs/test-378/external-toolchain/bin/arm-none-linux-gnueabi-g++
--sysroot=/home/test/outputs/test-378/host/usr/arm-unknown-linux-gnueabi/sysroot
-c -O3 -fPIC -Wall -I../../include ngrammar_aux.cc
/home/test/outputs/test-378/external-toolchain/bin/arm-none-linux-gnueabi-g++
--sysroot=/home/test/outputs/test-378/host/usr/arm-unknown-linux-gnueabi/sysroot
-c -O3 -fPIC -Wall -I../../include ngrammar_utils.cc
/home/test/outputs/test-378/external-toolchain/bin/arm-none-linux-gnueabi-g++
--sysroot=/home/test/outputs/test-378/host/usr/arm-unknown-linux-gnueabi/sysroot
-c -O3 -fPIC -Wall -I../../include EST_lattice.cc
/home/test/outputs/test-378/external-toolchain/bin/arm-none-linux-gnueabi-g++
--sysroot=/home/test/outputs/test-378/host/usr/arm-unknown-linux-gnueabi/sysroot
-c -O3 -fPIC -Wall -I../../include EST_lattice_io.cc
/home/test/outputs/test-378/external-toolchain/bin/arm-none-linux-gnueabi-g++
--sysroot=/home/test/outputs/test-378/host/usr/arm-unknown-linux-gnueabi/sysroot
-c -O3 -fPIC -Wall -I../../include freqsmooth.cc
/home/test/outputs/test-378/external-toolchain/bin/arm-none-linux-gnueabi-g++
--sysroot=/home/test/outputs/test-378/host/usr/arm-unknown-linux-gnueabi/sysroot
-c -O3 -fPIC -Wall -I../../include EST_PST.cc
look at library estools lattice_t.o EST_Ngrammar.o ngrammar_io.o ngrammar_aux.o
ngrammar_utils.o EST_lattice.o EST_lattice_io.o freqsmooth.o EST_PST.o
look at library estbase
Update library estools lattice_t.o EST_Ngrammar.o ngrammar_io.o ngrammar_aux.o
ngrammar_utils.o EST_lattice.o EST_lattice_io.o freqsmooth.o EST_PST.o
look at library eststring
a - lattice_t.o
a - EST_Ngrammar.o
a - ngrammar_io.o
a - ngrammar_aux.o
a - ngrammar_utils.o
a - EST_lattice.o
a - EST_lattice_io.o
a - freqsmooth.o
a - EST_PST.o
make[1]: Leaving directory
`/home/test/outputs/test-378/build/speech-tools-1.2.96~beta'
make: ***
[/home/test/outputs/test-378/build/speech-tools-1.2.96~beta/.stamp_built] Error
2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
