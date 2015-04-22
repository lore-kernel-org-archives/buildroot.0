From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:15 +0200
Subject: [Buildroot] [PATCH 04/30] package/matchbox: make matchbox-panel a
	real package
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <9d8e6092e50ef50a78cd450f4a9daec38f374949.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, matchbox-panel is treated as if it were an option of the
matchbox package.

But that's not true, since it is a real package all by itself, with its
own archive and its own buildsystem.

So, make it a real package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/Config.in                | 7 +------
 package/matchbox/matchbox-panel/Config.in | 6 ++++++
 2 files changed, 7 insertions(+), 6 deletions(-)
 create mode 100644 package/matchbox/matchbox-panel/Config.in

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 15b1017..e791cea 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -21,12 +21,7 @@ if BR2_PACKAGE_MATCHBOX
 
 source "package/matchbox/matchbox-lib/Config.in"
 source "package/matchbox/matchbox-wm/Config.in"
-
-config BR2_PACKAGE_MATCHBOX_PANEL
-	bool "Matchbox Panel"
-	help
-	  A flexible always present 'window bar' for holding
-	  application launchers.
+source "package/matchbox/matchbox-panel/Config.in"
 
 config BR2_PACKAGE_MATCHBOX_DESKTOP
 	bool "Matchbox Desktop"
diff --git a/package/matchbox/matchbox-panel/Config.in b/package/matchbox/matchbox-panel/Config.in
new file mode 100644
index 0000000..e3daaf5
--- /dev/null
+++ b/package/matchbox/matchbox-panel/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_MATCHBOX_PANEL
+	bool "Matchbox Panel"
+	select BR2_PACKAGE_MATCHBOX_LIB
+	help
+	  A flexible always present 'window bar' for holding
+	  application launchers.
-- 
1.9.1
