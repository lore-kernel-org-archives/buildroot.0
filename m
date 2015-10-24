From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sat, 24 Oct 2015 01:10:32 -0200
Subject: [Buildroot] [PATCH 2/2] doom-wad: add BR2_PACKAGE_CHOCOLATE_DOOM as
	alternate dependency
In-Reply-To: <1445656232-32093-1-git-send-email-rprebello@gmail.com>
References: <1445656232-32093-1-git-send-email-rprebello@gmail.com>
Message-ID: <1445656232-32093-2-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The shareware WAD file is also supported by Chocolate Doom. The option
'-gameversion 1.8' must be passed to chocolate-doom, though. Otherwise,
in-game demos will fail to play.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/doom-wad/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/doom-wad/Config.in b/package/doom-wad/Config.in
index aa1d029..edd299b 100644
--- a/package/doom-wad/Config.in
+++ b/package/doom-wad/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DOOM_WAD
 	bool "shareware Doom WAD file"
-	depends on BR2_PACKAGE_PRBOOM
+	depends on BR2_PACKAGE_CHOCOLATE_DOOM || BR2_PACKAGE_PRBOOM
 	help
 	  This will install the shareware wad data file for the doom game.
 
-- 
2.1.4
