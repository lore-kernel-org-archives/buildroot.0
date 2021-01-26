From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 17:35:05 +0100
Subject: [Buildroot] [git commit] package/xerces: drop cmake workaround
Message-ID: <20210126164409.C6AF081620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ec7cbd7d197c26fb99f7a1d1cd010afb33814f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xerces/xerces.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index d9174b44c7..a3e5361b2e 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -19,11 +19,6 @@ endef
 
 XERCES_POST_PATCH_HOOKS += XERCES_DISABLE_SAMPLES
 
-# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
-# disable a try_run() call in the FindThreads tests, which caused a
-# build failure when cross-compiling.
-XERCES_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 ifeq ($(BR2_PACKAGE_ICU),y)
 XERCES_DEPENDENCIES += icu
 endif
