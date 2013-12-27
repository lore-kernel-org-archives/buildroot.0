From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 27 Dec 2013 22:18:29 +0100
Subject: [Buildroot] [PATCH 2/2] support/kconfig: Fix remaining 'kernel'
	mention
In-Reply-To: <1388179109-23491-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1388179109-23491-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1388179109-23491-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch update the patch for kernel's kconfig to add remaining
'kernel' mention.
It also applies this patch to buildroot's kconfig.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 support/kconfig/mconf.c                            |  2 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   | 54 +++++++++++++++-------
 support/kconfig/qconf.cc                           |  2 +-
 3 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/support/kconfig/mconf.c b/support/kconfig/mconf.c
index c3a4d4d..7d6cf80 100644
--- a/support/kconfig/mconf.c
+++ b/support/kconfig/mconf.c
@@ -959,7 +959,7 @@ static int handle_exit(void)
 	if (conf_get_changed())
 		res = dialog_yesno(NULL,
 				   _("Do you wish to save your new configuration?\n"
-				     "(Press <ESC><ESC> to continue kernel configuration.)"),
+				     "(Press <ESC><ESC> to continue Buildroot configuration.)"),
 				   6, 60);
 	else
 		res = -1;
diff --git a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
index 25b436b..6f545e2 100644
--- a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
@@ -6,10 +6,10 @@
  zconf.y             |    2 +-
  5 files changed, 7 insertions(+), 7 deletions(-)
 
-Index: b/gconf.glade
+Index: kconfig/gconf.glade
 ===================================================================
---- a/gconf.glade
-+++ b/gconf.glade
+--- kconfig.orig/gconf.glade	2013-12-27 22:14:32.395629843 +0100
++++ kconfig/gconf.glade	2013-12-27 22:14:32.387630158 +0100
 @@ -4,7 +4,7 @@
  
  <widget class="GtkWindow" id="window1">
@@ -19,11 +19,11 @@ Index: b/gconf.glade
    <property name="type">GTK_WINDOW_TOPLEVEL</property>
    <property name="window_position">GTK_WIN_POS_NONE</property>
    <property name="modal">False</property>
-Index: b/mconf.c
+Index: kconfig/mconf.c
 ===================================================================
---- a/mconf.c
-+++ b/mconf.c
-@@ -178,9 +178,9 @@
+--- kconfig.orig/mconf.c	2013-12-27 22:14:32.395629843 +0100
++++ kconfig/mconf.c	2013-12-27 22:14:42.179244153 +0100
+@@ -176,9 +176,9 @@
  	"Arrow keys navigate the menu.  "
  	"<Enter> selects submenus ---> (or empty submenus ----).  "
  	"Highlighted letters are hotkeys.  "
@@ -35,10 +35,19 @@ Index: b/mconf.c
  radiolist_instructions[] = N_(
  	"Use the arrow keys to navigate this window or "
  	"press the hotkey of the item you wish to select "
-Index: b/zconf.tab.c_shipped
+@@ -959,7 +959,7 @@
+ 	if (conf_get_changed())
+ 		res = dialog_yesno(NULL,
+ 				   _("Do you wish to save your new configuration?\n"
+-				     "(Press <ESC><ESC> to continue kernel configuration.)"),
++				     "(Press <ESC><ESC> to continue Buildroot configuration.)"),
+ 				   6, 60);
+ 	else
+ 		res = -1;
+Index: kconfig/zconf.tab.c_shipped
 ===================================================================
---- a/zconf.tab.c_shipped
-+++ b/zconf.tab.c_shipped
+--- kconfig.orig/zconf.tab.c_shipped	2013-12-27 22:14:32.395629843 +0100
++++ kconfig/zconf.tab.c_shipped	2013-12-27 22:14:32.391630000 +0100
 @@ -2297,7 +2297,7 @@
  
  	sym_init();
@@ -48,10 +57,10 @@ Index: b/zconf.tab.c_shipped
  
  	if (getenv("ZCONF_DEBUG"))
  		zconfdebug = 1;
-Index: b/zconf.y
+Index: kconfig/zconf.y
 ===================================================================
---- a/zconf.y
-+++ b/zconf.y
+--- kconfig.orig/zconf.y	2013-12-27 22:14:32.395629843 +0100
++++ kconfig/zconf.y	2013-12-27 22:14:32.391630000 +0100
 @@ -493,7 +493,7 @@
  
  	sym_init();
@@ -61,10 +70,10 @@ Index: b/zconf.y
  
  	if (getenv("ZCONF_DEBUG"))
  		zconfdebug = 1;
-Index: b/confdata.c
+Index: kconfig/confdata.c
 ===================================================================
---- a/confdata.c
-+++ b/confdata.c
+--- kconfig.orig/confdata.c	2013-12-27 22:14:32.395629843 +0100
++++ kconfig/confdata.c	2013-12-27 22:14:32.391630000 +0100
 @@ -25,7 +25,7 @@
  static const char *conf_filename;
  static int conf_lineno, conf_warnings, conf_unsaved;
@@ -83,3 +92,16 @@ Index: b/confdata.c
  
  	return name ? name : ".config";
  }
+Index: kconfig/qconf.cc
+===================================================================
+--- kconfig.orig/qconf.cc	2013-12-27 22:12:15.825013567 +0100
++++ kconfig/qconf.cc	2013-12-27 22:14:57.826627300 +0100
+@@ -70,7 +70,7 @@
+ }
+ 
+ ConfigSettings::ConfigSettings()
+-	: QSettings("kernel.org", "qconf")
++	: QSettings("buildroot.org", "qconf")
+ {
+ }
+ 
diff --git a/support/kconfig/qconf.cc b/support/kconfig/qconf.cc
index 9d3b04b..f630567 100644
--- a/support/kconfig/qconf.cc
+++ b/support/kconfig/qconf.cc
@@ -70,7 +70,7 @@ static inline QString qgettext(const QString& str)
 }
 
 ConfigSettings::ConfigSettings()
-	: QSettings("kernel.org", "qconf")
+	: QSettings("buildroot.org", "qconf")
 {
 }
 
-- 
1.8.5.1
