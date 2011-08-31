From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:35:05 +0200
Subject: [Buildroot] [PATCH 6/7] support: move kconfig stuff from
	package/config to support/kconfig
In-Reply-To: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e4a6ee2472da24931466231c158189ff676cdcb0.1314826483.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                           |    2 +-
 {package/config => support/kconfig}/.gitignore     |    0
 {package/config => support/kconfig}/Makefile       |    0
 {package/config => support/kconfig}/Makefile.br    |    0
 {package/config => support/kconfig}/POTFILES.in    |    0
 .../config => support/kconfig}/README.buildroot2   |   10 +++++-----
 {package/config => support/kconfig}/check.sh       |    0
 {package/config => support/kconfig}/conf.c         |    0
 {package/config => support/kconfig}/confdata.c     |    0
 {package/config => support/kconfig}/expr.c         |    0
 {package/config => support/kconfig}/expr.h         |    0
 {package/config => support/kconfig}/foo.h          |    0
 {package/config => support/kconfig}/gconf.c        |    2 +-
 {package/config => support/kconfig}/gconf.glade    |    0
 {package/config => support/kconfig}/images.c       |    0
 {package/config => support/kconfig}/kconfig_load.c |    0
 {package/config => support/kconfig}/kxgettext.c    |    0
 .../config => support/kconfig}/lex.zconf.c_shipped |    0
 {package/config => support/kconfig}/lkc.h          |    0
 {package/config => support/kconfig}/lkc_proto.h    |    0
 .../config => support/kconfig}/lxdialog/.gitignore |    0
 .../kconfig}/lxdialog/BIG.FAT.WARNING              |    0
 .../kconfig}/lxdialog/check-lxdialog.sh            |    0
 .../kconfig}/lxdialog/checklist.c                  |    0
 .../config => support/kconfig}/lxdialog/dialog.h   |    0
 .../config => support/kconfig}/lxdialog/inputbox.c |    0
 .../config => support/kconfig}/lxdialog/menubox.c  |    0
 .../config => support/kconfig}/lxdialog/textbox.c  |    0
 .../config => support/kconfig}/lxdialog/util.c     |    0
 .../config => support/kconfig}/lxdialog/yesno.c    |    0
 {package/config => support/kconfig}/mconf.c        |    0
 {package/config => support/kconfig}/menu.c         |    0
 {package/config => support/kconfig}/nconf.c        |    0
 {package/config => support/kconfig}/nconf.gui.c    |    0
 {package/config => support/kconfig}/nconf.h        |    0
 .../patches/01-kconfig-kernel-to-buildroot.patch   |    0
 .../patches/02-cpp-comments-to-c-comments.patch    |    0
 .../patches/03-change-config-option-prefix.patch   |    0
 .../patches/05-really-clean-everything.patch       |    0
 .../patches/06-br-build-system-integration.patch   |    0
 .../kconfig}/patches/08-make-write-deps.patch      |    8 ++++----
 .../patches/09-implement-kconfig-probability.patch |    0
 .../kconfig}/patches/10-br-build-system.patch      |    0
 .../patches/11-use-mktemp-for-lxdialog.patch       |    0
 .../kconfig}/patches/12-fix-glade-file-path.patch  |    8 ++++----
 .../patches/14-support-out-of-tree-config.patch    |    0
 {package/config => support/kconfig}/patches/series |    0
 {package/config => support/kconfig}/qconf.cc       |    0
 {package/config => support/kconfig}/qconf.h        |    0
 .../kconfig}/streamline_config.pl                  |    0
 {package/config => support/kconfig}/symbol.c       |    0
 {package/config => support/kconfig}/util.c         |    2 +-
 {package/config => support/kconfig}/zconf.gperf    |    0
 .../kconfig}/zconf.hash.c_shipped                  |    0
 {package/config => support/kconfig}/zconf.l        |    0
 .../config => support/kconfig}/zconf.tab.c_shipped |    0
 {package/config => support/kconfig}/zconf.y        |    0
 57 files changed, 16 insertions(+), 16 deletions(-)
 rename {package/config => support/kconfig}/.gitignore (100%)
 rename {package/config => support/kconfig}/Makefile (100%)
 rename {package/config => support/kconfig}/Makefile.br (100%)
 rename {package/config => support/kconfig}/POTFILES.in (100%)
 rename {package/config => support/kconfig}/README.buildroot2 (58%)
 rename {package/config => support/kconfig}/check.sh (100%)
 rename {package/config => support/kconfig}/conf.c (100%)
 rename {package/config => support/kconfig}/confdata.c (100%)
 rename {package/config => support/kconfig}/expr.c (100%)
 rename {package/config => support/kconfig}/expr.h (100%)
 rename {package/config => support/kconfig}/foo.h (100%)
 rename {package/config => support/kconfig}/gconf.c (99%)
 rename {package/config => support/kconfig}/gconf.glade (100%)
 rename {package/config => support/kconfig}/images.c (100%)
 rename {package/config => support/kconfig}/kconfig_load.c (100%)
 rename {package/config => support/kconfig}/kxgettext.c (100%)
 rename {package/config => support/kconfig}/lex.zconf.c_shipped (100%)
 rename {package/config => support/kconfig}/lkc.h (100%)
 rename {package/config => support/kconfig}/lkc_proto.h (100%)
 rename {package/config => support/kconfig}/lxdialog/.gitignore (100%)
 rename {package/config => support/kconfig}/lxdialog/BIG.FAT.WARNING (100%)
 rename {package/config => support/kconfig}/lxdialog/check-lxdialog.sh (100%)
 rename {package/config => support/kconfig}/lxdialog/checklist.c (100%)
 rename {package/config => support/kconfig}/lxdialog/dialog.h (100%)
 rename {package/config => support/kconfig}/lxdialog/inputbox.c (100%)
 rename {package/config => support/kconfig}/lxdialog/menubox.c (100%)
 rename {package/config => support/kconfig}/lxdialog/textbox.c (100%)
 rename {package/config => support/kconfig}/lxdialog/util.c (100%)
 rename {package/config => support/kconfig}/lxdialog/yesno.c (100%)
 rename {package/config => support/kconfig}/mconf.c (100%)
 rename {package/config => support/kconfig}/menu.c (100%)
 rename {package/config => support/kconfig}/nconf.c (100%)
 rename {package/config => support/kconfig}/nconf.gui.c (100%)
 rename {package/config => support/kconfig}/nconf.h (100%)
 rename {package/config => support/kconfig}/patches/01-kconfig-kernel-to-buildroot.patch (100%)
 rename {package/config => support/kconfig}/patches/02-cpp-comments-to-c-comments.patch (100%)
 rename {package/config => support/kconfig}/patches/03-change-config-option-prefix.patch (100%)
 rename {package/config => support/kconfig}/patches/05-really-clean-everything.patch (100%)
 rename {package/config => support/kconfig}/patches/06-br-build-system-integration.patch (100%)
 rename {package/config => support/kconfig}/patches/08-make-write-deps.patch (96%)
 rename {package/config => support/kconfig}/patches/09-implement-kconfig-probability.patch (100%)
 rename {package/config => support/kconfig}/patches/10-br-build-system.patch (100%)
 rename {package/config => support/kconfig}/patches/11-use-mktemp-for-lxdialog.patch (100%)
 rename {package/config => support/kconfig}/patches/12-fix-glade-file-path.patch (73%)
 rename {package/config => support/kconfig}/patches/14-support-out-of-tree-config.patch (100%)
 rename {package/config => support/kconfig}/patches/series (100%)
 rename {package/config => support/kconfig}/qconf.cc (100%)
 rename {package/config => support/kconfig}/qconf.h (100%)
 rename {package/config => support/kconfig}/streamline_config.pl (100%)
 rename {package/config => support/kconfig}/symbol.c (100%)
 rename {package/config => support/kconfig}/util.c (99%)
 rename {package/config => support/kconfig}/zconf.gperf (100%)
 rename {package/config => support/kconfig}/zconf.hash.c_shipped (100%)
 rename {package/config => support/kconfig}/zconf.l (100%)
 rename {package/config => support/kconfig}/zconf.tab.c_shipped (100%)
 rename {package/config => support/kconfig}/zconf.y (100%)

diff --git a/Makefile b/Makefile
index f29295f..8dbee7c 100644
--- a/Makefile
+++ b/Makefile
@@ -32,7 +32,7 @@ export BR2_VERSION:=2011.08
 # absolute path
 TOPDIR:=$(shell pwd)
 CONFIG_CONFIG_IN=Config.in
-CONFIG=package/config
+CONFIG=support/kconfig
 DATE:=$(shell date +%Y%m%d)
 
 # Compute the full local version string so packages can use it as-is
diff --git a/package/config/.gitignore b/support/kconfig/.gitignore
similarity index 100%
rename from package/config/.gitignore
rename to support/kconfig/.gitignore
diff --git a/package/config/Makefile b/support/kconfig/Makefile
similarity index 100%
rename from package/config/Makefile
rename to support/kconfig/Makefile
diff --git a/package/config/Makefile.br b/support/kconfig/Makefile.br
similarity index 100%
rename from package/config/Makefile.br
rename to support/kconfig/Makefile.br
diff --git a/package/config/POTFILES.in b/support/kconfig/POTFILES.in
similarity index 100%
rename from package/config/POTFILES.in
rename to support/kconfig/POTFILES.in
diff --git a/package/config/README.buildroot2 b/support/kconfig/README.buildroot2
similarity index 58%
rename from package/config/README.buildroot2
rename to support/kconfig/README.buildroot2
index 8ff0d09..b92ec14 100644
--- a/package/config/README.buildroot2
+++ b/support/kconfig/README.buildroot2
@@ -1,15 +1,15 @@
-This is a copy of the kconfig code in the kernel (currently 2.6.36-rc1) tweaked
+This is a copy of the kconfig code in the kernel (currently 2.6.37-rc1) tweaked
 to suit Buildroot.
 
 To update:
-	cp -r /usr/src/linux/scripts/kconfig package/config.new
-	cd package/config.new
-	cp -a ../config/patches ../config/README.buildroot2 .
+	cp -r /usr/src/linux/scripts/kconfig support/kconfig.new
+	cd support/config.new
+	cp -a ../kconfig/patches ../kconfig/README.buildroot2 .
 	quilt push -a
 	# Fix any conflict
 	cd ..
 	rm -rf config
-	mv config.new config
+	mv kconfig.new kconfig
 
 Then verify the toplevel targets work:
 	config
diff --git a/package/config/check.sh b/support/kconfig/check.sh
similarity index 100%
rename from package/config/check.sh
rename to support/kconfig/check.sh
diff --git a/package/config/conf.c b/support/kconfig/conf.c
similarity index 100%
rename from package/config/conf.c
rename to support/kconfig/conf.c
diff --git a/package/config/confdata.c b/support/kconfig/confdata.c
similarity index 100%
rename from package/config/confdata.c
rename to support/kconfig/confdata.c
diff --git a/package/config/expr.c b/support/kconfig/expr.c
similarity index 100%
rename from package/config/expr.c
rename to support/kconfig/expr.c
diff --git a/package/config/expr.h b/support/kconfig/expr.h
similarity index 100%
rename from package/config/expr.h
rename to support/kconfig/expr.h
diff --git a/package/config/foo.h b/support/kconfig/foo.h
similarity index 100%
rename from package/config/foo.h
rename to support/kconfig/foo.h
diff --git a/package/config/gconf.c b/support/kconfig/gconf.c
similarity index 99%
rename from package/config/gconf.c
rename to support/kconfig/gconf.c
index 21185a0..f9daf98 100644
--- a/package/config/gconf.c
+++ b/support/kconfig/gconf.c
@@ -1521,7 +1521,7 @@ int main(int ac, char *av[])
 	/* Determine GUI path */
 	env = getenv(SRCTREE);
 	if (env)
-		glade_file = g_strconcat(env, "/package/config/gconf.glade", NULL);
+		glade_file = g_strconcat(env, "/support/kconfig/gconf.glade", NULL);
 	else if (av[0][0] == '/')
 		glade_file = g_strconcat(av[0], ".glade", NULL);
 	else
diff --git a/package/config/gconf.glade b/support/kconfig/gconf.glade
similarity index 100%
rename from package/config/gconf.glade
rename to support/kconfig/gconf.glade
diff --git a/package/config/images.c b/support/kconfig/images.c
similarity index 100%
rename from package/config/images.c
rename to support/kconfig/images.c
diff --git a/package/config/kconfig_load.c b/support/kconfig/kconfig_load.c
similarity index 100%
rename from package/config/kconfig_load.c
rename to support/kconfig/kconfig_load.c
diff --git a/package/config/kxgettext.c b/support/kconfig/kxgettext.c
similarity index 100%
rename from package/config/kxgettext.c
rename to support/kconfig/kxgettext.c
diff --git a/package/config/lex.zconf.c_shipped b/support/kconfig/lex.zconf.c_shipped
similarity index 100%
rename from package/config/lex.zconf.c_shipped
rename to support/kconfig/lex.zconf.c_shipped
diff --git a/package/config/lkc.h b/support/kconfig/lkc.h
similarity index 100%
rename from package/config/lkc.h
rename to support/kconfig/lkc.h
diff --git a/package/config/lkc_proto.h b/support/kconfig/lkc_proto.h
similarity index 100%
rename from package/config/lkc_proto.h
rename to support/kconfig/lkc_proto.h
diff --git a/package/config/lxdialog/.gitignore b/support/kconfig/lxdialog/.gitignore
similarity index 100%
rename from package/config/lxdialog/.gitignore
rename to support/kconfig/lxdialog/.gitignore
diff --git a/package/config/lxdialog/BIG.FAT.WARNING b/support/kconfig/lxdialog/BIG.FAT.WARNING
similarity index 100%
rename from package/config/lxdialog/BIG.FAT.WARNING
rename to support/kconfig/lxdialog/BIG.FAT.WARNING
diff --git a/package/config/lxdialog/check-lxdialog.sh b/support/kconfig/lxdialog/check-lxdialog.sh
similarity index 100%
rename from package/config/lxdialog/check-lxdialog.sh
rename to support/kconfig/lxdialog/check-lxdialog.sh
diff --git a/package/config/lxdialog/checklist.c b/support/kconfig/lxdialog/checklist.c
similarity index 100%
rename from package/config/lxdialog/checklist.c
rename to support/kconfig/lxdialog/checklist.c
diff --git a/package/config/lxdialog/dialog.h b/support/kconfig/lxdialog/dialog.h
similarity index 100%
rename from package/config/lxdialog/dialog.h
rename to support/kconfig/lxdialog/dialog.h
diff --git a/package/config/lxdialog/inputbox.c b/support/kconfig/lxdialog/inputbox.c
similarity index 100%
rename from package/config/lxdialog/inputbox.c
rename to support/kconfig/lxdialog/inputbox.c
diff --git a/package/config/lxdialog/menubox.c b/support/kconfig/lxdialog/menubox.c
similarity index 100%
rename from package/config/lxdialog/menubox.c
rename to support/kconfig/lxdialog/menubox.c
diff --git a/package/config/lxdialog/textbox.c b/support/kconfig/lxdialog/textbox.c
similarity index 100%
rename from package/config/lxdialog/textbox.c
rename to support/kconfig/lxdialog/textbox.c
diff --git a/package/config/lxdialog/util.c b/support/kconfig/lxdialog/util.c
similarity index 100%
rename from package/config/lxdialog/util.c
rename to support/kconfig/lxdialog/util.c
diff --git a/package/config/lxdialog/yesno.c b/support/kconfig/lxdialog/yesno.c
similarity index 100%
rename from package/config/lxdialog/yesno.c
rename to support/kconfig/lxdialog/yesno.c
diff --git a/package/config/mconf.c b/support/kconfig/mconf.c
similarity index 100%
rename from package/config/mconf.c
rename to support/kconfig/mconf.c
diff --git a/package/config/menu.c b/support/kconfig/menu.c
similarity index 100%
rename from package/config/menu.c
rename to support/kconfig/menu.c
diff --git a/package/config/nconf.c b/support/kconfig/nconf.c
similarity index 100%
rename from package/config/nconf.c
rename to support/kconfig/nconf.c
diff --git a/package/config/nconf.gui.c b/support/kconfig/nconf.gui.c
similarity index 100%
rename from package/config/nconf.gui.c
rename to support/kconfig/nconf.gui.c
diff --git a/package/config/nconf.h b/support/kconfig/nconf.h
similarity index 100%
rename from package/config/nconf.h
rename to support/kconfig/nconf.h
diff --git a/package/config/patches/01-kconfig-kernel-to-buildroot.patch b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
similarity index 100%
rename from package/config/patches/01-kconfig-kernel-to-buildroot.patch
rename to support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
diff --git a/package/config/patches/02-cpp-comments-to-c-comments.patch b/support/kconfig/patches/02-cpp-comments-to-c-comments.patch
similarity index 100%
rename from package/config/patches/02-cpp-comments-to-c-comments.patch
rename to support/kconfig/patches/02-cpp-comments-to-c-comments.patch
diff --git a/package/config/patches/03-change-config-option-prefix.patch b/support/kconfig/patches/03-change-config-option-prefix.patch
similarity index 100%
rename from package/config/patches/03-change-config-option-prefix.patch
rename to support/kconfig/patches/03-change-config-option-prefix.patch
diff --git a/package/config/patches/05-really-clean-everything.patch b/support/kconfig/patches/05-really-clean-everything.patch
similarity index 100%
rename from package/config/patches/05-really-clean-everything.patch
rename to support/kconfig/patches/05-really-clean-everything.patch
diff --git a/package/config/patches/06-br-build-system-integration.patch b/support/kconfig/patches/06-br-build-system-integration.patch
similarity index 100%
rename from package/config/patches/06-br-build-system-integration.patch
rename to support/kconfig/patches/06-br-build-system-integration.patch
diff --git a/package/config/patches/08-make-write-deps.patch b/support/kconfig/patches/08-make-write-deps.patch
similarity index 96%
rename from package/config/patches/08-make-write-deps.patch
rename to support/kconfig/patches/08-make-write-deps.patch
index b69daad..e5a21c3 100644
--- a/package/config/patches/08-make-write-deps.patch
+++ b/support/kconfig/patches/08-make-write-deps.patch
@@ -2,10 +2,10 @@
  util.c |  117 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  1 file changed, 116 insertions(+), 1 deletion(-)
 
-Index: config/util.c
+Index: kconfig/util.c
 ===================================================================
---- config.orig/util.c
-+++ config/util.c
+--- kconfig.orig/util.c
++++ kconfig/util.c
 @@ -29,6 +29,121 @@
  	return file;
  }
@@ -60,7 +60,7 @@ Index: config/util.c
 +	if (!out)
 +		return 1;
 +	fprintf(out, "# ATTENTION! This does not handle 'depends', just 'select'! \n"
-+		"# See package/config/util.c write_make_deps()\n#\n");
++		"# See support/kconfig/util.c write_make_deps()\n#\n");
 +	menu = &rootmenu;//rootmenu.list;
 +	while (menu) {
 +		sym = menu->sym;
diff --git a/package/config/patches/09-implement-kconfig-probability.patch b/support/kconfig/patches/09-implement-kconfig-probability.patch
similarity index 100%
rename from package/config/patches/09-implement-kconfig-probability.patch
rename to support/kconfig/patches/09-implement-kconfig-probability.patch
diff --git a/package/config/patches/10-br-build-system.patch b/support/kconfig/patches/10-br-build-system.patch
similarity index 100%
rename from package/config/patches/10-br-build-system.patch
rename to support/kconfig/patches/10-br-build-system.patch
diff --git a/package/config/patches/11-use-mktemp-for-lxdialog.patch b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
similarity index 100%
rename from package/config/patches/11-use-mktemp-for-lxdialog.patch
rename to support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
diff --git a/package/config/patches/12-fix-glade-file-path.patch b/support/kconfig/patches/12-fix-glade-file-path.patch
similarity index 73%
rename from package/config/patches/12-fix-glade-file-path.patch
rename to support/kconfig/patches/12-fix-glade-file-path.patch
index 5b080c9..681dce1 100644
--- a/package/config/patches/12-fix-glade-file-path.patch
+++ b/support/kconfig/patches/12-fix-glade-file-path.patch
@@ -2,16 +2,16 @@
  gconf.c |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: config/gconf.c
+Index: kconfig/gconf.c
 ===================================================================
---- config.orig/gconf.c
-+++ config/gconf.c
+--- kconfig.orig/gconf.c
++++ kconfig/gconf.c
 @@ -1521,7 +1521,7 @@
  	/* Determine GUI path */
  	env = getenv(SRCTREE);
  	if (env)
 -		glade_file = g_strconcat(env, "/scripts/kconfig/gconf.glade", NULL);
-+		glade_file = g_strconcat(env, "/package/config/gconf.glade", NULL);
++		glade_file = g_strconcat(env, "/support/kconfig/gconf.glade", NULL);
  	else if (av[0][0] == '/')
  		glade_file = g_strconcat(av[0], ".glade", NULL);
  	else
diff --git a/package/config/patches/14-support-out-of-tree-config.patch b/support/kconfig/patches/14-support-out-of-tree-config.patch
similarity index 100%
rename from package/config/patches/14-support-out-of-tree-config.patch
rename to support/kconfig/patches/14-support-out-of-tree-config.patch
diff --git a/package/config/patches/series b/support/kconfig/patches/series
similarity index 100%
rename from package/config/patches/series
rename to support/kconfig/patches/series
diff --git a/package/config/qconf.cc b/support/kconfig/qconf.cc
similarity index 100%
rename from package/config/qconf.cc
rename to support/kconfig/qconf.cc
diff --git a/package/config/qconf.h b/support/kconfig/qconf.h
similarity index 100%
rename from package/config/qconf.h
rename to support/kconfig/qconf.h
diff --git a/package/config/streamline_config.pl b/support/kconfig/streamline_config.pl
similarity index 100%
rename from package/config/streamline_config.pl
rename to support/kconfig/streamline_config.pl
diff --git a/package/config/symbol.c b/support/kconfig/symbol.c
similarity index 100%
rename from package/config/symbol.c
rename to support/kconfig/symbol.c
diff --git a/package/config/util.c b/support/kconfig/util.c
similarity index 99%
rename from package/config/util.c
rename to support/kconfig/util.c
index f962cef..8a5efaa 100644
--- a/package/config/util.c
+++ b/support/kconfig/util.c
@@ -79,7 +79,7 @@ static int write_make_deps(const char *name)
 	if (!out)
 		return 1;
 	fprintf(out, "# ATTENTION! This does not handle 'depends', just 'select'! \n"
-		"# See package/config/util.c write_make_deps()\n#\n");
+		"# See support/kconfig/util.c write_make_deps()\n#\n");
 	menu = &rootmenu;//rootmenu.list;
 	while (menu) {
 		sym = menu->sym;
diff --git a/package/config/zconf.gperf b/support/kconfig/zconf.gperf
similarity index 100%
rename from package/config/zconf.gperf
rename to support/kconfig/zconf.gperf
diff --git a/package/config/zconf.hash.c_shipped b/support/kconfig/zconf.hash.c_shipped
similarity index 100%
rename from package/config/zconf.hash.c_shipped
rename to support/kconfig/zconf.hash.c_shipped
diff --git a/package/config/zconf.l b/support/kconfig/zconf.l
similarity index 100%
rename from package/config/zconf.l
rename to support/kconfig/zconf.l
diff --git a/package/config/zconf.tab.c_shipped b/support/kconfig/zconf.tab.c_shipped
similarity index 100%
rename from package/config/zconf.tab.c_shipped
rename to support/kconfig/zconf.tab.c_shipped
diff --git a/package/config/zconf.y b/support/kconfig/zconf.y
similarity index 100%
rename from package/config/zconf.y
rename to support/kconfig/zconf.y
-- 
1.7.4.1
