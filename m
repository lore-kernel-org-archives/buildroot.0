From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Dec 2013 18:20:55 +0100
Subject: [Buildroot] [PATCH 12/16] gdb: add microblaze internal toolchain
In-Reply-To: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386264059-14057-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <spenser@gillilanding.com>

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host | 2 ++
 package/gdb/gdb.mk         | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 074aa57..de0e0be 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -16,6 +16,7 @@ if BR2_PACKAGE_HOST_GDB
 choice
 	prompt "GDB debugger Version"
 	depends on !BR2_arc
+	depends on !BR2_microblaze
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
 	default BR2_GDB_VERSION_7_5
@@ -59,5 +60,6 @@ config BR2_GDB_VERSION
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5
 	default "f25a1952afd054205f9471e449c1f7ca5b271b7c" if BR2_arc
+	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 
 endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index e6b1115..fbe1641 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -26,6 +26,11 @@ GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gdb,$(GDB_VERSION)
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 endif
 
+ifeq ($(BR2_microblaze),y)
+GDB_SITE = $(call github,Xilinx,gdb,$(GDB_VERSION))
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+endif
+
 ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
 GDB_SITE = ftp://www.at91.com/pub/buildroot/
 endif
-- 
1.8.1.2
