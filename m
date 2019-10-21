From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 21 Oct 2019 13:04:35 -0700
Subject: [Buildroot] [PATCH v14 2/5] package/prelink-cross: new package
In-Reply-To: <20191021200438.97453-1-aduskett@gmail.com>
References: <20191021200438.97453-1-aduskett@gmail.com>
Message-ID: <20191021200438.97453-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Prelink-cross emulates a runtime linker for a given sysroot. This is
necessary to allow gobject-introspection to build its typelib files
during cross-compiling.

We're using a sha1 on the cross_prelink branch, as we need the
RTLD-enabled variant of prelink-cross.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v11 -> v13:
  - Change version to a853a5d715d84eec93aa68e8f2df26b7d860f5b2 as the commit
    id b10e14218646d8b74773b82b0f8b395bce698fa2 no longer exists.
 
Changes v10 -> v11:
  - adopted by Yann
  - switch to a https git server
  - drop the Config.in.host entry
  - fix typo in commit log

Changes v9 -> v10:
  - None

Changes v8 -> v9:
  - Add the package to the DEVELOPERS file under my name.
  - Bump version to a853a5d715d84eec93aa68e8f2df26b7d860f5b2
  - Add host-elfutils as a dependency.

Changes v7 -> v8:
  - None

Changes v1 -> v7:
  - Add patch to series.

 DEVELOPERS                               |  1 +
 package/prelink-cross/prelink-cross.hash |  3 +++
 package/prelink-cross/prelink-cross.mk   | 16 ++++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/prelink-cross/prelink-cross.hash
 create mode 100644 package/prelink-cross/prelink-cross.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f10711ee6a..fa2497155d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -53,6 +53,7 @@ F:	package/openjdk/
 F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
+F:	package/prelink-cross/
 F:	package/python3/
 F:	package/python-aioredis/
 F:	package/python-asgiref/
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
new file mode 100644
index 0000000000..3ac33ac3d0
--- /dev/null
+++ b/package/prelink-cross/prelink-cross.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  cb3f5d833cd74b7e90e38465c9c948b0f4138c017509cb91e391b0931063429e  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2.tar.gz
+sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
new file mode 100644
index 0000000000..b43c209b16
--- /dev/null
+++ b/package/prelink-cross/prelink-cross.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# host-prelink-cross
+#
+################################################################################
+
+HOST_PRELINK_CROSS_VERSION = a853a5d715d84eec93aa68e8f2df26b7d860f5b2
+HOST_PRELINK_CROSS_SITE = https://git.yoctoproject.org/git/prelink-cross
+HOST_PRELINK_CROSS_SITE_METHOD = git
+HOST_PRELINK_CROSS_LICENSE = GPL-2.0
+HOST_PRELINK_CROSS_LICENSE_FILES = COPYING
+# Sources from git, no configure script present
+HOST_PRELINK_CROSS_AUTORECONF = YES
+HOST_PRELINK_CROSS_DEPENDENCIES = host-elfutils host-libiberty
+
+$(eval $(host-autotools-package))
-- 
2.21.0
