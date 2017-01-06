From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Jan 2017 09:54:53 +0000
Subject: [Buildroot] [Bug 9571] New: buildroot fails while building opencv
 for arm64 platform
Message-ID: <bug-9571-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9571

            Bug ID: 9571
           Summary: buildroot fails while building opencv for arm64
                    platform
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: saik.iitk at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

i am getting the following error while building opencv. During opencv_core
building, it is linking the following 


sw/tools/linaro/gcc-aarch64-linux-gnu-4.9-2014.09/bin/../lib/gcc/aarch64-linux-gnu/4.9.2/../../../../aarch64-linux-gnu/bin/ld:
/local_disk/sai/wpu_aug23/wpu-sw/src/common/utils/buildroot/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib/aarch64-linux-gnu/libm.a(k_standard.o)(.text+0x318):
unresolvable R_AARCH64_ADR_PREL_PG_HI21 relocation against symbol
`stderr@@GLIBC_2.17'


and sinc libm.a is not built with option "-fPIC", The error can come and libm.a
is default generated part of buildroot and i cannot build here. 


Please have a look

-- 
You are receiving this mail because:
You are on the CC list for the bug.
