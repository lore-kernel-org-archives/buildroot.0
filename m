From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 May 2013 08:14:33 +0200
Subject: [Buildroot] [PATCH] package/dvb-apps: utils requires a toolchain
	with threads
Message-ID: <1369116873-26930-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes:
    http://autobuild.buildroot.net/results/b62/b62289809221b6455fe3db501e869271a64ea454/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dvb-apps/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
index 7f76330..815381a 100644
--- a/package/dvb-apps/Config.in
+++ b/package/dvb-apps/Config.in
@@ -8,12 +8,13 @@ config BR2_PACKAGE_DVB_APPS
 
 if BR2_PACKAGE_DVB_APPS
 
-comment "dvb-apps utils needs LARGEFILE support in the toolchain"
-	depends on !BR2_LARGEFILE
+comment "dvb-apps utils needs LARGEFILE and THREADS support in the toolchain"
+	depends on ! BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_DVB_APPS_UTILS
 	bool "dvb-apps utilities"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  A small number of DVB test and utility programs,
-- 
1.8.1.2
