From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:17 +0200
Subject: [Buildroot] [PATCH 06/30] package/matchbox: make matchbox-common a
	real package
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <3e3893d8a377276f8a62bdbb4a093b60d9977773.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, matchbox-common is treated as if it were an option of the
matchbox package.

But that's not true, since it is a real package all by itself, with its
own archive and its own buildsystem.

So, make it a real package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/Config.in                 | 11 +----------
 package/matchbox/matchbox-common/Config.in |  9 +++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 create mode 100644 package/matchbox/matchbox-common/Config.in

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 39aff3c..ead2649 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -23,16 +23,7 @@ source "package/matchbox/matchbox-lib/Config.in"
 source "package/matchbox/matchbox-wm/Config.in"
 source "package/matchbox/matchbox-panel/Config.in"
 source "package/matchbox/matchbox-desktop/Config.in"
-
-config BR2_PACKAGE_MATCHBOX_COMMON
-	bool "Matchbox session common files"
-	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
-	help
-	  Common desktop folders and matchbox-session script.
-
-config BR2_PACKAGE_MATCHBOX_COMMON_PDA
-	bool "PDA style desktop folders"
-	depends on BR2_PACKAGE_MATCHBOX_COMMON
+source "package/matchbox/matchbox-common/Config.in"
 
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "Matchbox Virtual Keyboard"
diff --git a/package/matchbox/matchbox-common/Config.in b/package/matchbox/matchbox-common/Config.in
new file mode 100644
index 0000000..7d22d05
--- /dev/null
+++ b/package/matchbox/matchbox-common/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MATCHBOX_COMMON
+	bool "Matchbox session common files"
+	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
+	help
+	  Common desktop folders and matchbox-session script.
+
+config BR2_PACKAGE_MATCHBOX_COMMON_PDA
+	bool "PDA style desktop folders"
+	depends on BR2_PACKAGE_MATCHBOX_COMMON
-- 
1.9.1
