From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 20:58:54 +0100
Subject: [Buildroot] [git commit] kconfig: Refresh patches
Message-ID: <20181030201012.E78CD83239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d61e067ebd7a0914cddfbcae974bf77bc4c68dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../kconfig/patches/01-kconfig-kernel-to-buildroot.patch   | 14 +++++++-------
 .../kconfig/patches/06-br-build-system-integration.patch   | 14 +++++++-------
 .../kconfig/patches/14-support-out-of-tree-config.patch    |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
index 92dcf12f9f..43ae61a9c7 100644
--- a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
@@ -48,10 +48,10 @@ Index: kconfig/zconf.tab.c_shipped
 ===================================================================
 --- kconfig.orig/zconf.tab.c_shipped
 +++ kconfig/zconf.tab.c_shipped
-@@ -1515,7 +1515,7 @@
-	 * later regardless of whether it comes from the 'prompt' in
-	 * mainmenu_stmt or here
-	 */
+@@ -1515,7 +1515,7 @@ yyreduce:
+ 	 * later regardless of whether it comes from the 'prompt' in
+ 	 * mainmenu_stmt or here
+ 	 */
 -	menu_add_prompt(P_MENU, xstrdup("Linux Kernel Configuration"), NULL);
 +	menu_add_prompt(P_MENU, xstrdup("Buildroot Configuration"), NULL);
  }
@@ -62,9 +62,9 @@ Index: kconfig/zconf.y
 --- kconfig.orig/zconf.y
 +++ kconfig/zconf.y
 @@ -127,7 +127,7 @@ no_mainmenu_stmt: /* empty */
-	 * later regardless of whether it comes from the 'prompt' in
-	 * mainmenu_stmt or here
-	 */
+ 	 * later regardless of whether it comes from the 'prompt' in
+ 	 * mainmenu_stmt or here
+ 	 */
 -	menu_add_prompt(P_MENU, xstrdup("Linux Kernel Configuration"), NULL);
 +	menu_add_prompt(P_MENU, xstrdup("Buildroot Configuration"), NULL);
  };
diff --git a/support/kconfig/patches/06-br-build-system-integration.patch b/support/kconfig/patches/06-br-build-system-integration.patch
index f03f909bf1..35420cbb15 100644
--- a/support/kconfig/patches/06-br-build-system-integration.patch
+++ b/support/kconfig/patches/06-br-build-system-integration.patch
@@ -2,7 +2,7 @@ Index: kconfig/Makefile
 ===================================================================
 --- kconfig.orig/Makefile
 +++ kconfig/Makefile
-@@ -211,7 +211,35 @@ qconf-cxxobjs	:= qconf.o
+@@ -205,7 +205,35 @@ qconf-cxxobjs	:= qconf.o
  qconf-objs	:= zconf.tab.o
  gconf-objs	:= gconf.o zconf.tab.o
  
@@ -39,8 +39,8 @@ Index: kconfig/Makefile
  
  targets		+= zconf.lex.c
  clean-files	:= qconf.moc .tmp_qtcheck .tmp_gtkcheck
-@@ -243,7 +243,7 @@ HOSTLOADLIBES_nconf	= $(shell \
-				|| echo "-lmenu -lpanel -lncurses"  )
+@@ -243,7 +271,7 @@ HOSTLOADLIBES_nconf	= $(shell \
+ 				|| echo "-lmenu -lpanel -lncurses"  )
  $(obj)/qconf.o: $(obj)/.tmp_qtcheck
  
 -ifeq ($(MAKECMDGOALS),xconfig)
@@ -48,8 +48,8 @@ Index: kconfig/Makefile
  $(obj)/.tmp_qtcheck: $(src)/Makefile
  -include $(obj)/.tmp_qtcheck
  
-@@ -270,9 +276,8 @@
-	echo "KC_QT_MOC=$$moc" >> $@
+@@ -270,9 +298,8 @@ $(obj)/.tmp_qtcheck:
+ 	echo "KC_QT_MOC=$$moc" >> $@
  endif
  
 +ifeq ($(MAKECMDGOALS),gconf)
@@ -59,10 +59,10 @@ Index: kconfig/Makefile
  -include $(obj)/.tmp_gtkcheck
  
  # GTK+ needs some extra effort, too...
-@@ -300,11 +305,8 @@
+@@ -300,11 +327,8 @@ $(obj)/zconf.tab.o: $(obj)/zconf.lex.c
  
  $(obj)/qconf.o: $(obj)/qconf.moc
-
+ 
 -quiet_cmd_moc = MOC     $@
 -      cmd_moc = $(KC_QT_MOC) -i $< -o $@
 -
diff --git a/support/kconfig/patches/14-support-out-of-tree-config.patch b/support/kconfig/patches/14-support-out-of-tree-config.patch
index 5c221b7a13..a3b33ba688 100644
--- a/support/kconfig/patches/14-support-out-of-tree-config.patch
+++ b/support/kconfig/patches/14-support-out-of-tree-config.patch
@@ -59,7 +59,7 @@ Index: kconfig/confdata.c
  	struct stat sb;
 @@ -851,8 +854,20 @@ static int conf_split_config(void)
  	conf_read_simple(name, S_DEF_AUTO);
-	sym_calc_value(modules_sym);
+ 	sym_calc_value(modules_sym);
  
 -	if (chdir("include/config"))
 -		return 1;
