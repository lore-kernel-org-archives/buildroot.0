From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 30 May 2019 23:30:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/i2pd: fix static build with atomic
Message-ID: <20190530213022.3878-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use CMAKE_REQUIRED_LIBRARIES otherwise -latomic won't be at the end of
the line

Fixes:
 - http://autobuild.buildroot.org/results/9dd1c34917d4c67bdf4b1aaff3e9c087c8149f6f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/i2pd/i2pd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 5fa815c21d..9755752c02 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -22,7 +22,7 @@ I2PD_CONF_OPTS += -DWITH_GUI=OFF
 I2PD_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-I2PD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+I2PD_CONF_OPTS += -DCMAKE_REQUIRED_LIBRARIES=-latomic
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.20.1
