From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  2 Jul 2016 15:59:13 +0200
Subject: [Buildroot] [PATCH 7/9] package/systemd: Remove systemd-bootchart
In-Reply-To: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467467955-14609-7-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since systemd v230, bootchart has been removed from the source of
systemd and now lives in its own repository.
A new package will be added in the next commit.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Config.in.legacy           |  6 ++++++
 package/systemd/Config.in  | 10 ----------
 package/systemd/systemd.mk |  6 ------
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 70f6e0a..357f382 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -376,6 +376,12 @@ config BR2_PACKAGE_SYSTEMD_COMPAT
 	  removed. Theses libraries have been useless since a few version, and
 	  have been fully dropped from the source since v230.
 
+config BR2_PACKAGE_SYSTEMD_BOOTCHART
+	bool "systemd-bootchart option has been removed"
+	help
+	  From systemd v230, bootchart is not part of the systemd source anymore.
+	  It is now living in its own repository, a new package must be added.
+
 config BR2_GCC_VERSION_4_5_X
 	bool "gcc 4.5.x has been removed"
 	select BR2_LEGACY
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 17a1c7e..c870138 100644
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
-- 
2.8.1
