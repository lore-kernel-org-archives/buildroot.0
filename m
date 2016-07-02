From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:45:34 +0200
Subject: [Buildroot] [git commit] package/systemd: Remove systemd-bootchart
Message-ID: <20160702144603.41103807A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd3fb212d241e083c8c705954e4ace1144dd9367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since systemd v230, bootchart has been removed from the source of
systemd and now lives in its own repository.
A new package will be added in the next commit.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy           |  7 +++++++
 package/systemd/Config.in  | 10 ----------
 package/systemd/systemd.mk |  6 ------
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a135d3d..0dcd930 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
+config BR2_PACKAGE_SYSTEMD_BOOTCHART
+	bool "systemd-bootchart option has been removed"
+	help
+	  From systemd v230, bootchart is not part of the systemd
+	  source anymore.  It is now living in its own repository, a
+	  new package must be added.
+
 config BR2_PACKAGE_SYSTEMD_COMPAT
 	bool "systemd compatibility libraries have been removed"
 	help
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f064c12..0b28aed 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -111,16 +111,6 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
 
-config BR2_PACKAGE_SYSTEMD_BOOTCHART
-	bool "enable bootchart tool"
-	help
-	  systemd-bootchart is a tool, usually run at system startup,
-	  that collects the CPU load, disk load, memory usage, as well
-	  as per-process information from a running system. Collected
-	  results are output as an SVG graph.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-bootchart.html
-
 config BR2_PACKAGE_SYSTEMD_QUOTACHECK
 	bool "enable quotacheck tools"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 835fc26..689b40d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -171,12 +171,6 @@ else
 SYSTEMD_CONF_OPTS += --disable-vconsole
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_BOOTCHART),y)
-SYSTEMD_CONF_OPTS += --enable-bootchart
-else
-SYSTEMD_CONF_OPTS += --disable-bootchart
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD_QUOTACHECK),y)
 SYSTEMD_CONF_OPTS += --enable-quotacheck
 else
