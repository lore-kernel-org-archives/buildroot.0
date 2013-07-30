From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 23:36:36 +0200
Subject: [Buildroot] [git commit] util-linux: only needs gettext if locale
	is selected
Message-ID: <20130730213928.1C1EB9AEBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da8860e4da533bbe3d684354b37174adb0e23b98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add missing select in Config.in.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in     |    1 +
 package/util-linux/util-linux.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 799833e..e63814f 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Various useful/essential linux libraries and utilities.
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d8a4e6f..c6c8467 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -35,7 +35,7 @@ else
 UTIL_LINUX_CONF_OPT += --without-ncurses
 endif
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 UTIL_LINUX_DEPENDENCIES += gettext
 UTIL_LINUX_MAKE_OPT += LIBS=-lintl
 endif
