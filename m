From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 30 Jul 2013 11:37:13 +0200
Subject: [Buildroot] [PATCH] gdb: Add support for ARC-specific gdb
Message-ID: <1375177033-17273-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/gdb/Config.in.host |    2 ++
 package/gdb/gdb.mk         |    4 ++++
 2 files changed, 6 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a791f09..128aed9 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -15,6 +15,7 @@ if BR2_PACKAGE_HOST_GDB
 
 choice
 	prompt "GDB debugger Version"
+	depends on !BR2_arc
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
 	default BR2_GDB_VERSION_7_5
@@ -57,5 +58,6 @@ config BR2_GDB_VERSION
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5
+	default "7.5.1-arc" if BR2_arc
 
 endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index fbb2fae..9cf90e3 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -21,6 +21,10 @@ GDB_VERSION = 7.5.1
 endif
 endif
 
+ifeq ($(BR2_arc),y)
+GDB_SITE = $(BR2_ARC_SITE)
+endif
+
 ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
 GDB_SITE = ftp://www.at91.com/pub/buildroot/
 endif
-- 
1.7.9.5
