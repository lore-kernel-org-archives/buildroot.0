From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 May 2011 11:49:37 +0200
Subject: [Buildroot] [git commit] package: Adding Next Generation IRC deamon
	ngircd
Message-ID: <20110506095024.CA2FB831CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ee3f31b536965d5419d6e437cb4e241ece84587f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop explicit documentation removal]
Acked-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Signed-off-by: Fabien Marteau <fabien.marteau@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/ngircd/Config.in |    7 +++++++
 package/ngircd/ngircd.mk |   11 +++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/ngircd/Config.in
 create mode 100644 package/ngircd/ngircd.mk

diff --git a/package/Config.in b/package/Config.in
index 6f3384c..5e48ab7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -416,6 +416,7 @@ source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
 source "package/nfs-utils/Config.in"
+source "package/ngircd/Config.in"
 source "package/ntp/Config.in"
 source "package/nuttcp/Config.in"
 source "package/olsr/Config.in"
diff --git a/package/ngircd/Config.in b/package/ngircd/Config.in
new file mode 100644
index 0000000..e8fc3d0
--- /dev/null
+++ b/package/ngircd/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NGIRCD
+	bool "ngircd"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Next Generation IRC server deamon.
+
+	  http://ngircd.barton.de
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
new file mode 100644
index 0000000..d2aed23
--- /dev/null
+++ b/package/ngircd/ngircd.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# ngIRCd: Next Generation IRC Daemon
+#
+#############################################################
+
+NGIRCD_VERSION = 17.1
+NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
+NGIRCD_DEPENDENCIES = zlib
+
+$(eval $(call AUTOTARGETS,package,ngircd))
-- 
1.7.3.4
