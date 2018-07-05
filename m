From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  6 Jul 2018 00:11:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/minetest-game: bump to version 4.17
In-Reply-To: <20180705221108.6684-1-romain.naour@gmail.com>
References: <20180705221108.6684-1-romain.naour@gmail.com>
Message-ID: <20180705221108.6684-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patch.

Update license hash for mods/default/license.txt
(Book textures updated)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...lt-Revert-Default-Shorter-and-better-ABMs.patch | 54 ----------------------
 package/minetest-game/minetest-game.hash           |  4 +-
 package/minetest-game/minetest-game.mk             |  2 +-
 3 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 package/minetest-game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch

diff --git a/package/minetest-game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch b/package/minetest-game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch
deleted file mode 100644
index e484e50a01..0000000000
--- a/package/minetest-game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 626cd8e9c7c2a5d5c907a12abbaa6066b6d5f2ff Mon Sep 17 00:00:00 2001
-From: "vorunbekannt75 at web.de" <vorunbekannt75@web.de>
-Date: Tue, 6 Jun 2017 19:20:58 +0200
-Subject: [PATCH] Default: Revert "Default: Shorter and better ABMs"
-
-This reverts commit e523c3a2965afe76b9102b67992e15fafba1594a to re-enable
-the overriding and redefinition of these global functions.
-
-[Romain backport from upstream]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- mods/default/functions.lua | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/mods/default/functions.lua b/mods/default/functions.lua
-index 5dc22ca..327e0c8 100644
---- a/mods/default/functions.lua
-+++ b/mods/default/functions.lua
-@@ -139,7 +139,9 @@ if minetest.settings:get_bool("enable_lavacooling") ~= false then
- 		interval = 1,
- 		chance = 2,
- 		catch_up = false,
--		action = default.cool_lava,
-+		action = function(...)
-+			default.cool_lava(...)
-+		end,
- 	})
- end
- 
-@@ -222,7 +224,9 @@ minetest.register_abm({
- 	neighbors = {"group:sand"},
- 	interval = 12,
- 	chance = 83,
--	action = default.grow_cactus
-+	action = function(...)
-+		default.grow_cactus(...)
-+	end
- })
- 
- minetest.register_abm({
-@@ -231,7 +235,9 @@ minetest.register_abm({
- 	neighbors = {"default:dirt", "default:dirt_with_grass"},
- 	interval = 14,
- 	chance = 71,
--	action = default.grow_papyrus
-+	action = function(...)
-+		default.grow_papyrus(...)
-+	end
- })
- 
- 
--- 
-2.9.4
-
diff --git a/package/minetest-game/minetest-game.hash b/package/minetest-game/minetest-game.hash
index 1a2fe78a96..52aa10d58f 100644
--- a/package/minetest-game/minetest-game.hash
+++ b/package/minetest-game/minetest-game.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 ea914555949b4faccda5e13143cb021d2f9a5fa19abd1f5e4b7b65004cbd2b5a minetest-game-0.4.16.tar.gz
+sha256 f0ab07cb47c1540b2016bf76a36e2eec28b0ea7827bf66fc5447e0c5e5d4495d minetest-game-0.4.17.tar.gz
 
 sha256 f8a254e8d5f6b3ca3873f990986e86c864f943aa5dc9bf56808c5f4bfa509db0 LICENSE.txt
 sha256 3382f3bf99566089543621ee3256f7f98bf9364d3b852c5ed08202d435215d7d mods/beds/license.txt
@@ -8,7 +8,7 @@ sha256 e642798b595fb41901ae695326da9a167b0bd6b4055edec2396672f5f01bb16c mods/bon
 sha256 baf438bc48b7da1b8fc03d37d134473e1c1f33ffe2e926fa650e6d0c64872785 mods/bucket/license.txt
 sha256 6196d390ee0b6331766219aa82f31613fffb62476c03cf960190ab8c232b8822 mods/carts/license.txt
 sha256 c0eca35bf446b1b9c8a0d1eefa0613bf2996187cd1f9382e7424b3d0b0dd7851 mods/creative/license.txt
-sha256 0542a1ff8212197bf350b6135fb4d29f8a2341d9ddc1407ec812d7fb609a5c0f mods/default/license.txt
+sha256 6972a14d2cea9362cda1293284c5a472b1912056e2da215ce43e9c54c80da334 mods/default/license.txt
 sha256 c0c652890fc80af8eefedbcfe1cd0d16b13b14cd1c7105c9c2bc9abe8cf1620c mods/doors/license.txt
 sha256 011ebc82e96df3b825777e7531cb5d34cfce1f6ca27b7d3c80793c033d7c4f4e mods/dye/license.txt
 sha256 163ad77a427a21a900a8fe2333dfc82d115e8e799b7e13ca71f6bd47dcf0ec13 mods/farming/license.txt
diff --git a/package/minetest-game/minetest-game.mk b/package/minetest-game/minetest-game.mk
index 2386944a02..bef7a63bb1 100644
--- a/package/minetest-game/minetest-game.mk
+++ b/package/minetest-game/minetest-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_GAME_VERSION = 0.4.16
+MINETEST_GAME_VERSION = 0.4.17
 MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
 MINETEST_GAME_LICENSE = LGPL-2.1+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, \
 	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0 (mods)
-- 
2.14.4
