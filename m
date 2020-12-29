From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 23:04:02 +0100
Subject: [Buildroot] [git commit] package/minetest{-game}: bump to version
 5.3.0
Message-ID: <20201229214633.4550C837EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=004383d6868531baa78baf06d8ea88b84016c56d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See Changelog [1]

Disable unittests build with the new BUILD_UNITTESTS option.

Update minetest-game licence file hash for:
  mods/default/license.txt [2]
  mods/farming/license.txt [3]

Update minetest license file hash for:
  LICENSE.txt [4]

[1] https://dev.minetest.net/Changelog#5.2.0_.E2.86.92_5.3.0
[2] https://github.com/minetest/minetest_game/commit/0662f962842b071525fa00ce970d8cc645bd68a4
[3] https://github.com/minetest/minetest_game/commit/e5a7af1c4abaf06ad764bf7c5da058fd136871c0
[4] https://github.com/minetest/minetest/commit/9a64a9fd9427fc3b62d4dc9bf1ca7c15477ebc5a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minetest-game/minetest-game.hash | 6 +++---
 package/minetest-game/minetest-game.mk   | 2 +-
 package/minetest/minetest.hash           | 4 ++--
 package/minetest/minetest.mk             | 5 +++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/minetest-game/minetest-game.hash b/package/minetest-game/minetest-game.hash
index 5bf65bc510..1d22b62fc8 100644
--- a/package/minetest-game/minetest-game.hash
+++ b/package/minetest-game/minetest-game.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0c49fd6e310de1aba2e8cb8ae72efe0e06bb6bc8d7c5efea23bc201b6a80ce94  minetest-game-5.2.0.tar.gz
+sha256  06c6c1d4b97af211dd0fa518a3e68a205f594e9816a4b2477e48d4d21d278e2d  minetest-game-5.3.0.tar.gz
 
 sha256  f8a254e8d5f6b3ca3873f990986e86c864f943aa5dc9bf56808c5f4bfa509db0  LICENSE.txt
 sha256  ed2afed388c470e08edc1104e4ff6d12b68a32a76b8c52d760a99d4d2d7716f3  mods/beds/license.txt
@@ -10,12 +10,12 @@ sha256  baf438bc48b7da1b8fc03d37d134473e1c1f33ffe2e926fa650e6d0c64872785  mods/b
 sha256  01370a00e7b2157a07ee21fa4dac9cc108c7449442f612a3e55cfe18b5b03c2b  mods/butterflies/license.txt
 sha256  6196d390ee0b6331766219aa82f31613fffb62476c03cf960190ab8c232b8822  mods/carts/license.txt
 sha256  b6c3aca8da2f6c272fe431740dda0a349cff419f1f72e55c6de677379fc04169  mods/creative/license.txt
-sha256  66f93a58a7418b86f2ca54e8de931f5c38d9f3e07d407c2c095b632fcda72956  mods/default/license.txt
+sha256  f78424e0872260d3f3af98e74faf1bbe6b9387cd5464b7ae931d1fc1cc93223c  mods/default/license.txt
 sha256  c0c652890fc80af8eefedbcfe1cd0d16b13b14cd1c7105c9c2bc9abe8cf1620c  mods/doors/license.txt
 sha256  33d0b8726dd27c8f0c96d6dfd611e0e980bbdbb8075fac7476d055518319ec1c  mods/dungeon_loot/license.txt
 sha256  011ebc82e96df3b825777e7531cb5d34cfce1f6ca27b7d3c80793c033d7c4f4e  mods/dye/license.txt
 sha256  29a05b102726b9a3115f7ec06d5188dac7b1c005d8cf1c4d6dc2d5544405a45c  mods/env_sounds/license.txt
-sha256  163ad77a427a21a900a8fe2333dfc82d115e8e799b7e13ca71f6bd47dcf0ec13  mods/farming/license.txt
+sha256  bdb104cdbe72a27407ade35144a8d1d52dd60c3ca626b5a87555b9d5d5c8af98  mods/farming/license.txt
 sha256  61f826be9adee70ef0e37f3bf4891fecc4b027a21637b32981b98220723d6f37  mods/fire/license.txt
 sha256  01370a00e7b2157a07ee21fa4dac9cc108c7449442f612a3e55cfe18b5b03c2b  mods/fireflies/license.txt
 sha256  d92ac36a0235f4c02f8cfe2137d7d632bd53374c44ead97f20c152dddf475837  mods/flowers/license.txt
diff --git a/package/minetest-game/minetest-game.mk b/package/minetest-game/minetest-game.mk
index 38f46a398a..7f1927b78e 100644
--- a/package/minetest-game/minetest-game.mk
+++ b/package/minetest-game/minetest-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_GAME_VERSION = 5.2.0
+MINETEST_GAME_VERSION = 5.3.0
 MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
 MINETEST_GAME_LICENSE = LGPL-2.1+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, \
 	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0 (mods)
diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
index 626f56a31c..3459c9d1a5 100644
--- a/package/minetest/minetest.hash
+++ b/package/minetest/minetest.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4996c7c50a6600d0c7140680d4bd995cb9aae910f216b46373953b49d6b13a5d  minetest-5.2.0.tar.gz
+sha256  65dc2049f24c93fa544500f310a61e289c1b8fa47bf60877b746a2c27a7238d6  minetest-5.3.0.tar.gz
 
-sha256  03ec12b2ba71d5e31c37bcf2700af2f278141df62e5a2ac0ce056c53bf266e44  LICENSE.txt
+sha256  d2a488e385226c5b865219c6acc2aa98ba2e01e74dd0ac9dd8c0663bbbe31eb1  LICENSE.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index e8fe5b45ce..d120353a5f 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_VERSION = 5.2.0
+MINETEST_VERSION = 5.3.0
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
 MINETEST_LICENSE_FILES = LICENSE.txt
@@ -18,7 +18,8 @@ MINETEST_CONF_OPTS = \
 	-DENABLE_CURSES=OFF \
 	-DAPPLY_LOCALE_BLACKLIST=OFF \
 	-DENABLE_SYSTEM_GMP=ON \
-	-DENABLE_SYSTEM_JSONCPP=ON
+	-DENABLE_SYSTEM_JSONCPP=ON \
+	-DBUILD_UNITTESTS=OFF
 
 ifeq ($(BR2_PACKAGE_MINETEST_CLIENT),y)
 MINETEST_DEPENDENCIES += bzip2 jpeg libgl libpng xlib_libXxf86vm
