From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Mar 2009 10:22:37 +0000 (UTC)
Subject: [Buildroot] [Bug 175] New: empty filename include in wchar.h
Message-ID: <bug-175-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=175

              Host: i386
            Target: i386
           Summary: empty filename include in wchar.h
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: stef at bononline.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=133)
 --> (https://bugs.busybox.net/attachment.cgi?id=133)
Config file for this build.

When compiling buildroot 2009.02 it I get an error when compiling coreutils:

make[3]: Entering directory
`/mnt/sd/sda/3/buildroot-2009.02/build_i386/coreutils-6.9/lib'
/mnt/sd/sda/3/buildroot-2009.02/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
-Os -pipe -Os 
-I/mnt/sd/sda/3/buildroot-2009.02/build_i386/staging_dir/usr/include
-I/mnt/sd/sda/3/buildroot-2009.02/build_i386/staging_dir/include
--sysroot=/mnt/sd/sda/3/buildroot-2009.02/build_i386/staging_dir/ -isysroot
/mnt/sd/sda/3/buildroot-2009.02/build_i386/staging_dir -mtune=i386 -march=i386 
-I.      -g -O2 -c allocsa.c
In file included from ./stdint.h:87,
                 from
///mnt/sd/sda/3/buildroot-2009.02/build_i386/staging_dir/usr/include/stdlib.h:860,
                 from ./stdlib.h:44,
                 from allocsa.h:24,
                 from allocsa.c:22:
./wchar.h:41:12: error: empty filename in #include

I checked this wchar.h, an indeed there is an include which is empty:

/* Include the original <wchar.h>.  */
#include ""

I've been trying to build a system with "generic development system", not
changing more.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
