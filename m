From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 25 Jan 2009 05:58:41 +0000 (UTC)
Subject: [Buildroot] [Bug 71] New: ./wchar.h:41:12: error: empty filename in
	#include
Message-ID: <bug-71-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=71

              Host: Gentoo AMD64
            Target: ARM
           Summary: ./wchar.h:41:12: error: empty filename in #include
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paul.jones at iwtech.com.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


# Work around problem of missing syslimits.h
if [ ! -f
/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/root/usr/lib/gcc/arm-linux-uclibc/4.3.2/include-fixed/syslimits.h
]; then \
                echo "warning: working around missing syslimits.h"; \
                cp -f
/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/4.3.2/include-fixed/syslimits.h
\
                       
/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/root/usr/lib/gcc/arm-linux-uclibc/4.3.2/include-fixed/;
\
        fi
# Make sure we have 'cc'.
if [ ! -e
/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/root/usr/bin/cc
]; then \
                ln -snf gcc
/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/root/usr/bin/cc;
\
        fi
# These are in /lib, so...
#rm -rf
/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/root/usr/lib/libgcc_s*.so*
touch -c
/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/root/usr/bin/gcc
/usr/bin/make -j1 -C
/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/coreutils-6.9
make[1]: Entering directory
`/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/coreutils-6.9'
Making all in lib
make[2]: Entering directory
`/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/coreutils-6.9/lib'
/usr/bin/make  all-am
make[3]: Entering directory
`/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/coreutils-6.9/lib'
/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-Os 
-I/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/usr/include
-I/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/include
--sysroot=/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/
-isysroot /home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir
-mtune=arm920t  -I.      -g -O2 -c allocsa.c
In file included from ./stdint.h:87,
                 from
///home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/usr/include/stdlib.h:860,
                 from ./stdlib.h:44,
                 from allocsa.h:24,
                 from allocsa.c:22:
./wchar.h:41:12: error: empty filename in #include
make[3]: *** [allocsa.o] Error 1
make[3]: Leaving directory
`/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/coreutils-6.9/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/coreutils-6.9/lib'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/coreutils-6.9'
make: ***
[/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/coreutils-6.9/src/vdir]
Error 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
