From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 18 Sep 2019 20:19:37 +0200
Subject: [Buildroot] [PATCH] collectl: new package
Message-ID: <20190918181937.2241-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/collectl/Config.in     | 11 +++++++++++
 package/collectl/collectl.hash |  5 +++++
 package/collectl/collectl.mk   | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/collectl/Config.in
 create mode 100644 package/collectl/collectl.hash
 create mode 100644 package/collectl/collectl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e452a1cbb..529d28f78 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -877,6 +877,7 @@ F:	package/4th/
 F:	package/cgilua/
 F:	package/chipmunk/
 F:	package/cog/
+F:	package/collectl/
 F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
diff --git a/package/Config.in b/package/Config.in
index 42dccf068..0260ddc82 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1828,6 +1828,7 @@ menu "Miscellaneous"
 	source "package/bitcoin/Config.in"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
+	source "package/collectl/Config.in"
 	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
diff --git a/package/collectl/Config.in b/package/collectl/Config.in
new file mode 100644
index 000000000..baa30b4f6
--- /dev/null
+++ b/package/collectl/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_COLLECTL
+	bool "collectl"
+	select BR2_PACKAGE_PERL # runtime
+	help
+	  Collectl is a performance monitoring and benchmark tool that
+	  tries to do it all. You can choose to monitor any of a broad
+	  set of subsystems which currently include buddyinfo, cpu,
+	  disk, inodes, infiniband, lustre, memory, network, nfs,
+	  processes, quadrics, slabs, sockets and tcp.
+
+	  http://collectl.sourceforge.net/
diff --git a/package/collectl/collectl.hash b/package/collectl/collectl.hash
new file mode 100644
index 000000000..d866e0bec
--- /dev/null
+++ b/package/collectl/collectl.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256 2187264d974b36a653c8a4b028ac6eeab23e1885f8b2563a33f06358f39889f1  collectl-4.3.1.src.tar.gz
+sha256 b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
+sha256 264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
diff --git a/package/collectl/collectl.mk b/package/collectl/collectl.mk
new file mode 100644
index 000000000..c9fb59293
--- /dev/null
+++ b/package/collectl/collectl.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# collectl
+#
+################################################################################
+
+COLLECTL_VERSION = 4.3.1
+COLLECTL_SOURCE = collectl-$(COLLECTL_VERSION).src.tar.gz
+COLLECTL_SITE = http://downloads.sourceforge.net/collectl/collectl
+COLLECTL_LICENSE = Artistic or GPL-2.0
+COLLECTL_LICENSE_FILES = COPYING ARTISTIC GPL
+
+define COLLECTL_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		DESTDIR=$(TARGET_DIR) ./INSTALL)
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
