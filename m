From: Damjan Marion <damjan.marion@gmail.com>
Date: Mon, 28 Nov 2016 11:32:31 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: bump version to v4.1-2345
	and fix version reporting
Message-ID: <20161128103231.21626-1-damjan.marion@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tvheadedend tracks version information based on git version
numbers. As tvheadend is downloaded as tarball form github
it was reporting version 0.0.0~unknown.

Signed-off-by: Damjan Marion <damjan.marion@gmail.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index ca10dc3..53cbccc 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 71dd3d8efa32d592342ff6955cc2cd317f07e74d2d546977eb9bc45136dd5de6  tvheadend-50a370707aedf5c127e92bb517c378aa8ac04657.tar.gz
+sha256 9af13b3e0381fa1f229eaf06acd8ad0d92013c2004a8005f1c66e56cd6d3a4d1  tvheadend-v4.1-2345-g04ff649.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index a3afec8..ad5d72d 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
+TVHEADEND_VERSION = v4.1-2345-g04ff649
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -88,6 +88,7 @@ define TVHEADEND_CONFIGURE_CMDS
 endef
 
 define TVHEADEND_BUILD_CMDS
+	@echo $(TVHEADEND_VERSION) > $(@D)/rpm/version
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
-- 
2.9.3
