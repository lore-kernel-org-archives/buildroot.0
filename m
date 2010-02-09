From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Feb 2010 11:48:17 +0100
Subject: [Buildroot] [git commit master] toolchain/gdb: remove external
	source toolchain leftover
Message-ID: <20100209105147.182BE77735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7a72f7b0d9c0288f60a14e08f312a650fe27f7b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 65e99014 (Remove external source toolchain options) removed
external source-based toolchain support, but there was still a check
for it in gdb.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/gdb.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 6288959..5e91d98 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -8,10 +8,7 @@ GDB_VERSION:=$(call qstrip,$(BR2_GDB_VERSION))
 GDB_SOURCE:=gdb-$(GDB_VERSION).tar.bz2
 GDB_CAT:=$(BZCAT)
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
- GDB_SITE:=$(VENDOR_SITE)
- GDB_PATCH_DIR:=toolchain/gdb/ext_source/$(VENDOR_PATCH_DIR)/$(GDB_VERSION)
-else ifeq ($(findstring avr32,$(GDB_VERSION)),avr32)
+ifeq ($(findstring avr32,$(GDB_VERSION)),avr32)
  GDB_SITE:=ftp://www.at91.com/pub/buildroot/
  GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
 else
-- 
1.6.3.3
