From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Jan 2009 22:05:20 +0000 (UTC)
Subject: [Buildroot] [Bug 75] New: arm buildroot "unrecognized option" error
Message-ID: <bug-75-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=75

              Host: pc
            Target: arm
             Build: Jan 26, 2009 daily buildroot
           Summary: arm buildroot "unrecognized option" error
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: craigdry at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I am having the following problem:

    1. I downloaded the latest buildroot to my Fedora Core 10 PC as follows:
        svn co svn://uclibc.org/trunk/buildroot
     2. Configure it by:
        make menuconfig (I changed the target Architecture to "arm".  Then I
exited and save the configuration file.  No other changes.)
    3. do a build by entering:
        make > make.log

Unfortunately I get an "unrecognized option" error:

TARGET_CPU_DEFAULT="" \
 HEADERS="auto-host.h ansidecl.h" DEFINES="" \
 /bin/sh /home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/mkconfig.sh
bconfig.h
/usr/lib/ccache/gcc  -c   -g -O2 -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-Wmissing-format-attribute    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild
-I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc
-I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/build
-I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/../include
-I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/../libcpp/include
-I/home/cdry/buildroot/toolchain_build_arm/gmp/include
-I/home/cdry/buildroot/toolchain_build_arm/mpfr/include
-I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/../libdecnumber
-I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/../libdecnumber/dpd
-I../libdecnumber    -o build/genmodes.o
/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/genmodes.c
/home/cdry/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-as:
unrecognized option `-Qy'
make[2]: *** [build/genmodes.o] Error 1
make[2]: Leaving directory
`/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2-initial'
make: ***
[/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2-initial/.compiled] Error 2

For the purpose of comparison, I tried the following:
    1. got a fresh new buildroot from svn
    2. make menuconfig (this time, I leave the architecture selection at i386. 
I exit and save the config file.)
    3. make > make.log
    4. Runs to completion without error.

So I see the problem for the "arm" architecture, but not for the "i386"
architecture.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
