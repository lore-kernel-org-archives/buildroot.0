From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Apr 2017 22:00:01 +0200
Subject: [Buildroot] [PATCH 3/9] xenomai: group skin selection in separate
	menu and cleanup
In-Reply-To: <20170419200007.12590-1-patrickdepinguin@gmail.com>
References: <20170419200007.12590-1-patrickdepinguin@gmail.com>
Message-ID: <20170419200007.12590-4-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Clarify the Xenomai config options by grouping the skin-related options in a
separate menu.

Additionally:
- update proper capitalization of skin names
- sort entries
- replace 'skin library' by 'skin' to match the terminology in Xenomai
  sources

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/Config.in | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index e633896..31d63f1 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -112,42 +112,46 @@ config BR2_PACKAGE_XENOMAI_ANALOGY
 	  This option allows to install the Xenomai Analogy utilities
 	  and libraries
 
+menu "Skin selection"
+
 config BR2_PACKAGE_XENOMAI_NATIVE_SKIN
-	bool "Alchemy (native) skin library"
+	bool "Alchemy (native) skin"
 	default y
 	help
 	  This option allows to install the Alchemy Xenomai skin, previously
 	  called 'native'
 
 config BR2_PACKAGE_XENOMAI_POSIX_SKIN
-	bool "POSIX skin library"
+	bool "POSIX skin"
 	default y
 	help
 	  This option allows to install the POSIX Xenomai skin
 
-config BR2_PACKAGE_XENOMAI_VXWORKS_SKIN
-	bool "VX-Works skin library"
-	help
-	  This option allows to install the VX-Works Xenomai skin
-
 config BR2_PACKAGE_XENOMAI_PSOS_SKIN
-	bool "PSOS skin library"
+	bool "pSOS skin"
 	help
-	  This option allows to install the PSOS Xenomai skin
+	  This option allows to install the pSOS Xenomai skin
 
 config BR2_PACKAGE_XENOMAI_RTAI_SKIN
-	bool "RTAI skin library"
+	bool "RTAI skin"
 	help
 	  This option allows to install the RTAI Xenomai skin
 
 config BR2_PACKAGE_XENOMAI_UITRON_SKIN
-	bool "uiTron skin library"
+	bool "uITRON skin"
 	help
-	  This option allows to install the uiTron Xenomai skin
+	  This option allows to install the uITRON Xenomai skin
 
 config BR2_PACKAGE_XENOMAI_VRTX_SKIN
-	bool "VRTX skin library"
+	bool "VRTX skin"
 	help
 	  This option allows to install the VRTX Xenomai skin
 
+config BR2_PACKAGE_XENOMAI_VXWORKS_SKIN
+	bool "VxWorks skin"
+	help
+	  This option allows to install the VxWorks Xenomai skin
+
+endmenu
+
 endif
-- 
2.10.2
