From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Sep 2016 14:41:00 +0000
Subject: [Buildroot] [Bug 9301] New: U-boot fails to build with default
 zynq_zed_defconfig configuration
Message-ID: <bug-9301-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9301

            Bug ID: 9301
           Summary: U-boot fails to build with default zynq_zed_defconfig
                    configuration
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: matt.kraai at abbott.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When I run `make zynq_zed_defconfig && make all` on master, the build
eventually fails with the following messages:

> cp -dpf .../buildroot/output/build/uboot-xilinx-v2016.2/spl/boot.bin .../buildroot/output/images/
> cp: cannot stat '.../buildroot/output/build/uboot-xilinx-v2016.2/spl/boot.bin': No such file or directory

Commit fad58cefa4a392b52eafe46a773f8cbfb8aadb43 introduced this error.  Before
that commit, no make targets were specified when make was invoked to build
uboot.  This caused make to build the all target, which caused it to build
spl/boot.bin.  After that commit, the u-boot.img target was specified.  As a
result of this change, make only built u-boot.img and not spl/boot.bin.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
