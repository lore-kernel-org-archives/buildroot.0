From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 2 Jul 2013 22:38:36 +0200
Subject: [Buildroot] [git commit] msgpack: new package
Message-ID: <20130702210637.21E479A08C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a20fc5ae2b416067afc64ccb9b99a27266f9b13a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/msgpack/Config.in  |   13 +++++++++++++
 package/msgpack/msgpack.mk |   12 ++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7f5714d..5f2d31b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -623,6 +623,7 @@ source "package/log4cxx/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/mpc/Config.in"
 source "package/mpfr/Config.in"
+source "package/msgpack/Config.in"
 source "package/mtdev2tuio/Config.in"
 source "package/orc/Config.in"
 source "package/p11-kit/Config.in"
diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
new file mode 100644
index 0000000..7f28eaf
--- /dev/null
+++ b/package/msgpack/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MSGPACK
+	bool "msgpack"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  MessagePack is an efficient binary serialization format.
+
+	  It lets you exchange data among multiple languages like JSON but
+	  it's faster and smaller.
+
+	  http://msgpack.org/
+
+comment "msgpack requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
new file mode 100644
index 0000000..c77729f
--- /dev/null
+++ b/package/msgpack/msgpack.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# msgpack
+#
+################################################################################
+
+MSGPACK_VERSION = 0.5.4
+MSGPACK_SITE = http://downloads.sourceforge.net/project/msgpack/msgpack/cpp/
+MSGPACK_LICENSE = Apache-2.0
+MSGPACK_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
