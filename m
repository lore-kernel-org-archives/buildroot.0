From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  5 Feb 2013 16:34:32 +0100
Subject: [Buildroot] [PATCH 1/2] Legacy: make the menu a normal menu.
In-Reply-To: <cover.1360078421.git.arnout@mind.be>
References: <cover.1360078421.git.arnout@mind.be>
Message-ID: <608f6cdedefe168055e4cc32598409c707246c9f.1360078421.git.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The help text is moved to comments.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy |   25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 906c038..70958c3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -29,20 +29,17 @@ config BR2_LEGACY
 comment "Legacy detected: check the content of the menu below"
 	depends on BR2_LEGACY
 
-# This option should get a new name with every buildroot release, so it defaults
-# to y again for people who upgrade.
-menuconfig BR2_LEGACY_CHECK_2012_11
-	bool "Check for legacy config options"
-	default y
-	help
-	  Select this option to see the config options that are present in your
-	  current .config but are no longer supported by buildroot. If any of
-	  the options in this menu is selected, they should be replaced with
-	  something else. As long as they stay selected, the build will fail.
-	  Just de-select this option to automatically remove all the legacy
-	  configuration.
+menu "Legacy config options"
+
+if BR2_LEGACY
+comment "Your old configuration uses legacy options that no  "
+comment "longer exist in buildroot.                          "
+comment "Please look at the options which have been selected "
+comment "and read their help text.                           "
+comment "As long as these options stay selected, the build   "
+comment "will fail.                                          "
+endif
 
-if BR2_LEGACY_CHECK_2012_11
 
 #
 # Legacy options from 2012.08
@@ -94,4 +91,4 @@ config BR2_PACKAGE_XSERVER_tinyx
 	  The option has been renamed
 	  BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE.
 
-endif
+endmenu
-- 
1.7.10.4
