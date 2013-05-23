From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 May 2013 22:33:12 +0200
Subject: [Buildroot] [git commit] dvb-apps utilities: needs threads
Message-ID: <20130523205041.6BAFF9A4E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2da9dcc270a9052a19e8e6c720a9cf45c0a397e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/b62/b62289809221b6455fe3db501e869271a64ea454
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
