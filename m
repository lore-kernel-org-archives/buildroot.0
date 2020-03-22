From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun, 22 Mar 2020 14:12:59 -0300
Subject: [Buildroot] [PATCH v6 0/2] package/busybox: fix build with glibc
 2.31 and musl-1.2.0
Message-ID: <20200322171301.15753-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Current release of busybox 1_31_1 is failing to build with glibc-2.31
due to removal of stime() from glibc. It also fails to build with musl
1.2.0 due to the direct use of __NR_clock_gettime.

Add five patches applied upstream to fix these problems.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN. <yann.morin.1998@free.fr>

Carlos Santos (2):
  package/busybox: fix build with musl 1.2.0
  package/busybox: fix build with glibc 2.31

 ...-Use-64-prefix-syscall-if-we-have-to.patch |  61 ++++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  50 +++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  50 +++++++
 ...rappers-around-clock_gettime-closes-.patch | 134 ++++++++++++++++++
 .../0007-Remove-stime-function-calls.patch    |  97 +++++++++++++
 5 files changed, 392 insertions(+)
 create mode 100644 package/busybox/0003-date-Use-64-prefix-syscall-if-we-have-to.patch
 create mode 100644 package/busybox/0004-time-Use-64-prefix-syscall-if-we-have-to.patch
 create mode 100644 package/busybox/0005-runsv-Use-64-prefix-syscall-if-we-have-to.patch
 create mode 100644 package/busybox/0006-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
 create mode 100644 package/busybox/0007-Remove-stime-function-calls.patch

-- 
2.18.2
