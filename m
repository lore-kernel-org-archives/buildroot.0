From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Apr 2014 14:12:29 +0200
Subject: [Buildroot] [git commit] htop: bump to version 1.0.3
Message-ID: <20140428121300.5FAA29C9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=461727372e6efc634f33332af1a3d19fb9f3c077
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also update upstream URL in Config.in]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/htop/Config.in                             |    2 +-
 .../{htop.patch => htop-01-native-affinity.patch}  |    0
 package/htop/htop.mk                               |    5 +++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/htop/Config.in b/package/htop/Config.in
index 51304af..c19ff27 100644
--- a/package/htop/Config.in
+++ b/package/htop/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_HTOP
 	  htop is an interactive text-mode process viewer for Linux.
 	  It aims to be a better top.
 
-	  http://htop.sf.net
+	  http://hisham.hm/htop/
diff --git a/package/htop/htop.patch b/package/htop/htop-01-native-affinity.patch
similarity index 100%
rename from package/htop/htop.patch
rename to package/htop/htop-01-native-affinity.patch
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index fe9b302..a1ec56f 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-HTOP_VERSION = 1.0.2
-HTOP_SITE = http://downloads.sourceforge.net/project/htop/htop/$(HTOP_VERSION)
+HTOP_VERSION = 1.0.3
+HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
+# For htop-01-native-affinity.patch
 HTOP_AUTORECONF = YES
 HTOP_CONF_OPT = --disable-unicode
 HTOP_CONF_ENV = ac_cv_file__proc_stat=yes ac_cv_file__proc_meminfo=yes
