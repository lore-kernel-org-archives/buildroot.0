From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  5 Sep 2012 08:44:33 +0000 (UTC)
Subject: [Buildroot] [Bug 5510] New: Buildroot fails "host-mtd 1.4.4"
Message-ID: <bug-5510-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5510

           Summary: Buildroot fails "host-mtd 1.4.4"
           Product: buildroot
           Version: 2011.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: steph.pienaar at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I'm running Buildroot for at91sam9x5ek on Fedora 17 x86_64.
Buildroot fails to complete "host-mtd 1.4.4"
I don't know what to do. Please help.



List from make:

make[2]: Entering directory
`/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils'
mkdir -p /home/steph/Buildroot/buildroot-2011.05/output/host//usr/sbin
install -m 0755
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubiupdatevol
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubimkvol
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubirmvol
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubicrc32
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubinfo
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubiattach
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubidetach
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubinize
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubiformat
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubirename
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/mtdinfo
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils/ubirsvol
/home/steph/Buildroot/buildroot-2011.05/output/host//usr/sbin/
make[2]: Leaving directory
`/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/ubi-utils'
d=mkfs.ubifs_install; \
t=`echo $d | sed s:.*_::` d=`echo $d | sed s:_.*::`; \
/usr/bin/make
BUILDDIR=/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/$d
-C $d $t
make[2]: Entering directory
`/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs'
gcc -O2 -g -Wall -Wextra -Wwrite-strings -Wno-sign-compare -ffunction-sections
-fdata-sections -Wl,--gc-sections   -g -o
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/mkfs.ubifs
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/mkfs.ubifs.o
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/crc16.o
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/lpt.o
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/compr.o
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/devtable.o
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/hashtable/hashtable.o
/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/hashtable/hashtable_itr.o
 -lz -llzo2 -lm -luuid
-L/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/../ubi-utils/
-lubi
-L/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/../lib
-lmtd -lcrc32  
/usr/bin/ld: cannot find -llzo2
collect2: error: ld returned 1 exit status
make[2]: ***
[/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs/mkfs.ubifs]
Error 1
make[2]: Leaving directory
`/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/mkfs.ubifs'
make[1]: *** [subdirs_mkfs.ubifs_install] Error 2
make[1]: Leaving directory
`/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4'
make: ***
[/home/steph/Buildroot/buildroot-2011.05/output/build/host-mtd-1.4.4/.stamp_host_installed]
Error 2
[steph at Steph-Fedora buildroot-2011.05]$

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
