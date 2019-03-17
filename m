From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 10:31:06 +0100
Subject: [Buildroot] [git commit] package/prelink-cross: new package
Message-ID: <20190317093858.E12F88345C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bb0f2ba849dac9208d3a5a4107b8edd5ee46a1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prelink-cross emulates a runtime linker for a given sysroot. This is
necessary to allow gobject-introspection to build it's typelib files
during cross-compiling.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: drop Config.in.host file and visible option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/prelink-cross/prelink-cross.hash |  3 +++
 package/prelink-cross/prelink-cross.mk   | 15 +++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 778dffa5d5..cc4044ff2c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -54,6 +54,7 @@ F:	package/nginx-naxsi/
 F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
+F:	package/prelink-cross/
 F:	package/python3/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
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
index 0000000000..ab7a967f95
--- /dev/null
+++ b/package/prelink-cross/prelink-cross.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# host-prelink-cross
+#
+################################################################################
+
+HOST_PRELINK_CROSS_VERSION = a853a5d715d84eec93aa68e8f2df26b7d860f5b2
+HOST_PRELINK_CROSS_SITE = git://git.yoctoproject.org/prelink-cross
+HOST_PRELINK_CROSS_SITE_METHOD = git
+HOST_PRELINK_CROSS_LICENSE = GPL-2.0
+HOST_PRELINK_CROSS_LICENSE_FILES = COPYING
+HOST_PRELINK_CROSS_AUTORECONF = YES
+HOST_PRELINK_CROSS_DEPENDENCIES = host-binutils host-elfutils
+
+$(eval $(host-autotools-package))
