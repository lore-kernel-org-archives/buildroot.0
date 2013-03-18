From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 23:11:45 +0100
Subject: [Buildroot] [git commit] package/mtools: new host-package
Message-ID: <20130318221420.A70E99B173@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae2cd54a2706082c6056017790da01ab5139419d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in.host        |    1 +
 package/mtools/Config.in.host |    9 +++++++++
 package/mtools/mtools.mk      |   17 +++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

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
index 0000000..a27c4fd
--- /dev/null
+++ b/package/mtools/mtools.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# mtools
+#
+#############################################################
+
+MTOOLS_VERSION       = 4.0.18
+MTOOLS_SOURCE        = mtools-$(MTOOLS_VERSION).tar.bz2
+MTOOLS_SITE          = $(BR2_GNU_MIRROR)/mtools/
+MTOOLS_LICENSE       = GPLv3+
+MTOOLS_LICENSE_FILES = COPYING
+
+MTOOLS_CONF_OPT = --enable-xdf        \
+                  --enable-vold       \
+                  --enable-new-vold
+
+$(eval $(host-autotools-package))
