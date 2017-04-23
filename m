From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:31:17 +0200
Subject: [Buildroot] [PATCH 29/29] package/qt5: drop option for license
	approved
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <0edfc64dedabab8b436312b1212c08dcf9765a05.1492979449.git.yann.morin.1998@free.fr>
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
 Config.in.legacy              | 6 ++++++
 package/qt5/qt5base/Config.in | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 52cda9808e..93df6c52ad 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_QT5BASE_LICENSE_APPROVED
+	bool "Qt5 free license now always approved"
+	select BR2_LEGACY
+	help
+	  Use of Qt5 in Buildroot now always use the free license of Qt5.
+
 config BR2_PACKAGE_QT_LICENSE_APPROVED
 	bool "Qt free license now always approved"
 	select BR2_LEGACY
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 044aa5d545..4796fdb058 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -27,10 +27,6 @@ config BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS
 	  E.g. to remove the Windows Vista style option, add the option
 	  -no-feature-style_windowsvista.
 
-config BR2_PACKAGE_QT5BASE_LICENSE_APPROVED
-	bool
-	default y
-
 config BR2_PACKAGE_QT5BASE_CONFIG_FILE
 	string "Config file"
 	help
-- 
2.11.0
