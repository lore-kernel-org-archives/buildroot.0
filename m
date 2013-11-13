From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 13 Nov 2013 17:13:13 +0100
Subject: [Buildroot] [PATCH v2 1/5] gdb: arc: Use git instead of website
In-Reply-To: <1384359197-22168-1-git-send-email-mjonker@synopsys.com>
References: <1384359197-22168-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1384359197-22168-2-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/gdb/Config.in.host |    2 +-
 package/gdb/gdb.mk         |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 128aed9..074aa57 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -58,6 +58,6 @@ config BR2_GDB_VERSION
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5
-	default "7.5.1-arc" if BR2_arc
+	default "f25a1952afd054205f9471e449c1f7ca5b271b7c" if BR2_arc
 
 endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9cf90e3..53e6048 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -22,14 +22,15 @@ endif
 endif
 
 ifeq ($(BR2_arc),y)
-GDB_SITE = $(BR2_ARC_SITE)
+GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gdb,$(GDB_VERSION))
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 endif
 
 ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
 GDB_SITE = ftp://www.at91.com/pub/buildroot/
 endif
 
-GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
+GDB_SOURCE ?= gdb-$(GDB_VERSION).tar.bz2
 GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
-- 
1.7.9.5
