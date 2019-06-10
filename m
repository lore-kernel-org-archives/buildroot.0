From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 10 Jun 2019 15:37:12 +0200
Subject: [Buildroot] [PATCH] docs: use-case for un-ignoring VCS directories
 and overridden source dir
Message-ID: <31212b9d2c0481e0618401c0dc8f1d6d7ce18710.1560173933.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Fixes: a27078d32d Allow overriding the VCS exclude list with *_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS
---
 docs/manual/using-buildroot-development.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index 65a9f1a3f7..da6dd822fb 100644
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -109,3 +109,13 @@ WEBKITGTK_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = \
 	--exclude WebDriverTests --exclude WebKitBuild --exclude WebKitLibraries \
 	--exclude WebKit.xcworkspace --exclude Websites --exclude Examples
 ------------------
+
+By default, Buildroot skips syncing of VCS artifacts (e.g., the *.git* and
+*.svn* directories). Some packages prefer to have these VCS directories
+available during build, for example for automatically determining a precise
+commit reference for version information. To undo this built-in filtering at a
+cost of a slower speed, add these directories back:
+
+------------------
+LINUX_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = --include .git
+------------------
-- 
2.21.0
