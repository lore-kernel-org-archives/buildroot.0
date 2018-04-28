From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Apr 2018 22:00:43 +0200
Subject: [Buildroot] [PATCH 1/1] libcrossguid: bump to version 0.2.2
Message-ID: <20180428200043.2509-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Add hash for license file
 - guid.cpp and guid.h have been renamed Guid.cpp and Guid.hpp (they
will be renamed back to guid.cpp and guid.hpp in next release)
 - Continue to use package-generic infrastructure as cmake doesn't work
   properly with this version. Commit such as https://github.com/graeme-hill/crossguid/commit/974def4e0ad62b8fea17d6dee7c4f9b0d65eaa2c is needed. Migration on cmake should be done in next package release.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcrossguid/libcrossguid.hash | 3 ++-
 package/libcrossguid/libcrossguid.mk   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libcrossguid/libcrossguid.hash b/package/libcrossguid/libcrossguid.hash
index a991da56a0..08791947ce 100644
--- a/package/libcrossguid/libcrossguid.hash
+++ b/package/libcrossguid/libcrossguid.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 022c9f02cc36e865cd8fd0111a597ff2bd91988deeb348dbe2aba64aed1abd99  libcrossguid-8f399e8bd4252be9952f3dfa8199924cc8487ca4.tar.gz
+sha256 48321928473c682b0cdc7e17bbd3390f79f4b98ab22fef3b81a852dda81fd195  libcrossguid-v0.2.2.tar.gz
+sha256 779e58787f966a1552f68d5ec041513cef68785dae4a519dbda7bc0b86eda20e  LICENSE
diff --git a/package/libcrossguid/libcrossguid.mk b/package/libcrossguid/libcrossguid.mk
index 46d9a9dcc6..46daaec206 100644
--- a/package/libcrossguid/libcrossguid.mk
+++ b/package/libcrossguid/libcrossguid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCROSSGUID_VERSION = 8f399e8bd4252be9952f3dfa8199924cc8487ca4
+LIBCROSSGUID_VERSION = v0.2.2
 LIBCROSSGUID_SITE = $(call github,graeme-hill,crossguid,$(LIBCROSSGUID_VERSION))
 LIBCROSSGUID_LICENSE = MIT
 LIBCROSSGUID_LICENSE_FILES = LICENSE
@@ -15,14 +15,14 @@ LIBCROSSGUID_DEPENDENCIES = util-linux
 
 define LIBCROSSGUID_BUILD_CMDS
 	(cd $(@D); $(TARGET_CXX) $(TARGET_CXXFLAGS) -std=c++11 -DGUID_LIBUUID \
-		-c guid.cpp -o guid.o)
+		-c Guid.cpp -o guid.o)
 	(cd $(@D); $(TARGET_AR) rvs libcrossguid.a guid.o)
 endef
 
 define LIBCROSSGUID_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 644 $(@D)/libcrossguid.a \
 		$(STAGING_DIR)/usr/lib/libcrossguid.a
-	$(INSTALL) -D -m 644 $(@D)/guid.h $(STAGING_DIR)/usr/include/guid.h
+	$(INSTALL) -D -m 644 $(@D)/Guid.hpp $(STAGING_DIR)/usr/include/guid.h
 endef
 
 $(eval $(generic-package))
-- 
2.14.1
