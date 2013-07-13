From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jul 2013 00:27:31 +0200
Subject: [Buildroot] [PATCHv2 08/25] pkg-infra: dump all ARM OABI references
	when setting ABI
In-Reply-To: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373754468-7527-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

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
-- 
1.8.1.2
