From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Aug 2014 14:02:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/matchbox/matchbox-panel: Depends on
	MMU
Message-ID: <1407585743-20742-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8d5/8d5ad404fab7ec2a501972ba9c08b0109e420b80/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/matchbox/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index da02df3..74c370c 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -13,6 +13,7 @@ if BR2_PACKAGE_MATCHBOX
 
 config BR2_PACKAGE_MATCHBOX_PANEL
 	bool "Matchbox Panel"
+	depends on BR2_USE_MMU # fork()
 	help
 	  A flexible always present 'window bar' for holding
 	  application launchers.
-- 
1.7.10.4
