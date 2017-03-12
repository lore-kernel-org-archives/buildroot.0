From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 10:58:18 +0100
Subject: [Buildroot] [PATCH 4/4] package/nbd: bump version
In-Reply-To: <cover.1489312674.git.yann.morin.1998@free.fr>
References: <cover.1489312674.git.yann.morin.1998@free.fr>
Message-ID: <c28462eeaf3b9878658983caee9c14cfa56ccd97.1489312674.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nbd uses fork and threads, so remove the comment about the dependency:
it is not inherited from glib2 anymore (it has not been for a while in
fact).

The dependency on wchar is also a requirement for nbd, because configure
needs wchar to test for C99.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nbd/Config.in | 6 +++---
 package/nbd/nbd.hash  | 4 ++--
 package/nbd/nbd.mk    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index afe8ad4..ad9fb5c 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_NBD
 	bool "nbd"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  NBD is a set of utilities to configure network block devices,
diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index c90682f..03234fd 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/nbd/files/nbd/3.13/
-md5	784be37497cc2f9a53c67c8c77d1676d	nbd-3.13.tar.xz
-sha1	e43674a2d2b42d20719cba3149748e8f5683e554	nbd-3.13.tar.xz
+md5	f52a4ef8979d81e6c15a745236582fdf	nbd-3.15.2.tar.xz
+sha1	c8248dd76641a31189735407cd4d55fe63969c08	nbd-3.15.2.tar.xz
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 42200ee..7eeadec 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.13
+NBD_VERSION = 3.15.2
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-- 
2.7.4
