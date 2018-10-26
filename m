From: Grzegorz Blach <grzegorz@blach.pl>
Date: Fri, 26 Oct 2018 22:00:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/f2fs-tools: add host package
In-Reply-To: <20181026200016.30856-1-grzegorz@blach.pl>
References: <20181026200016.30856-1-grzegorz@blach.pl>
Message-ID: <20181026200016.30856-2-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is useful to create f2fs filesystem during build process.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 DEVELOPERS                        | 1 +
 package/Config.in.host            | 1 +
 package/f2fs-tools/Config.in.host | 7 +++++++
 package/f2fs-tools/f2fs-tools.mk  | 2 ++
 4 files changed, 11 insertions(+)
 create mode 100644 package/f2fs-tools/Config.in.host

diff --git a/DEVELOPERS b/DEVELOPERS
index a3d97eb390..6b708c69c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -891,6 +891,7 @@ F:	package/sofia-sip/
 
 N:	Grzegorz Blach <grzegorz@blach.pl>
 F:	package/bluez5_utils-headers/
+F:	package/f2fs-tools/
 F:	package/pigpio/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
diff --git a/package/Config.in.host b/package/Config.in.host
index 3a3578ceeb..16b474fc9d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -16,6 +16,7 @@ menu "Host utilities"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
+	source "package/f2fs-tools/Config.in.host"
 	source "package/faketime/Config.in.host"
 	source "package/fwup/Config.in.host"
 	source "package/genext2fs/Config.in.host"
diff --git a/package/f2fs-tools/Config.in.host b/package/f2fs-tools/Config.in.host
new file mode 100644
index 0000000000..19c77b9c89
--- /dev/null
+++ b/package/f2fs-tools/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_F2FS_TOOLS
+	bool "host f2fs-tools"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
+	help
+	  Tools for Flash-Friendly File System (F2FS)
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 119cef35cc..7973ebf570 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -9,6 +9,7 @@ F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-to
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
 F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
+HOST_F2FS_TOOLS_DEPENDENCIES = host-pkgconf host-util-linux
 # GIT version, shipped without configure
 F2FS_TOOLS_AUTORECONF = YES
 F2FS_TOOLS_INSTALL_STAGING = YES
@@ -30,3 +31,4 @@ F2FS_TOOLS_CONF_OPTS += --without-blkid
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.17.2
