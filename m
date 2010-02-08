From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Feb 2010 17:03:03 +0100
Subject: [Buildroot] [git commit master] toolchain/gdb: get rid of legacy &
	unused variables
Message-ID: <20100208160731.5D4667775B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7dd0591183e4f92b760ec87d8139ec596d78ac27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_VENDOR_SUFFIX and VENDOR_SUFFIX variables are no longer settable.
The only user is gdb, and is totally useless in this case.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile             |    1 -
 toolchain/gdb/gdb.mk |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5f71148..54a5b7b 100644
--- a/Makefile
+++ b/Makefile
@@ -262,7 +262,6 @@ TARGET_DIR:=$(BASE_DIR)/target
 
 # define values for prepatched source trees for toolchains
 VENDOR_SITE:=$(call qstrip,$(BR2_VENDOR_SITE))
-VENDOR_SUFFIX:=$(call qstrip,$(BR2_VENDOR_SUFFIX))
 VENDOR_BINUTILS_RELEASE:=$(call qstrip,$(BR2_VENDOR_BINUTILS_RELEASE))
 VENDOR_GCC_RELEASE:=$(call qstrip,$(BR2_VENDOR_GCC_RELEASE))
 VENDOR_UCLIBC_RELEASE:=$(call qstrip,$(BR2_VENDOR_UCLIBC_RELEASE))
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index bdefd09..02da152 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -5,7 +5,7 @@
 ######################################################################
 GDB_VERSION:=$(call qstrip,$(BR2_GDB_VERSION))
 
-GDB_OFFICIAL_VERSION:=$(GDB_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GDB_RELEASE)
+GDB_OFFICIAL_VERSION:=$(GDB_VERSION)$(VENDOR_GDB_RELEASE)
 
 GDB_SOURCE:=gdb-$(GDB_OFFICIAL_VERSION).tar.bz2
 GDB_CAT:=$(BZCAT)
-- 
1.6.3.3
