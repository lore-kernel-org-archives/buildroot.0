From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 22 May 2013 17:24:03 -0700
Subject: [Buildroot] [PATCH 1/5] dvb-apps utilities: needs threads
Message-ID: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/b62/b62289809221b6455fe3db501e869271a64ea454
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/dvb-apps/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
index 7f76330..a77064e 100644
--- a/package/dvb-apps/Config.in
+++ b/package/dvb-apps/Config.in
@@ -8,12 +8,13 @@ config BR2_PACKAGE_DVB_APPS
 
 if BR2_PACKAGE_DVB_APPS
 
-comment "dvb-apps utils needs LARGEFILE support in the toolchain"
-	depends on !BR2_LARGEFILE
+comment "dvb-apps utils needs a toolchain with LARGEFILE and THREADS support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_DVB_APPS_UTILS
 	bool "dvb-apps utilities"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  A small number of DVB test and utility programs,
-- 
1.7.4.1
