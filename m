From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:11:38 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: fix separator for
	2016.05 legacy options
Message-ID: <20160302202759.D4EA37F98B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2661c4f1b715d4ea3df41c4c86373f64bf4a5b6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we opened up the next branch, a number of options have been
added to Config.in.legacy. However, they are located under the "legacy
options removed in 2016.02", which is not correct. This commit fixes
that by adding the "legacy options removed in 2016.05" header, and
restoring the one related to 2016.02 at the right location.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 69b3c84..53baa84 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,7 +143,7 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
-comment "Legacy options removed in 2016.02"
+comment "Legacy options removed in 2016.05"
 
 config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
 	bool "systemd all extras option has been removed"
@@ -173,6 +173,9 @@ config BR2_PACKAGE_SQLITE_READLINE
 	  command-line editing should be enabled, it also also takes
 	  libedit into account.
 
+###############################################################################
+comment "Legacy options removed in 2016.02"
+
 config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
 	bool "openpowerlink debug option has been removed"
 	select BR2_LEGACY
