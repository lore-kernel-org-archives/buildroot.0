From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 21:57:04 +0200
Subject: [Buildroot] [git commit] package/piglit: bump version to fix
 compatibility with mesa3d
Message-ID: <20200509194204.955D1911F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9061fd7bf6855431939bdace7e3091d4e1c48e53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch [1].

This version bump contain a patch removing EGL_NO_CONFIG_MESA [2], a
define that no longer exists in recent Mesa versions.

Update indentation of hash file (two spaces).

Fixes:

  http://autobuild.buildroot.net/results/8ede89a673f83896745f90fd51458cac5fe7bb8f

[1] https://gitlab.freedesktop.org/mesa/piglit/-/commit/8417ca1725d523493d8f6782699273dc056888ac
[2] https://gitlab.freedesktop.org/mesa/piglit/-/commit/1fe351e533a1c8b88551b06e6d76e5c2bf8228bc

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-tests-fix-test-build-requiring-gles3.patch | 49 ----------------------
 package/piglit/piglit.hash                         | 10 ++---
 package/piglit/piglit.mk                           |  2 +-
 3 files changed, 6 insertions(+), 55 deletions(-)

diff --git a/package/piglit/0001-tests-fix-test-build-requiring-gles3.patch b/package/piglit/0001-tests-fix-test-build-requiring-gles3.patch
deleted file mode 100644
index 4183f23432..0000000000
--- a/package/piglit/0001-tests-fix-test-build-requiring-gles3.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 8417ca1725d523493d8f6782699273dc056888ac Mon Sep 17 00:00:00 2001
-From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
-Date: Thu, 1 Aug 2019 20:51:55 +0300
-Subject: [PATCH] tests: fix test build requiring gles3
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This should be built only on gles3.
-
-Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
-Reported-by: Krzysztof Raszkowski <krzysztof.raszkowski@intel.com>
-Fixes: ef761094be ("tests: Reproducer for 110796")
-Reviewed-by: Tapani P??lli <tapani.palli@intel.com>
-[Retrieved from:
-https://gitlab.freedesktop.org/mesa/piglit/commit/8417ca1725d523493d8f6782699273dc056888ac]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tests/shaders/CMakeLists.gl.txt    | 1 -
- tests/shaders/CMakeLists.gles3.txt | 1 +
- 2 files changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/shaders/CMakeLists.gl.txt b/tests/shaders/CMakeLists.gl.txt
-index f1512f9cf..a299001cb 100644
---- a/tests/shaders/CMakeLists.gl.txt
-+++ b/tests/shaders/CMakeLists.gl.txt
-@@ -43,7 +43,6 @@ IF (UNIX)
- ENDIF (UNIX)
- piglit_add_executable (glsl-arb-fragment-coord-conventions glsl-arb-fragment-coord-conventions.c)
- piglit_add_executable (glsl-bindattriblocation glsl-bindattriblocation.c)
--piglit_add_executable (glsl-bug-110796 glsl-bug-110796.c)
- piglit_add_executable (glsl-bug-22603 glsl-bug-22603.c)
- piglit_add_executable (glsl-dlist-getattriblocation glsl-dlist-getattriblocation.c)
- piglit_add_executable (glsl-explicit-location-01 glsl-explicit-location-01.c)
-diff --git a/tests/shaders/CMakeLists.gles3.txt b/tests/shaders/CMakeLists.gles3.txt
-index 18b8c3534..c8ccfad42 100644
---- a/tests/shaders/CMakeLists.gles3.txt
-+++ b/tests/shaders/CMakeLists.gles3.txt
-@@ -3,6 +3,7 @@ link_libraries(
- )
- 
- piglit_add_executable (built-in-constants_${piglit_target_api} built-in-constants.c parser_utils.c)
-+piglit_add_executable (glsl-bug-110796 glsl-bug-110796.c)
- piglit_add_executable(shader_runner_${piglit_target_api} shader_runner.c parser_utils.c)
- 
- # vim: ft=cmake:
--- 
-2.24.1
-
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 8cfd04f7e0..1a0011850e 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256 4eba46520df1c47b0aea5446c302ff51d52f905a63d1ba29230866fc6c952a2e  piglit-ef761094be04d14e258ad7706e7295f80d4411f2.tar.gz
-sha256 dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
-sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  licences/LGPL-2
+sha256  0d42dc46295a6b3ecfeb379887bd78128ce7938242ae56d58d5e9b3dea8c98b6  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0.tar.gz
+sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  licences/LGPL-2
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index d4753b9f7a..4d17405d10 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = ef761094be04d14e258ad7706e7295f80d4411f2
+PIGLIT_VERSION = 2affee53f3ad7a96f5b397a2b6d6408af8a374b0
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
