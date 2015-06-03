From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:33 +0200
Subject: [Buildroot] [PATCH 16/32 v2] package/matchbox-common: fix
	dependencies
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <9fa81fd7cbd6c1694dd4718ccf1ec24fe45f63fe.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox-common can be used by both matchbox-desktop and matchbox-panel,
so it needs to depend on either, not both.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox-common/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox-common/Config.in b/package/matchbox-common/Config.in
index 33d6cc4..5a038e1 100644
--- a/package/matchbox-common/Config.in
+++ b/package/matchbox-common/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MATCHBOX_COMMON
 	bool "matchbox-common"
 	select BR2_PACKAGE_MATCHBOX_LIB
-	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
+	depends on BR2_PACKAGE_MATCHBOX_PANEL || BR2_PACKAGE_MATCHBOX_DESKTOP
 	help
 	  Common desktop folders and matchbox-session script.
 
-- 
1.9.1
