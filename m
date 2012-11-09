From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Nov 2012 09:56:58 +0100
Subject: [Buildroot] [git commit] add new package grantlee
Message-ID: <20121109092607.3004799C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=062129c16eeea69c72d7d65b109bc7667449cb71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: sort alphabetically in Config.in]
Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/grantlee/Config.in   |    9 +++++++++
 package/grantlee/grantlee.mk |   13 +++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2ab6b6e..074e9df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -138,6 +138,7 @@ source "package/qt/Config.in"
 
 if BR2_PACKAGE_QT
 comment "QT libraries and helper libraries"
+source "package/grantlee/Config.in"
 source "package/qextserialport/Config.in"
 source "package/qtuio/Config.in"
 endif
diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
new file mode 100644
index 0000000..84afad2
--- /dev/null
+++ b/package/grantlee/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GRANTLEE
+	bool "grantlee"
+	select BR2_PACKAGE_QT_STL
+	select BR2_PACKAGE_QT_SCRIPT
+	select BR2_PACKAGE_QT_GUI_MODULE
+	help
+	  Qt implemantation of the Django template framework
+
+	  http://www.grantlee.org
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
new file mode 100644
index 0000000..10adfd9
--- /dev/null
+++ b/package/grantlee/grantlee.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# grantlee
+#
+#############################################################
+
+GRANTLEE_VERSION = 0.2.0
+GRANTLEE_SITE = http://downloads.grantlee.org
+GRANTLEE_INSTALL_STAGING = YES
+GRANTLEE_DEPENDENCIES =  qt
+
+$(eval $(cmake-package))
+
