From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 May 2019 22:44:03 +0200
Subject: [Buildroot] [git commit] package/bullet: extras needs NPTL
Message-ID: <20190509203847.BD70388DC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81fa9080c18d8f3f6278a874d1df2746f081ce5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/9c6325e6cc86116d1e8c940e0fcfe94243faa6de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bullet/bullet.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 7ff8195c85..36aaa157e1 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -16,8 +16,8 @@ BULLET_CONF_OPTS = -DBUILD_UNIT_TESTS=OFF \
 	-DBUILD_BULLET2_DEMOS=OFF \
 	-DBUILD_BULLET3=OFF
 
-# extras needs dlfcn.h and threads
-ifeq ($(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_HAS_THREADS),:y)
+# extras needs dlfcn.h and NPTL (pthread_barrier_init)
+ifeq ($(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),:y)
 BULLET_CONF_OPTS += -DBUILD_EXTRAS=ON
 else
 BULLET_CONF_OPTS += -DBUILD_EXTRAS=OFF
