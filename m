From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 14 Apr 2010 15:30:52 +0300
Subject: [Buildroot] [PATCH 1/2] Add libatomic_ops 1.2 needed by libdrm
	Intel support
In-Reply-To: <20100414122805.17586.64124.stgit@localhost.localdomain>
References: <20100414122805.17586.64124.stgit@localhost.localdomain>
Message-ID: <20100414123052.17586.33962.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/Config.in                      |    1 +
 package/libatomic_ops/Config.in        |    4 ++++
 package/libatomic_ops/libatomic_ops.mk |   12 ++++++++++++
 3 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 package/libatomic_ops/Config.in
 create mode 100644 package/libatomic_ops/libatomic_ops.mk

diff --git a/package/Config.in b/package/Config.in
index 2501903..25cfdb9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -300,6 +300,7 @@ source "package/libupnp/Config.in"
 endmenu
 
 menu "Other"
+source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
new file mode 100644
index 0000000..b9f14d1
--- /dev/null
+++ b/package/libatomic_ops/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_LIBATOMIC_OPS
+	bool "libatomic_ops"
+	help
+	  Atomic operations library
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
new file mode 100644
index 0000000..f26a5fa
--- /dev/null
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# Atomic_ops library
+#
+#############################################################
+
+LIBATOMIC_OPS_VERSION = 1.2
+LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
+LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/research/linux/atomic_ops/download
+LIBATOMIC_OPS_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libatomic_ops))
