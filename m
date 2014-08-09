From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Aug 2014 14:02:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/matchbox/matchbox-desktop: Depends
	on MMU
In-Reply-To: <1407585743-20742-1-git-send-email-bernd.kuhls@t-online.de>
References: <1407585743-20742-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1407585743-20742-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
mbdesktop_win_plugin.o: In function `mbdesktop_win_plugin_load':
/home/br/br/output/build/matchbox-desktop-0.9.1/src/mbdesktop_win_plugin.c:22: undefined reference to `_fork'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/matchbox/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 74c370c..5b7a9b8 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_MATCHBOX_PANEL
 
 config BR2_PACKAGE_MATCHBOX_DESKTOP
 	bool "Matchbox Desktop"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	help
 	  A PDA style application launcher or 'item browser'.
-- 
1.7.10.4
