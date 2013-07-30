From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 23:25:05 +0200
Subject: [Buildroot] [git commit] gdb: Add support for ARC-specific gdb
Message-ID: <20130730212952.6EA9A9AEBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b0b5859b782e7a17fe1d86d77e33783156d70f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host |    2 ++
 package/gdb/gdb.mk         |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)

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
