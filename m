From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  2 Jan 2018 21:04:11 +0100
Subject: [Buildroot] [PATCH 1/2] package/zisofs_tools: new package
In-Reply-To: <cover.1514923441.git.yann.morin.1998@free.fr>
References: <cover.1514923441.git.yann.morin.1998@free.fr>
Message-ID: <00e4aeb9db64cb141c15a9fff0f3be4903504af6.1514923441.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To support transparent (de)compression in iso9660, we need mkzftree,
which comes from zisofs_tools, biundled with cdrkit.

However, cdrkit is a cmake package, but zisofs_tools is an autotools
package, so we need a separate package just to get mkzftree, but it is
pretty lightweight.

We just need the host variant for now,so we just add that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zisofs_tools/zisofs_tools.hash |  5 +++++
 package/zisofs_tools/zisofs_tools.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/zisofs_tools/zisofs_tools.hash
 create mode 100644 package/zisofs_tools/zisofs_tools.mk

diff --git a/package/zisofs_tools/zisofs_tools.hash b/package/zisofs_tools/zisofs_tools.hash
new file mode 100644
index 0000000000..d2f594c757
--- /dev/null
+++ b/package/zisofs_tools/zisofs_tools.hash
@@ -0,0 +1,5 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit/cdrkit_1.1.11-3.dsc
+sha256  d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da  cdrkit_1.1.11.orig.tar.gz
+
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  3rd-party/zisofs_tools/COPYING
diff --git a/package/zisofs_tools/zisofs_tools.mk b/package/zisofs_tools/zisofs_tools.mk
new file mode 100644
index 0000000000..fd8c371fea
--- /dev/null
+++ b/package/zisofs_tools/zisofs_tools.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# zisofs-tools
+#
+################################################################################
+
+ZISOFS_TOOLS_VERSION = 1.1.11
+ZISOFS_TOOLS_SOURCE = cdrkit_$(ZISOFS_TOOLS_VERSION).orig.tar.gz
+ZISOFS_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit
+ZISOFS_TOOLS_LICENSE = GPL-2.0+
+ZISOFS_TOOLS_LICENSE_FILES = 3rd-party/zisofs_tools/COPYING
+ZISOFS_TOOLS_SUBDIR = 3rd-party/zisofs_tools
+HOST_ZISOFS_TOOLS_DEPENDENCIES = host-zlib
+
+$(eval $(host-autotools-package))
-- 
2.11.0
