From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Feb 2010 11:11:43 +0100
Subject: [Buildroot] [git commit master] alsa-utils: alsamixer need libform,
	libmenu & libpanel (from ncurses)
Message-ID: <20100218101224.C45D1776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=909fb5be4b69359f93fef419592dfcb5174480ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this patch alsamixer complains about missing libs and
ldd says:
        libform.so.5 => not found
        libmenu.so.5 => not found
        libpanel.so.5 => not found
        libncurses.so.5 => /usr/lib/libncurses.so.5 (0x4000e000)
        libasound.so.2 => /usr/lib/libasound.so.2 (0x40056000)
        ... <cut>

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                 |    4 ++--
 package/multimedia/alsa-utils/Config.in |    3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 05cb4ae..c03760c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,8 +2,8 @@
 
 	Fixes all over the tree and new features.
 
-	Updated/fixed packages: alsa-lib, argus, at, gst-plugins-good,
-	libpcap, rsync, tcl, xproto_trapproto
+	Updated/fixed packages: alsa-lib, alsa-utils, argus, at,
+	gst-plugins-good, libpcap, rsync, tcl, xproto_trapproto
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index 54ab3f9..04057f4 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -24,6 +24,9 @@ config BR2_PACKAGE_ALSA_UTILS_ALSACTL
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	select BR2_PACKAGE_NCURSES_TARGET_FORM
+	select BR2_PACKAGE_NCURSES_TARGET_MENU
 	default y
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
-- 
1.6.3.3
