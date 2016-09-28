From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Sep 2016 15:44:51 +0000
Subject: [Buildroot] [Bug 9316] New: U-boot fails to build if libssl-dev is
	not installed
Message-ID: <bug-9316-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9316

            Bug ID: 9316
           Summary: U-boot fails to build if libssl-dev is not installed
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

When I run "make zynq_zed_defconfig && make" on my Ubuntu 16.04.1 LTS system,
the build fails with the following error messages:

> >>> uboot xilinx-v2016.2 Building
...
>   HOSTCC  tools/aisimage.o
> In file included from tools/aisimage.c:10:0:
> include/image.h:923:27: fatal error: openssl/evp.h: No such file or directory
> compilation terminated.
> scripts/Makefile.host:108: recipe for target 'tools/aisimage.o' failed
> make[3]: *** [tools/aisimage.o] Error 1
> Makefile:1211: recipe for target 'tools' failed
> make[2]: *** [tools] Error 2
> package/pkg-generic.mk:201: recipe for target '/home/kraai/src/buildroot/output> /build/uboot-xilinx-v2016.2/.stamp_built' failed
> make[1]: *** [/home/kraai/src/buildroot/output/build/uboot-xilinx-v2016.2> /.stamp_built] Error 2
> Makefile:41: recipe for target '_all' failed
> make: *** [_all] Error 2

Installing ssl-dev fixes this problem, but I think U-Boot should depend on
host-openssl in this case.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
