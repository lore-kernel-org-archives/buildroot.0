From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 17:35:01 +0100
Subject: [Buildroot] [git commit] package/znc: drop cmake workaround
Message-ID: <20210126164409.8E6EE81620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd3af0a2d20da82d2a5b83c34a3d6b8e36d1217a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/znc/znc.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 52a8d78aeb..07fced8407 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -12,11 +12,6 @@ ZNC_CPE_ID_VENDOR = znc
 ZNC_DEPENDENCIES = host-pkgconf
 ZNC_CONF_OPTS = -DWANT_CYRUS=OFF -DWANT_I18N=OFF -DWANT_PERL=OFF
 
-# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
-# disable a try_run() call in the FindThreads tests, which caused a
-# build failure when cross-compiling.
-ZNC_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 ifeq ($(BR2_PACKAGE_ICU),y)
 ZNC_DEPENDENCIES += icu
 ZNC_CONF_OPTS += -DWANT_ICU=ON
