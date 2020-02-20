From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2020 22:10:19 +0100
Subject: [Buildroot] [git commit branch/next] package/prelink-cross: new
 package
Message-ID: <20200220212007.77E388E650@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8af40358e3885440248aa783490096bdd1b7a90c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Prelink-cross emulates a runtime linker for a given sysroot. This is
necessary to allow gobject-introspection to build its typelib files
during cross-compiling.

We're using a sha1 on the cross_prelink branch, as we need the
RTLD-enabled variant of prelink-cross.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr:
  - drop HOST_ prefix for inherited variables
  - fix licensing info to "or-later"
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                               |  1 +
 package/prelink-cross/prelink-cross.hash |  3 +++
 package/prelink-cross/prelink-cross.mk   | 16 ++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3cb0a78e73..09927e22d9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -53,6 +53,7 @@ F:	package/openjdk/
 F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
+F:	package/prelink-cross/
 F:	package/polkit/
 F:	package/python3/
 F:	package/python-aioredis/
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
index 0000000000..2312ee53e6
--- /dev/null
+++ b/package/prelink-cross/prelink-cross.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# host-prelink-cross
+#
+################################################################################
+
+PRELINK_CROSS_VERSION = a853a5d715d84eec93aa68e8f2df26b7d860f5b2
+PRELINK_CROSS_SITE = https://git.yoctoproject.org/git/prelink-cross
+PRELINK_CROSS_SITE_METHOD = git
+PRELINK_CROSS_LICENSE = GPL-2.0+
+PRELINK_CROSS_LICENSE_FILES = COPYING
+# Sources from git, no configure script present
+PRELINK_CROSS_AUTORECONF = YES
+HOST_PRELINK_CROSS_DEPENDENCIES = host-elfutils host-libiberty
+
+$(eval $(host-autotools-package))
