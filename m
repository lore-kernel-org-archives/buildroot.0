From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:31:16 +0200
Subject: [Buildroot] [PATCH 28/29] package/qt: drop option for license
	approved
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <2389cf9ab684f7d56a7ab20b3d8a2be0fa612167.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated in previous commits, Buildroot only ever uses the free
license, and we do not have a click-wrap approval for any such free
license for any other package.

The option to approve the license now has no prompt and is no longer
used anywhere. Drop it and make it a legacy entry.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 Config.in.legacy     | 6 ++++++
 package/qt/Config.in | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8e9f3d175d..52cda9808e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_QT_LICENSE_APPROVED
+	bool "Qt free license now always approved"
+	select BR2_LEGACY
+	help
+	  Use of Qt in Buildroot now always use the free license of Qt.
+
 config BR2_PACKAGE_PORTMAP
 	bool "portmap has been removed"
 	select BR2_LEGACY
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 5f07bd22f9..d3a01da87f 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -99,10 +99,6 @@ config BR2_PACKAGE_QT_STATIC
 
 endchoice
 
-config BR2_PACKAGE_QT_LICENSE_APPROVED
-	bool
-	default y
-
 config BR2_PACKAGE_QT_CONFIG_FILE
 	string "Config file"
 	help
-- 
2.11.0
