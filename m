From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  8 Feb 2013 18:33:00 +0100
Subject: [Buildroot] [PATCH 6/6] package/mtools: new host-package
In-Reply-To: <cover.1360344619.git.yann.morin.1998@free.fr>
References: <cover.1360344619.git.yann.morin.1998@free.fr>
Message-ID: <3103c5fb4a737edda5e8fc0dbd7d5dc20dda572e.1360344619.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in.host        |    1 +
 package/mtools/Config.in.host |    9 +++++++++
 package/mtools/mtools.mk      |   15 +++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/mtools/Config.in.host
 create mode 100644 package/mtools/mtools.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index e97f6e8..7c0dd20 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -6,6 +6,7 @@ source "package/e2fsprogs/Config.in.host"
 source "package/genimage/Config.in.host"
 source "package/genpart/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
+source "package/mtools/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
diff --git a/package/mtools/Config.in.host b/package/mtools/Config.in.host
new file mode 100644
index 0000000..d534b5e
--- /dev/null
+++ b/package/mtools/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_MTOOLS
+	bool "host mtools"
+	help
+	  Mtools is a collection of utilities to access MS-DOS disks from
+	  Unix without mounting them. It supports Win'95 style long file
+	  names, OS/2 Xdf disks and 2m disks (store up to 1992k on a high
+	  density 3 1/2 disk).
+	  
+	  http://www.tux.org/pub/tux/mtools/
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
new file mode 100644
index 0000000..95cc73e
--- /dev/null
+++ b/package/mtools/mtools.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# dosfstools
+#
+#############################################################
+
+MTOOLS_VERSION          = 4.0.18
+MTOOLS_SOURCE           = mtools-$(MTOOLS_VERSION).tar.bz2
+MTOOLS_SITE             = http://ftp.gnu.org/gnu/mtools/
+
+MTOOLS_CONF_OPT = --enable-xdf        \
+                  --enable-vold       \
+                  --enable-new-vold
+
+$(eval $(host-autotools-package))
-- 
1.7.2.5
