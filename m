From: Daniel Nicoletti <dantti12@gmail.com>
Date: Wed,  1 Aug 2018 08:47:38 -0300
Subject: [Buildroot] [PATCH] package/cutelyst: Fix build dependencies
Message-ID: <20180801114738.5044-1-dantti12@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing optional dependencies need when
the dependency was available, disabling Grantlee
plugin for now as it failed to build.

Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
---
 package/cutelyst/cutelyst.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index 438ac091c6..2d1c9b1532 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -15,20 +15,16 @@ CUTELYST_DEPENDENCIES = qt5base
 CUTELYST_CONF_OPTS += \
 	-DPLUGIN_CSRFPROTECTION=ON
 
-ifeq ($(BR2_PACKAGE_GRANTLEE),y)
-CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=ON
-else
-CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_LIBPWQUALITY),y)
 CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=ON
+CUTELYST_DEPENDENCIES += libpwquality
 else
 CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_JEMALLOC),y)
 CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=ON
+CUTELYST_DEPENDENCIES += jemalloc
 else
 CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=OFF
 endif
-- 
2.17.1
