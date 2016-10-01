From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Oct 2016 23:22:18 +0200
Subject: [Buildroot] [git commit] add mksh to system shell choice
Message-ID: <20161001213926.5FFC3807DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=519f90361197998ba339958168a0aff872f1644e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add mksh as a choice for system shells.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 77c665b..d3b2889 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -276,13 +276,19 @@ config BR2_SYSTEM_BIN_SH_DASH
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DASH
 
+config BR2_SYSTEM_BIN_SH_MKSH
+	bool "mksh"
+	depends on BR2_USE_MMU # mksh
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_MKSH
+
 config BR2_SYSTEM_BIN_SH_ZSH
 	bool "zsh"
 	depends on BR2_USE_MMU # zsh
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_ZSH
 
-comment "bash, dash, zsh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
+comment "bash, dash, mksh, zsh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS && BR2_PACKAGE_BUSYBOX
 
 config BR2_SYSTEM_BIN_SH_NONE
@@ -295,6 +301,7 @@ config BR2_SYSTEM_BIN_SH
 	default "busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
 	default "bash"    if BR2_SYSTEM_BIN_SH_BASH
 	default "dash"    if BR2_SYSTEM_BIN_SH_DASH
+	default "mksh"    if BR2_SYSTEM_BIN_SH_MKSH
 	default "zsh"     if BR2_SYSTEM_BIN_SH_ZSH
 
 menuconfig BR2_TARGET_GENERIC_GETTY
