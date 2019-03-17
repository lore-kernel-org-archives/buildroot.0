From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Mar 2019 05:54:26 +0200
Subject: [Buildroot] [PATCH] package/iw: bump to version 5.0.1
Message-ID: <a7e0b39d66f6b5426ef69d0ccbf63d027d1e26b2.1552794866.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop unused GIT_DIR environment.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index 6423df77325c..a85989ece80c 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	f01671c0074bfdec082a884057edba1b9efd35c89eda554638496f03b769ad89	iw-4.14.tar.xz
+sha256	1e38ea794a223525b2ea7fe78fd14f2a56121e62e21ba5f9dbe8c494b35b5c0d	iw-5.0.1.tar.xz
 # Locally calculated
 sha256	5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af	COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 8264e8b5dcc6..858874211171 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 4.14
+IW_VERSION = 5.0.1
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
@@ -12,8 +12,7 @@ IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
 IW_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
-	PKG_CONFIG="$(HOST_DIR)/bin/pkg-config" \
-	GIT_DIR=$(IW_DIR)
+	PKG_CONFIG="$(HOST_DIR)/bin/pkg-config"
 
 define IW_BUILD_CMDS
 	$(IW_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-- 
2.20.1
