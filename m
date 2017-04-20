From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:33:56 +0200
Subject: [Buildroot] [git commit] xenomai: group skin selection in separate
	menu and cleanup
Message-ID: <20170420211016.C3FAC817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d04d88b780bef14ef642ae026c45323c0c16456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Clarify the Xenomai config options by grouping the skin-related options in a
separate menu.

Additionally:
- update proper capitalization of skin names
- sort entries
- replace 'skin library' by 'skin' to match the terminology in Xenomai
  sources

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
