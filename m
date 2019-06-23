From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 23 Jun 2019 17:23:38 -0400
Subject: [Buildroot] [PATCH v12 2/6] package/prelink-cross: new package
In-Reply-To: <20190623212342.41809-1-aduskett@gmail.com>
References: <20190623212342.41809-1-aduskett@gmail.com>
Message-ID: <20190623212342.41809-3-aduskett@gmail.com>
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
 package/prelink-cross/prelink-cross.mk   | 15 +++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/prelink-cross/prelink-cross.hash
 create mode 100644 package/prelink-cross/prelink-cross.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0da0fa9437..ab968a86d9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -56,6 +56,7 @@ F:	package/openjdk/
 F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
+F:	package/prelink-cross/
 F:	package/python3/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
new file mode 100644
index 0000000000..8ef4409cbf
--- /dev/null
+++ b/package/prelink-cross/prelink-cross.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  3b07d864b366273fcf714f7176dac34846c9b93a75909d501ee17c416327059c  prelink-cross-b10e14218646d8b74773b82b0f8b395bce698fa2.tar.gz
+sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
new file mode 100644
index 0000000000..e1fdaba2a9
--- /dev/null
+++ b/package/prelink-cross/prelink-cross.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# host-prelink-cross
+#
+################################################################################
+
+HOST_PRELINK_CROSS_VERSION = b10e14218646d8b74773b82b0f8b395bce698fa2
+HOST_PRELINK_CROSS_SITE = https://git.yoctoproject.org/git/prelink-cross
+HOST_PRELINK_CROSS_SITE_METHOD = git
+HOST_PRELINK_CROSS_LICENSE = GPL-2.0
+HOST_PRELINK_CROSS_LICENSE_FILES = COPYING
+HOST_PRELINK_CROSS_AUTORECONF = YES
+HOST_PRELINK_CROSS_DEPENDENCIES = host-elfutils host-libiberty
+
+$(eval $(host-autotools-package))
-- 
2.21.0
