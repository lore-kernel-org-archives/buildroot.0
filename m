From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:02:54 +0200
Subject: [Buildroot] [git commit] package/matchbox: fix option prompts
Message-ID: <20150609211052.5C61E7FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75326a51b2b0ea837de91fc2328b1f44e0fcc7fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the package names instead of some fancy human-readable strings. ;-)

Note: the matchbox package is really named matchbox-window-manager by
upstream. However:
  - it already is in a section of the menu title 'X window managers'
  - users are probably only looking for 'matchbox'
  - keeping just 'matchbox' keeps it in sync with the Kconfig variable,
    and allows us to not handle a legacy entry (see a previous commit)
  - matchbox-window-manager is a bit long. ;-)

So, in this case, the short 'matchbox' prompt is used instead of the
real upstream name.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox-common/Config.in   |    4 ++--
 package/matchbox-desktop/Config.in  |    2 +-
 package/matchbox-keyboard/Config.in |    2 +-
 package/matchbox-panel/Config.in    |    2 +-
 package/matchbox/Config.in          |    2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/matchbox-common/Config.in b/package/matchbox-common/Config.in
index 7d22d05..f1c4ce3 100644
--- a/package/matchbox-common/Config.in
+++ b/package/matchbox-common/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_MATCHBOX_COMMON
-	bool "Matchbox session common files"
+	bool "matchbox-common"
 	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
 	help
 	  Common desktop folders and matchbox-session script.
 
 config BR2_PACKAGE_MATCHBOX_COMMON_PDA
-	bool "PDA style desktop folders"
+	bool "PDA style app folder"
 	depends on BR2_PACKAGE_MATCHBOX_COMMON
diff --git a/package/matchbox-desktop/Config.in b/package/matchbox-desktop/Config.in
index c9fd196..ed80c22 100644
--- a/package/matchbox-desktop/Config.in
+++ b/package/matchbox-desktop/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_MATCHBOX_DESKTOP
-	bool "Matchbox Desktop"
+	bool "matchbox-desktop"
 	select BR2_PACKAGE_ZLIB
 	help
 	  A PDA style application launcher or 'item browser'.
diff --git a/package/matchbox-keyboard/Config.in b/package/matchbox-keyboard/Config.in
index e017358..056a255 100644
--- a/package/matchbox-keyboard/Config.in
+++ b/package/matchbox-keyboard/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
-	bool "Matchbox Virtual Keyboard"
+	bool "matchbox-keyboard"
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_MATCHBOX_FAKEKEY
diff --git a/package/matchbox-panel/Config.in b/package/matchbox-panel/Config.in
index e3daaf5..47bd10a 100644
--- a/package/matchbox-panel/Config.in
+++ b/package/matchbox-panel/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_MATCHBOX_PANEL
-	bool "Matchbox Panel"
+	bool "matchbox-panel"
 	select BR2_PACKAGE_MATCHBOX_LIB
 	help
 	  A flexible always present 'window bar' for holding
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 3d771d3..344635c 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_MATCHBOX
-	bool "MatchBox Window Manager"
+	bool "matchbox"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_FONTCONFIG
