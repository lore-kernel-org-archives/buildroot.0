From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jul 2013 22:17:26 +0200
Subject: [Buildroot] [git commit] pkg-infra: dump all ARM OABI references
	when setting ABI
Message-ID: <20130714204246.A32109A49D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6a9829ebec9b32463e68c9f18cea60d04a5451e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 405b3e4..06db122 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -30,11 +30,10 @@ LIBC=gnu
 endif
 
 # The ABI suffix is a bit special on ARM, as it needs to be
-# -uclibcgnueabi for uClibc EABI, -uclibc for uClibc OABI, -gnueabi
-# for glibc EABI and -gnu for glibc OABI. This means that the LIBC and
-# ABI aren't strictly orthogonal, which explains why we need the test
-# on LIBC below.
-ifeq ($(BR2_ARM_EABI),y)
+# -uclibcgnueabi for uClibc EABI, and -gnueabi for glibc EABI.
+# This means that the LIBC and ABI aren't strictly orthogonal,
+# which explains why we need the test on LIBC below.
+ifeq ($(BR2_arm)$(BR2_armeb),y)
 ifeq ($(LIBC),uclibc)
 ABI=gnueabi
 else
