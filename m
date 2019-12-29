From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 10:59:23 +0100
Subject: [Buildroot] [git commit] package/i2pd: fix static build with atomic
Message-ID: <20191229100917.770AB8E69C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea0ae0e3336d84d7073a10ef37d73c9ed0a99bbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use HAVE_CXX_ATOMICS_WITHOUT_LIB and HAVE_CXX_ATOMICS64_WITHOUT_LIB
variables to tell i2pd to check for atomic library and add it in
$(REQUIRED_LIBRARIES) if needed

Fixes:
 - http://autobuild.buildroot.org/results/dfffe21fab65b3fc81f449004a6771fd00efbc57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/i2pd/i2pd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index de975d66a4..a064057f1f 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -22,7 +22,9 @@ I2PD_CONF_OPTS += -DWITH_GUI=OFF
 I2PD_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-I2PD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+I2PD_CONF_OPTS += \
+	-DHAVE_CXX_ATOMICS_WITHOUT_LIB=OFF \
+	-DHAVE_CXX_ATOMICS64_WITHOUT_LIB=OFF
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
