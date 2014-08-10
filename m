From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Aug 2014 14:51:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/espeak: Depends on MMU
Message-ID: <1407675088-29617-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/dae/dae5c59dfa127e1c3f9e3885cdd1b97e54d8fe41/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/espeak/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index ec81893..b9c34f0 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_ESPEAK
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  espeak is a speech synthesizer software for English and
 	  other languages.
-- 
1.7.10.4
