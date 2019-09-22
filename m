From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:22 +0200
Subject: [Buildroot] [PATCH 06/30] package/libsemanage: drop dependency on
 ustr
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since SELinux 2.7 (upstream commit
920ee9ee18024c7714f1121e91854f38fa1eef73), ustr is no longer used by
libsemanage.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsemanage/Config.in      | 1 -
 package/libsemanage/libsemanage.mk | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 7ee9c38606..ad3555aee0 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_LIBSEMANAGE
 	depends on !BR2_arc
 	select BR2_PACKAGE_AUDIT
 	select BR2_PACKAGE_LIBSELINUX
-	select BR2_PACKAGE_USTR
 	select BR2_PACKAGE_BZIP2
 	help
 	  libsemanage is the policy management library. It uses
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index a139ad0a68..9a4ddc1a4d 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -8,7 +8,7 @@ LIBSEMANAGE_VERSION = 2.9
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
-LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2
+LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux bzip2
 LIBSEMANAGE_INSTALL_STAGING = YES
 
 LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
@@ -26,7 +26,7 @@ define LIBSEMANAGE_INSTALL_TARGET_CMDS
 endef
 
 HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libselinux \
-				host-ustr host-bzip2 host-swig
+				host-bzip2 host-swig
 
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	$(HOST_CONFIGURE_OPTS) \
-- 
2.21.0
