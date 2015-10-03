From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 14:25:52 +0200
Subject: [Buildroot] [git commit] system: use a menuconfig for the getty
	options
Message-ID: <20151003123722.83EDA7FFDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fc79762529b51bda082495f2d173c50f548d028
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Making the getty option a menuconfig instead of a simple config
automatically moves its dependees into a menu without the need to
manually declare such a menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 03521fd..45170d8 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -260,12 +260,11 @@ config BR2_SYSTEM_BIN_SH
 	default "dash"    if BR2_SYSTEM_BIN_SH_DASH
 	default "zsh"     if BR2_SYSTEM_BIN_SH_ZSH
 
-config BR2_TARGET_GENERIC_GETTY
+menuconfig BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
 	default y
 
 if BR2_TARGET_GENERIC_GETTY
-menu "getty options"
 config BR2_TARGET_GENERIC_GETTY_PORT
 	string "TTY port"
 	default "console"
@@ -313,7 +312,6 @@ config BR2_TARGET_GENERIC_GETTY_OPTIONS
 	help
 	  Any other flags you want to pass to getty,
 	  Refer to getty --help for details.
-endmenu
 endif
 
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
