From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 22:15:55 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] docs: use-case for
 un-ignoring VCS directories and overridden source dir
Message-ID: <20190623201503.9466B826DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10e05d4a3c9b1bd1da978efbeaba3bc26d883fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Fixes: a27078d32d Allow overriding the VCS exclude list with *_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f52809cbd2329dabb7ce98683ca884ca04c118f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
