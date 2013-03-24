From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:28 +0100
Subject: [Buildroot] [PATCH 04/22] gcc: fix location of snapshots
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gcc snapshots are now located at
ftp://gcc.gnu.org/pub/gcc/snapshots/. This has been tested with a
recent 4.8.0-RC snapshot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index bdc38cd..3bfa13b 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -26,7 +26,7 @@ GCC_SNAP_DATE:=
 endif
 
 ifneq ($(GCC_SNAP_DATE),)
- GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_VERSION)
+ GCC_SITE:=ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
  GCC_SITE:=ftp://www.at91.com/pub/buildroot/
 else
-- 
1.7.9.5
