From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:25 +0200
Subject: [Buildroot] [PATCH 14/30] package/matchbox-common: fix dependencies
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <61941d53366c32c1c804fbc705d310367fe1cc77.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox-common can be used by both matchbox-desktop and matchbox-panel,
so it needs to depend on either, not both.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox-common/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox/matchbox-common/Config.in b/package/matchbox/matchbox-common/Config.in
index f1c4ce3..6ec4697 100644
--- a/package/matchbox/matchbox-common/Config.in
+++ b/package/matchbox/matchbox-common/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MATCHBOX_COMMON
 	bool "matchbox-common"
-	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
+	depends on BR2_PACKAGE_MATCHBOX_PANEL || BR2_PACKAGE_MATCHBOX_DESKTOP
 	help
 	  Common desktop folders and matchbox-session script.
 
-- 
1.9.1
