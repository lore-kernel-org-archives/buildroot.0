From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 12 Nov 2013 14:26:14 +0100
Subject: [Buildroot] [PATCH 1/7] gdb: arc: Use git instead of website
In-Reply-To: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1384262780-12743-2-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/gdb/Config.in.host |    2 +-
 package/gdb/gdb.mk         |    9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 128aed9..d4e8ee7 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -58,6 +58,6 @@ config BR2_GDB_VERSION
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5
-	default "7.5.1-arc" if BR2_arc
+	default "8673f98"  if BR2_arc
 
 endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9cf90e3..317d78c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -21,15 +21,16 @@ GDB_VERSION = 7.5.1
 endif
 endif
 
-ifeq ($(BR2_arc),y)
-GDB_SITE = $(BR2_ARC_SITE)
-endif
-
 ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
 GDB_SITE = ftp://www.at91.com/pub/buildroot/
 endif
 
+ifeq ($(BR2_arc),y)
+GDB_SITE = git://github.com/foss-for-synopsys-dwc-arc-processors/gdb.git
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+else
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
+endif
 GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
-- 
1.7.9.5
