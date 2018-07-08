From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:05 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 gawk
Message-ID: <20180708110811.1A4B5863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f9d14bb756bbda6445da69e2810e1b7d266ca79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 1 +
 package/gawk/gawk.mk       | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f614576de7..aac31fdba7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_GAWK),gawk) \
 	$(if $(BR2_PACKAGE_GREP),grep) \
 	$(if $(BR2_PACKAGE_GZIP),gzip) \
 	$(if $(BR2_PACKAGE_I2C_TOOLS),i2c-tools) \
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 0779736882..1315abb9ee 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -11,11 +11,6 @@ GAWK_DEPENDENCIES = host-gawk
 GAWK_LICENSE = GPL-3.0+
 GAWK_LICENSE_FILES = COPYING
 
-# Prefer full-blown gawk over busybox awk
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-GAWK_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
 GAWK_DEPENDENCIES += libsigsegv
 endif
