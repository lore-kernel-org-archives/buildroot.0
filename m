From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 May 2010 23:27:58 +0200
Subject: [Buildroot] [git commit master] Fix the computation of
	REAL_GNU_TARGET_NAME
Message-ID: <20100506212939.C7E3D8B86C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5e1fbd2c33452bd7480583ccc5cfc50546ac010d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the selected C library is glibc, the C library shouldn't be
mentionned in REAL_GNU_TARGET_NAME. In other words:

 arm-unknown-linux-uclibcgnueabi must be used for uClibc
 arm-unknown-linux-gnueabi must be used for glibc

This fixes the build of GDB on the target, as reported by Quotient
Remainder <quotientvremainder@gmail.com>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index eab9168..cd492f1 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -104,7 +104,7 @@ LIBC=uclibc
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 LIBC=uclibc
 else
-LIBC=glibc
+LIBC=
 endif
 
 ifeq ($(BR2_ARM_EABI),y)
-- 
1.6.3.3
