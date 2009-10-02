From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Oct 2009 10:24:54 +0200
Subject: [Buildroot] [git commit master] python: cleanup
Message-ID: <20091002082528.E4F5877756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7c5ee544ef61b456676ac58b7eeda56deedc470
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/python.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index e6f11f7..b65869d 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -10,7 +10,7 @@ PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_DIR:=$(BUILD_DIR)/Python-$(PYTHON_VERSION)
 PYTHON_CAT:=$(BZCAT)
 PYTHON_BINARY:=python
-PYTHON_TARGET_BINARY:=usr/bin/python
+PYTHON_TARGET_BINARY:=usr/bin/python$(PYTHON_VERSION_MAJOR)
 PYTHON_DEPS:=
 PYTHON_SITE_PACKAGE_DIR=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
@@ -165,6 +165,7 @@ endif
 ifneq ($(BR2_PACKAGE_PYTHON_TKINTER),y)
 	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/lib-tk
 endif
+	touch -c $@
 
 python: $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
 
@@ -185,7 +186,7 @@ LIBPYTHON_BINARY:=libpython$(PYTHON_VERSION_MAJOR).so
 libpython:	python $(TARGET_DIR)/usr/lib/$(LIBPYTHON_BINARY)
 
 
-$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so: $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
+$(STAGING_DIR)/usr/lib/$(LIBPYTHON_BINARY): $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
 		cp -dpr $(PYTHON_DIR)/$(LIBPYTHON_BINARY).* $(STAGING_DIR)/usr/lib
 		(\
 		cd $(STAGING_DIR)/usr/lib ; \
-- 
1.6.3.3
