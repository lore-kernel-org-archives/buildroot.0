From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:46:05 +0200
Subject: [Buildroot] [PATCH 40/50 v2] package/busybox: invert dependency
 with dos2unix
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <c3e0d20d2ae2f27547f89b22cefef41ea7879fba.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk   | 1 +
 package/dos2unix/dos2unix.mk | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 166d187081..e50ca1447d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_DOS2UNIX),dos2unix) \
 	$(if $(BR2_PACKAGE_E2FSPROGS),e2fsprogs) \
 	$(if $(BR2_PACKAGE_FBSET),fbset) \
 	$(if $(BR2_PACKAGE_GAWK),gawk) \
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 5001397f05..0522ad1671 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -8,9 +8,7 @@ DOS2UNIX_VERSION = 7.4.0
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-DOS2UNIX_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_BUSYBOX),busybox) \
-	$(TARGET_NLS_DEPENDENCIES)
+DOS2UNIX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 DOS2UNIX_MAKE_OPTS += ENABLE_NLS=1
-- 
2.14.1
