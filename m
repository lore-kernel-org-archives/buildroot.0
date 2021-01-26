From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 17:35:02 +0100
Subject: [Buildroot] [git commit] package/i2pd: drop cmake workaround
Message-ID: <20210126164409.A27078175F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77c849c3fc9b69f966e6a2bdd8999ff5df1c4d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/i2pd/i2pd.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 1371e708b9..ef6a467d71 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -16,11 +16,6 @@ I2PD_DEPENDENCIES = \
 
 I2PD_CONF_OPTS += -DWITH_GUI=OFF
 
-# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
-# disable a try_run() call in the FindThreads tests, which caused a
-# build failure when cross-compiling.
-I2PD_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 I2PD_CONF_OPTS += \
 	-DHAVE_CXX_ATOMICS_WITHOUT_LIB=OFF \
