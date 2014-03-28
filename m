From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Mar 2014 01:00:22 +0100
Subject: [Buildroot] [PATCH 05/10] package/tvheadend: transponders data now
	provided by dtv-scan-tables
In-Reply-To: <cover.1395964430.git.yann.morin.1998@free.fr>
References: <cover.1395964430.git.yann.morin.1998@free.fr>
Message-ID: <e379cba61e803c4eafcb903a77a24162d2d4fcb2.1395964430.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/Config.in    | 2 +-
 package/tvheadend/tvheadend.mk | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index a5bbeee..bb71d81 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_TVHEADEND
 	# context of Buildroot, the only really problematic
 	# architecture is avr32, which uses gcc 4.2.
 	depends on !BR2_avr32
-	select BR2_PACKAGE_DVB_APPS
+	select BR2_PACKAGE_DTV_SCAN_TABLES
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Tvheadend is a TV streaming server for Linux supporting DVB-S,
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 9b1e443..87be703 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -16,11 +16,11 @@ endif
 
 #----------------------------------------------------------------------------
 # tvheadend is a little smuggler and thief! ;-)
-# During the ./configure, it downloads some files from the dvb-apps
+# During the ./configure, it downloads some files from the dtv-scan-tables
 # package, so it has a list of pre-scanned tunner configurations.
 # For buildroot, we add a patch that avoids doing that, but uses the
-# scan files installed by the dvb-apps package
-TVHEADEND_DEPENDENCIES     += dvb-apps
+# scan files installed by the dtv-scan-tables package
+TVHEADEND_DEPENDENCIES     += dtv-scan-tables
 
 define TVHEADEND_CONFIGURE_CMDS
 	(cd $(@D);				\
-- 
1.8.3.2
