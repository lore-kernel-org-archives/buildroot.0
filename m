From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Sep 2019 18:19:03 +0000
Subject: [Buildroot] [Bug 12241] New: Permission denied while running "make"
Message-ID: <bug-12241-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12241

            Bug ID: 12241
           Summary: Permission denied while running "make"
           Product: buildroot
           Version: 2019.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ceremcem at ceremcem.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm getting the following error when I run "make": 


 INSTALL include/linux/iio (2 files)
  INSTALL include/linux/isdn (1 file)
  INSTALL include/linux/mmc (1 file)
  INSTALL include/linux/netfilter (88 files)
  INSTALL include/linux/netfilter_arp (2 files)
  INSTALL include/linux/netfilter_bridge (17 files)
  INSTALL include/linux/netfilter_ipv4 (9 files)
  INSTALL include/linux/netfilter/ipset (4 files)
  INSTALL include/linux/netfilter_ipv6 (13 files)
  INSTALL include/linux/nfsd (5 files)
  INSTALL include/linux/raid (2 files)
  INSTALL include/linux/sched (1 file)
  INSTALL include/linux/spi (1 file)
  INSTALL include/linux/sunrpc (1 file)
  INSTALL include/linux/tc_act (15 files)
  INSTALL include/linux/tc_ematch (5 files)
  INSTALL include/linux/usb (13 files)
  INSTALL include/linux/wimax (1 file)
  INSTALL include/asm (38 files)
make[1]: Leaving directory
'/home/ceremcem/sync/curr-projects/scada-gateway/os/disk-images/rpi-buildroot/output/build/linux-headers-4.19.38'
if ! support/scripts/check-kernel-headers.sh 
/home/ceremcem/sync/curr-projects/scada-gateway/os/disk-images/rpi-buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot
 4.19; then exit 1; fi
support/scripts/check-kernel-headers.sh: 38:
support/scripts/check-kernel-headers.sh: /tmp/check-headers.rQZuHv: Permission
denied
make: *** [package/pkg-generic.mk:283:
/home/ceremcem/sync/curr-projects/scada-gateway/os/disk-images/rpi-buildroot/output/build/linux-headers-4.19.38/.stamp_staging_installed]
Error 1

-----------------


I'm using a git clone: cd8ab1853d (HEAD -> latest-release, tag: 2019.08-rc3)
Update for 2019.08-rc3

Host is: Linux cca-erik 4.19.0-1-amd64 #1 SMP Debian 4.19.12-1 (2018-12-22)
x86_64 GNU/Linux

-- 
You are receiving this mail because:
You are on the CC list for the bug.
