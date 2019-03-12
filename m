From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 21:53:49 +0100
Subject: [Buildroot] [git commit] package/minetest: bump to version 5.0.0
Message-ID: <20190312205115.499928ECA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70fb634c8d71bc70547db3086401a6e545a4ecb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"5.0.0 is a breaking release and not compatible to the 0.4 series", so
update minetest-game package in the same commit.

Update GCC dependency to 4.9+.

Use LICENSE.txt as license file instead of the README.md.

Update license files hash for minetest-game after checking what's changed.
Add new license files for minetest-game.

https://forum.minetest.net/viewtopic.php?t=22278

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minetest-game/minetest-game.hash | 21 ++++++++++++++-------
 package/minetest-game/minetest-game.mk   |  9 ++++++++-
 package/minetest/Config.in               |  8 ++++----
 package/minetest/minetest.hash           |  4 ++--
 package/minetest/minetest.mk             |  4 ++--
 5 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/package/minetest-game/minetest-game.hash b/package/minetest-game/minetest-game.hash
index 52aa10d58f..4299df26c2 100644
--- a/package/minetest-game/minetest-game.hash
+++ b/package/minetest-game/minetest-game.hash
@@ -1,24 +1,31 @@
 # Locally calculated
-sha256 f0ab07cb47c1540b2016bf76a36e2eec28b0ea7827bf66fc5447e0c5e5d4495d minetest-game-0.4.17.tar.gz
+sha256 83688d802f9d8308acf6f95e6845cdbe1ee1bc088a963a30f94cf72ec7265cf8 minetest-game-5.0.0.tar.gz
 
 sha256 f8a254e8d5f6b3ca3873f990986e86c864f943aa5dc9bf56808c5f4bfa509db0 LICENSE.txt
-sha256 3382f3bf99566089543621ee3256f7f98bf9364d3b852c5ed08202d435215d7d mods/beds/license.txt
+sha256 ed2afed388c470e08edc1104e4ff6d12b68a32a76b8c52d760a99d4d2d7716f3 mods/beds/license.txt
+sha256 559749ba0d269b768e1b85bdac0f8b7a0cf100ecb3edd0df8529fe57cd4bfc0d mods/binoculars/license.txt
 sha256 9e9dbe5236ba70d0337f9879b988c19c6a7b0c902eed202f775200b8bee6980d mods/boats/license.txt
 sha256 e642798b595fb41901ae695326da9a167b0bd6b4055edec2396672f5f01bb16c mods/bones/license.txt
 sha256 baf438bc48b7da1b8fc03d37d134473e1c1f33ffe2e926fa650e6d0c64872785 mods/bucket/license.txt
+sha256 01370a00e7b2157a07ee21fa4dac9cc108c7449442f612a3e55cfe18b5b03c2b mods/butterflies/license.txt
 sha256 6196d390ee0b6331766219aa82f31613fffb62476c03cf960190ab8c232b8822 mods/carts/license.txt
-sha256 c0eca35bf446b1b9c8a0d1eefa0613bf2996187cd1f9382e7424b3d0b0dd7851 mods/creative/license.txt
-sha256 6972a14d2cea9362cda1293284c5a472b1912056e2da215ce43e9c54c80da334 mods/default/license.txt
+sha256 b6c3aca8da2f6c272fe431740dda0a349cff419f1f72e55c6de677379fc04169 mods/creative/license.txt
+sha256 66f93a58a7418b86f2ca54e8de931f5c38d9f3e07d407c2c095b632fcda72956 mods/default/license.txt
 sha256 c0c652890fc80af8eefedbcfe1cd0d16b13b14cd1c7105c9c2bc9abe8cf1620c mods/doors/license.txt
+sha256 33d0b8726dd27c8f0c96d6dfd611e0e980bbdbb8075fac7476d055518319ec1c mods/dungeon_loot/license.txt
 sha256 011ebc82e96df3b825777e7531cb5d34cfce1f6ca27b7d3c80793c033d7c4f4e mods/dye/license.txt
 sha256 163ad77a427a21a900a8fe2333dfc82d115e8e799b7e13ca71f6bd47dcf0ec13 mods/farming/license.txt
 sha256 61f826be9adee70ef0e37f3bf4891fecc4b027a21637b32981b98220723d6f37 mods/fire/license.txt
-sha256 a8647ac7609fdaea96bd0ec58ac5837fd17d049fd450008fd7922162979a292e mods/flowers/license.txt
+sha256 d92ac36a0235f4c02f8cfe2137d7d632bd53374c44ead97f20c152dddf475837 mods/flowers/license.txt
+sha256 ffbac006d197fcb8e36e9cdda638053ac80eef4e6446bbe36cb94bd28f54ba0b mods/game_commands/license.txt
 sha256 857f64cd62c13e27f25363584342fe049885b16c6b2392f1ebd7c3a7fb6ca436 mods/give_initial_stuff/license.txt
+sha256 dcbab8d7dc4137789958d19471807b37447fd303bced310d7d76d901eefca8ff mods/map/license.txt
+sha256 8acd4a18781a508f641b9364a0b491fccb0affd4c638b74b215238d0b0ee7b76 mods/player_api/license.txt
 sha256 0066e63d682d54a014ad3359794365a1abb87562d2b1e5e32093976d88c295b4 mods/screwdriver/license.txt
 sha256 b903866d052774e4127952690ce62ca26aa5bc4c2ddd48fceae501fa0d24ed74 mods/sethome/license.txt
-sha256 a82dfda1c9feb704997ea42116eb6a15a1f3f99ee8c49215fbbd32d519e8ad74 mods/stairs/license.txt
-sha256 1d42ffae6bad0da2e76966532f5f759bbeb5adb395ee4bf7bacca1fdfef745a6 mods/tnt/license.txt
+sha256 d74d3e98885a807a1922e3ed2d0af1708b60465a49937f456059e7b9efd4a428 mods/sfinv/license.txt
+sha256 eab4c0cb318bb83c13362047a5a0fc5cb650a4e561ceb5a9124e5a1253cbc21a mods/stairs/license.txt
+sha256 e0c007cf51c9e77e7ec8b1c65400748c45676e5ed05aecdc4a5bc447e7f2820c mods/tnt/license.txt
 sha256 a0814bccd28157a160049efeac03864ff4c4dd6a34bc9cfcd3cc62de66fb156a mods/vessels/license.txt
 sha256 e9ebf1b4b170e64a0ea6e246edd03689aeb859d6560b8372a8081c004b30cb65 mods/walls/license.txt
 sha256 551b19e2c8b18c143301e090a1ceb5dc5d4ca243cad846de179d693439910816 mods/wool/license.txt
diff --git a/package/minetest-game/minetest-game.mk b/package/minetest-game/minetest-game.mk
index bef7a63bb1..05471e6738 100644
--- a/package/minetest-game/minetest-game.mk
+++ b/package/minetest-game/minetest-game.mk
@@ -4,26 +4,33 @@
 #
 ################################################################################
 
-MINETEST_GAME_VERSION = 0.4.17
+MINETEST_GAME_VERSION = 5.0.0
 MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
 MINETEST_GAME_LICENSE = LGPL-2.1+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, \
 	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0 (mods)
 MINETEST_GAME_LICENSE_FILES = LICENSE.txt \
 	mods/beds/license.txt \
+	mods/binoculars/license.txt \
 	mods/boats/license.txt \
 	mods/bones/license.txt \
 	mods/bucket/license.txt \
+	mods/butterflies/license.txt \
 	mods/carts/license.txt \
 	mods/creative/license.txt \
 	mods/default/license.txt \
 	mods/doors/license.txt \
+	mods/dungeon_loot/license.txt \
 	mods/dye/license.txt \
 	mods/farming/license.txt \
 	mods/fire/license.txt \
 	mods/flowers/license.txt \
+	mods/game_commands/license.txt \
 	mods/give_initial_stuff/license.txt \
+	mods/map/license.txt \
+	mods/player_api/license.txt \
 	mods/screwdriver/license.txt \
 	mods/sethome/license.txt \
+	mods/sfinv/license.txt \
 	mods/stairs/license.txt \
 	mods/tnt/license.txt \
 	mods/vessels/license.txt \
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index 4e8b1d0eef..085525534d 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MINETEST
 	bool "minetest"
 	depends on BR2_INSTALL_LIBSTDCPP # irrlicht
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_XORG7 # irrlicht
 	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
@@ -52,15 +52,15 @@ comment "sound support needs a toolchain w/ threads NPTL"
 
 endif
 
-comment "minetest needs a toolchain w/ C++, gcc >= 4.7, threads"
+comment "minetest needs a toolchain w/ C++, gcc >= 4.9, threads"
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "minetest needs X11 and an OpenGL provider"
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on (BR2_INSTALL_LIBSTDCPP \
-		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		&& BR2_TOOLCHAIN_HAS_THREADS)
 	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
index e8b8bf2fce..f9f92fbb6c 100644
--- a/package/minetest/minetest.hash
+++ b/package/minetest/minetest.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 cd25d40c53f492325edabd2f6397250f40a61cb9fe4a1d4dd6eb030e0d1ceb59  minetest-0.4.17.1.tar.gz
+sha256 1ba816f77dc9dbd5a4995f0c1d482f8f22b9aa75b6d6999dbfd1f3d698363d0a  minetest-5.0.0.tar.gz
 
-sha256 e48121374512b8f2fada00ac1c8e100a767e2a2edd2853557ccf1995e35a4be0  README.txt
+sha256 03ec12b2ba71d5e31c37bcf2700af2f278141df62e5a2ac0ce056c53bf266e44  LICENSE.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index 8b573a0f4f..69bca691e2 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-MINETEST_VERSION = 0.4.17.1
+MINETEST_VERSION = 5.0.0
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
-MINETEST_LICENSE_FILES = README.txt
+MINETEST_LICENSE_FILES = LICENSE.txt
 
 MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
 
