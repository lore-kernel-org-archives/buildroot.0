From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 May 2010 20:44:21 +0200
Subject: [Buildroot] [PATCH 1/1] Fix the computation of REAL_GNU_TARGET_NAME
In-Reply-To: <cover.1273170989.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273170989.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c4c8601ed1df3f29c6ea87a8882340cb6486d7da.1273170989.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the selected C library is glibc, the C library shouldn't be
mentionned in REAL_GNU_TARGET_NAME. In other words:

 arm-unknown-linux-uclibcgnueabi must be used for uClibc
 arm-unknown-linux-gnueabi must be used for glibc

This fixes the build of GDB on the target, as reported by Quotient
Remainder <quotientvremainder@gmail.com>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
