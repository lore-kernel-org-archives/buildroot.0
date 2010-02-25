From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2010 10:27:44 +0100
Subject: [Buildroot] [git commit master] gcc on target: add missing
	definitions for gcc 4.4
Message-ID: <20100225092812.0CA047775F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a35d48f984fa7e499292baec85eba6c9fd5bf28c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depending on the gcc version, the gcc include and lib directories have
changed. We include support for gcc 4.4 by copy/pasting the support
for gcc 4.3. Locations don't seem to have changed between 4.3 and
4.4. This allows the syslimits.h fixup to succeed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 6f65cb3..dcca431 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -459,6 +459,10 @@ ifeq ($(findstring x4.3,x$(GCC_VERSION)),x4.3)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 GCC_INCLUDE_DIR:=include-fixed
 endif
+ifeq ($(findstring x4.4,x$(GCC_VERSION)),x4.4)
+GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
+GCC_INCLUDE_DIR:=include-fixed
+endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
 	PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) \
-- 
1.6.3.3
