From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 22:07:49 +0100
Subject: [Buildroot] [git commit] ncdu: new package
Message-ID: <20130121220053.D10289A6BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d808d2e4b2237846f843e022934cb40fe4dbc13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/ncdu/Config.in |    7 +++++++
 package/ncdu/ncdu.mk   |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f3aa1c7..2bb3d29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -780,6 +780,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 endif
 source "package/monit/Config.in"
+source "package/ncdu/Config.in"
 source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
diff --git a/package/ncdu/Config.in b/package/ncdu/Config.in
new file mode 100644
index 0000000..dac7444
--- /dev/null
+++ b/package/ncdu/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NCDU
+	bool "ncdu"
+	select BR2_PACKAGE_NCURSES
+	help
+	  ncdu is a disk usage analyzer with an ncurses interface
+
+	  http://dev.yorhel.nl/ncdu
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
new file mode 100644
index 0000000..06f5e71
--- /dev/null
+++ b/package/ncdu/ncdu.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# ncdu
+#
+#############################################################
+
+NCDU_VERSION = 1.9
+NCDU_SITE = http://dev.yorhel.nl/download/
+
+NCDU_DEPENDENCIES = ncurses
+
+NCDU_LICENSE = MIT
+NCDU_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
