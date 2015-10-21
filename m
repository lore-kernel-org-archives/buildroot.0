From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Oct 2015 12:21:10 +0000 (UTC)
Subject: [Buildroot] [Bug 8421] New: util-linux installs systemd files in
 output/target/home/
Message-ID: <bug-8421-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8421

           Summary: util-linux installs systemd files in
                    output/target/home/
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Mac OS
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thijsvermeir at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When I use a user table and enable systemd, the home folder of the user
contains systemd files from the util-linux package and other directories.

~/buildroot/sheeva/output/target/home/tvermeir$ tree .
.
`-- buildroot
    |-- host
    |   `-- sheevaplug-glibc
    |       `-- usr
    |           `-- arm-buildroot-linux-gnueabi
    |               `-- sysroot
    |                   `-- lib
    |                       `-- systemd
    |                           `-- system
    |                               |-- fstrim.service
    |                               `-- fstrim.timer
    `-- sheeva

10 directories, 2 files

~/buildroot/sheeva$ find ./ -name "fstrim.service"
./output/target/home/tvermeir/buildroot/host/sheevaplug-glibc/usr/arm-buildroot-linux-gnueabi/sysroot/lib/systemd/system/fstrim.service
./output/build/util-linux-2.27/sys-utils/fstrim.service

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
