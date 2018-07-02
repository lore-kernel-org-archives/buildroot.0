From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:15 +0200
Subject: [Buildroot] [PATCH 41/50] package/busybox: invert dependency with
 diffutils
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <049a633533ddc3075cfd81d6cf3be1ed837d0dd0.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk     | 1 +
 package/diffutils/diffutils.mk | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f6aca9468d..4f48033a5d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_DIFFUTILS),diffutils) \
 	$(if $(BR2_PACKAGE_DOS2UNIX),dos2unix) \
 	$(if $(BR2_PACKAGE_E2FSPROGS),e2fsprogs) \
 	$(if $(BR2_PACKAGE_FBSET),fbset) \
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 79785d6f01..9a41c985df 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -17,8 +17,4 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 DIFFUTILS_CONF_ENV += gl_cv_func_getopt_gnu=yes
 endif
 
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-DIFFUTILS_DEPENDENCIES += busybox
-endif
-
 $(eval $(autotools-package))
-- 
2.14.1
