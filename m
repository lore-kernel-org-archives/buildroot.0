From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:56:45 +0200
Subject: [Buildroot] [git commit] package/matchbox: make matchbox-common a
	real package
Message-ID: <20150609211051.CF2DF7FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=599f03372593e203a797005d1c25d45f564c3419
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, matchbox-common is treated as if it were an option of the
matchbox package.

But that's not true, since it is a real package all by itself, with its
own archive and its own buildsystem.

So, make it a real package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/Config.in                 |   11 +----------
 package/matchbox/matchbox-common/Config.in |    9 +++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

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
