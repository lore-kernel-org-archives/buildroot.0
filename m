From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 22:46:20 +0200
Subject: [Buildroot] [git commit branch/next] package/libdrm: bump version
 to 2.4.102
Message-ID: <20200529202952.A962B91DFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b40393a8a0a465eca682fb7fb7eebe414f7d5157
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patch applied upstream, reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-tests-amdgpu-needs-atomic_ops.patch       | 27 ----------------------
 package/libdrm/libdrm.hash                         |  6 ++---
 package/libdrm/libdrm.mk                           |  2 +-
 3 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/package/libdrm/0003-tests-amdgpu-needs-atomic_ops.patch b/package/libdrm/0003-tests-amdgpu-needs-atomic_ops.patch
deleted file mode 100644
index 9c06675daf..0000000000
--- a/package/libdrm/0003-tests-amdgpu-needs-atomic_ops.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f0adb08424e624aeee340291343281256b7a98e8 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 7 Mar 2020 12:23:09 +0100
-Subject: [PATCH] tests/amdgpu: needs atomic_ops
-
-[Upstream: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/50]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- tests/amdgpu/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
-index 1726cb43..4dfa5c83 100644
---- a/tests/amdgpu/meson.build
-+++ b/tests/amdgpu/meson.build
-@@ -26,7 +26,7 @@ if dep_cunit.found()
-       'vce_tests.c', 'uvd_enc_tests.c', 'vcn_tests.c', 'deadlock_tests.c',
-       'vm_tests.c', 'ras_tests.c', 'syncobj_tests.c',
-     ),
--    dependencies : [dep_cunit, dep_threads],
-+    dependencies : [dep_cunit, dep_threads, dep_atomic_ops],
-     include_directories : [inc_root, inc_drm, include_directories('../../amdgpu')],
-     link_with : [libdrm, libdrm_amdgpu],
-     install : with_install_tests,
--- 
-2.25.1
-
diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 4c9c4c4fed..72330165d8 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,3 +1,3 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2020-April/261067.html
-sha256 ddf31baa8e49473624860bd166ce654dc349873f7a6c7b3305964249315c78a7  libdrm-2.4.101.tar.xz
-sha512 658cfc6f478b674b77b4613e1af9ce8f4fd2ace8a18e75729de254d14b7c1f5d67d4bfdb58744aea74abca0f6521326225f4156bd5cbeeed79ca3e025f657e8c  libdrm-2.4.101.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2020-May/267255.html
+sha256  8bcbf9336c28e393d76c1f16d7e79e394a7fce8a2e929d52d3ad7ad8525ba05b  libdrm-2.4.102.tar.xz
+sha512  386afd228efd809fe32776a6ff5d9dd95d1409a6a6a89b3806a3b42ed27e84f1e090f3b7834973f834d6b0d1342b7034447fe8690d072f85f03292d7795c3e0c  libdrm-2.4.102.tar.xz
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 4217fcc84c..9348b83295 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.101
+LIBDRM_VERSION = 2.4.102
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
