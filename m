From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 Apr 2018 21:09:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtv-scan-tables: bump version
Message-ID: <20180410190936.19222-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed DTV_SCAN_TABLES_FIX_NONASCII_FILENAMES, not needed anymore
after upstream commit
https://git.linuxtv.org/dtv-scan-tables.git/commit/?id=9481e7c283d3bad69a0440b26a75ab0d16ccdf68

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dtv-scan-tables/dtv-scan-tables.hash |  4 +++-
 package/dtv-scan-tables/dtv-scan-tables.mk   | 11 +----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index 02f086dc5b..1aa6bd59fa 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256 ec64aa81a207372340a04d3e9e950ff2f8b4f404580f21480cdbf06019057a9f  dtv-scan-tables-ceb11833b35f05813b1f0397a60e0f3b99430aab.tar.gz
+sha256 7ded9b437fc3345bbd13a6c1c446c54d0e24d2d337e5abda223adb6362916d8c  dtv-scan-tables-07b18ecef17493ac0908a2e112eae3fe269da7fa.tar.gz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256 4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 3c546ed84f..b7f82562f2 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = ceb11833b35f05813b1f0397a60e0f3b99430aab
+DTV_SCAN_TABLES_VERSION = 07b18ecef17493ac0908a2e112eae3fe269da7fa
 DTV_SCAN_TABLES_SITE = http://git.linuxtv.org/cgit.cgi/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
@@ -17,15 +17,6 @@ DTV_SCAN_TABLES_SITE_METHOD = git
 DTV_SCAN_TABLES_LICENSE = GPL-2.0, LGPL-2.1
 DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LGPL
 
-# In order to avoid issues with file name encodings, we rename the
-# only dtv-scan-tables file that has non-ASCII characters to have a
-# name using only ASCII characters (pl-Krosno_Sucha_Gora)
-define DTV_SCAN_TABLES_FIX_NONASCII_FILENAMES
-	mv $(@D)/dvb-t/pl-Krosno_Sucha* $(@D)/dvb-t/pl-Krosno_Sucha_Gora
-endef
-
-DTV_SCAN_TABLES_POST_PATCH_HOOKS += DTV_SCAN_TABLES_FIX_NONASCII_FILENAMES
-
 define DTV_SCAN_TABLES_INSTALL_TARGET_CMDS
 	for f in atsc dvb-c dvb-s dvb-t; do \
 		$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/dvb/$$f; \
-- 
2.14.2
