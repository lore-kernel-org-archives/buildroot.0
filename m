From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:41 +0200
Subject: [Buildroot] [PATCH 07/50] package/busybox: invert dependency with
 unzip
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <56a9b021bb173f3007e1d9b1b473173476ca3843.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/unzip/unzip.mk     | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 4e33ac232f..16f69cc902 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 7d48d25309..cff5951ac0 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -7,8 +7,6 @@
 UNZIP_VERSION = 60
 UNZIP_SOURCE = unzip$(UNZIP_VERSION).tgz
 UNZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
-# take precedence over busybox implementation
-UNZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 
-- 
2.14.1
