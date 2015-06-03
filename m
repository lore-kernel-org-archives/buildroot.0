From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:22 +0200
Subject: [Buildroot] [PATCH 05/32 v2] package/matchbox: make
	matchbox-desktop a real package
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <2af12f3fb912ccbc5ac5c1a0d7791a92e981bc39.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, matchbox-desktop is treated as if it were an option of the
matchbox package.

But that's not true, since it is a real package all by itself, with its
own archive and its own buildsystem.

So, make it a real package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox/Config.in                  | 7 +------
 package/matchbox/matchbox-desktop/Config.in | 5 +++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 create mode 100644 package/matchbox/matchbox-desktop/Config.in

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index e791cea..39aff3c 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -22,12 +22,7 @@ if BR2_PACKAGE_MATCHBOX
 source "package/matchbox/matchbox-lib/Config.in"
 source "package/matchbox/matchbox-wm/Config.in"
 source "package/matchbox/matchbox-panel/Config.in"
-
-config BR2_PACKAGE_MATCHBOX_DESKTOP
-	bool "Matchbox Desktop"
-	select BR2_PACKAGE_ZLIB
-	help
-	  A PDA style application launcher or 'item browser'.
+source "package/matchbox/matchbox-desktop/Config.in"
 
 config BR2_PACKAGE_MATCHBOX_COMMON
 	bool "Matchbox session common files"
diff --git a/package/matchbox/matchbox-desktop/Config.in b/package/matchbox/matchbox-desktop/Config.in
new file mode 100644
index 0000000..c9fd196
--- /dev/null
+++ b/package/matchbox/matchbox-desktop/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_MATCHBOX_DESKTOP
+	bool "Matchbox Desktop"
+	select BR2_PACKAGE_ZLIB
+	help
+	  A PDA style application launcher or 'item browser'.
-- 
1.9.1
