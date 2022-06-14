Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8EFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76AD6400A8;
	Tue, 14 Jun 2022 18:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jbbmgncnKeQ; Tue, 14 Jun 2022 18:51:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2742B405B5;
	Tue, 14 Jun 2022 18:51:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 204F81BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 801C340A02
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBQcDmhC7Qqk for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8B8440893
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D6966870DF; Tue, 14 Jun 2022 18:36:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:33:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ddfece7f7e5b10a5da89f2c462616d5deb5b1ec
X-Git-Newrev: f26f32882ed90401863646927fd24a236156f846
X-Patchwork-Hint: ignore
Message-Id: <20220614183634.D6966870DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minetest{-game}: bump to version
 5.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2438447802886226000=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2438447802886226000==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f26f32882ed90401863646927fd24a236156f846
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release announcement:
5.5.0: https://forum.minetest.net/viewtopic.php?f=18&t=27754
5.1.1: https://forum.minetest.net/viewtopic.php?p=410344#p410344

Back in 2021, the minetest project forked the irrlicht library due to
lack of upstream release [1]. But the irrlicht upstream project is not
really halted since a stable 1.8.5 version has been released [2] and
there is still svn activity.

But the Mintest fork (called irrlichtMt) is attractive since:
  - It use a CMake build system instead of hand written makefiles [3]
  - Bundled libraries has been removed [4] [5]
  - It allows to remove the NEON support workaround for bundled libpng
  - It use git as VCS
  - Improve the licensing information

This irrlichtmt is required since mintest 5.5.0 version but contains
several changes specific to Minetest, so add irrlichtmt as additional
sources using EXTRA_DOWNLOADS.

minetest:
- Add zstd dependency for MapBlock compression [6]
- Freetype is now a build requirement for mintest client [7]
- gcc >= 5.x is now required [8]
- remove upstream patch [9]

minetest-game:
- Add new license files:
    mods/keys/license.txt
    mods/mtg_craftguide/license.txt
    mods/weather/license.txt

[1] https://forum.minetest.net/viewtopic.php?p=393565
[2] https://irrlicht.sourceforge.io/forum/viewtopic.php?f=2&t=52775
[3] https://github.com/minetest/irrlicht/commit/6ce98dce7789c96dded00fabfe409356f954edfe
[4] https://github.com/minetest/irrlicht/commit/67f1402410a5b90f11c2a2bd69ba5d73eb6e943a
[5] https://github.com/minetest/irrlicht/commit/264f8b72c1dce7c209ac8daaf0484aa3af7740b7
[6] https://github.com/minetest/minetest/commit/d1624a552151bcb152b7abf63df6501b63458d78
[7] https://github.com/minetest/minetest/commit/76dbd0d2d04712dcad4f7c6afecb97fa8d662d6d
[8] https://github.com/minetest/minetest/commit/a90b2a4d4f38e92b4016d9ac86e001398be729e7
[9] https://github.com/minetest/minetest/commit/7c2826cbc0f36027d4a9781f433150d1c5d0d03f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Arnout: simplify symlink command]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/minetest-game/minetest-game.hash           |  5 +++-
 package/minetest-game/minetest-game.mk             |  5 +++-
 ...Fix-build-for-newer-versions-of-GCC-11246.patch | 35 ----------------------
 package/minetest/Config.in                         | 17 ++++++-----
 package/minetest/minetest.hash                     |  6 ++--
 package/minetest/minetest.mk                       | 30 +++++++++++--------
 6 files changed, 39 insertions(+), 59 deletions(-)

diff --git a/package/minetest-game/minetest-game.hash b/package/minetest-game/minetest-game.hash
index 3f057e4ee5..2b7eeffd8f 100644
--- a/package/minetest-game/minetest-game.hash
+++ b/package/minetest-game/minetest-game.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b4bfa0755b88230cf4bdb6af6a0951dd1248f6cdf87fecc340e43ac12c80b0b2  minetest-game-5.4.1.tar.gz
+sha256  5a24fec4ed838744906f020096c35616e7ba76eeec2b93b980a40af011107e7c  minetest-game-5.5.1.tar.gz
 
 sha256  f8a254e8d5f6b3ca3873f990986e86c864f943aa5dc9bf56808c5f4bfa509db0  LICENSE.txt
 sha256  ed2afed388c470e08edc1104e4ff6d12b68a32a76b8c52d760a99d4d2d7716f3  mods/beds/license.txt
@@ -21,7 +21,9 @@ sha256  01370a00e7b2157a07ee21fa4dac9cc108c7449442f612a3e55cfe18b5b03c2b  mods/f
 sha256  d92ac36a0235f4c02f8cfe2137d7d632bd53374c44ead97f20c152dddf475837  mods/flowers/license.txt
 sha256  ffbac006d197fcb8e36e9cdda638053ac80eef4e6446bbe36cb94bd28f54ba0b  mods/game_commands/license.txt
 sha256  857f64cd62c13e27f25363584342fe049885b16c6b2392f1ebd7c3a7fb6ca436  mods/give_initial_stuff/license.txt
+sha256  aca908299369e2187ae9107e5e870721ea0dcb699a470fec1fd7fabce4bcbcdf  mods/keys/license.txt
 sha256  dcbab8d7dc4137789958d19471807b37447fd303bced310d7d76d901eefca8ff  mods/map/license.txt
+sha256  babdfff9fe0cc4a3d4346b5388129d4ba79e50b517c82ca37cfdfd78086b83aa  mods/mtg_craftguide/license.txt
 sha256  88385cd60d15c4fb4856c3c4c551c76c30958268c5c1160c1aa4e520c037a623  mods/player_api/license.txt
 sha256  0066e63d682d54a014ad3359794365a1abb87562d2b1e5e32093976d88c295b4  mods/screwdriver/license.txt
 sha256  b903866d052774e4127952690ce62ca26aa5bc4c2ddd48fceae501fa0d24ed74  mods/sethome/license.txt
@@ -31,5 +33,6 @@ sha256  eab4c0cb318bb83c13362047a5a0fc5cb650a4e561ceb5a9124e5a1253cbc21a  mods/s
 sha256  e8593deed04ed4199ce9303db900f32276e0b629fd7f0089074d13370c12d00a  mods/tnt/license.txt
 sha256  a0814bccd28157a160049efeac03864ff4c4dd6a34bc9cfcd3cc62de66fb156a  mods/vessels/license.txt
 sha256  e9ebf1b4b170e64a0ea6e246edd03689aeb859d6560b8372a8081c004b30cb65  mods/walls/license.txt
+sha256  84f4ed8b688ab385eb9d5b482eb35c26cd7a45e065ed93ff6ad477d29ff3c708  mods/weather/license.txt
 sha256  551b19e2c8b18c143301e090a1ceb5dc5d4ca243cad846de179d693439910816  mods/wool/license.txt
 sha256  c71155c9a68a5242223c5f814c1b9b1270492729b0ff0add770b6418bccf17c9  mods/xpanes/license.txt
diff --git a/package/minetest-game/minetest-game.mk b/package/minetest-game/minetest-game.mk
index df118b9e52..e5ee45b6ab 100644
--- a/package/minetest-game/minetest-game.mk
+++ b/package/minetest-game/minetest-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_GAME_VERSION = 5.4.1
+MINETEST_GAME_VERSION = 5.5.1
 MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
 MINETEST_GAME_LICENSE = LGPL-2.1+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, \
 	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0 (mods)
@@ -28,7 +28,9 @@ MINETEST_GAME_LICENSE_FILES = LICENSE.txt \
 	mods/flowers/license.txt \
 	mods/game_commands/license.txt \
 	mods/give_initial_stuff/license.txt \
+	mods/keys/license.txt \
 	mods/map/license.txt \
+	mods/mtg_craftguide/license.txt \
 	mods/player_api/license.txt \
 	mods/screwdriver/license.txt \
 	mods/sethome/license.txt \
@@ -38,6 +40,7 @@ MINETEST_GAME_LICENSE_FILES = LICENSE.txt \
 	mods/tnt/license.txt \
 	mods/vessels/license.txt \
 	mods/walls/license.txt \
+	mods/weather/license.txt \
 	mods/wool/license.txt \
 	mods/xpanes/license.txt
 
diff --git a/package/minetest/0001-Fix-build-for-newer-versions-of-GCC-11246.patch b/package/minetest/0001-Fix-build-for-newer-versions-of-GCC-11246.patch
deleted file mode 100644
index 35102a077b..0000000000
--- a/package/minetest/0001-Fix-build-for-newer-versions-of-GCC-11246.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a327c06f5dee9f432666b503203fd15e4ccafc1b Mon Sep 17 00:00:00 2001
-From: lhofhansl <larsh@apache.org>
-Date: Thu, 6 May 2021 10:24:30 -0700
-Subject: [PATCH] Fix build for newer versions of GCC (#11246)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-(cherry picked from commit 7c2826cbc0f36027d4a9781f433150d1c5d0d03f)
-
-Fixes:
-
-minetest-5.4.1/src/clientiface.h:444:36: error: ‘shared_ptr’ in namespace ‘std’ does not name a template type
-  444 |         ClientInterface(const std::shared_ptr<con::Connection> &con);
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/clientiface.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/clientiface.h b/src/clientiface.h
-index cc5292b71..dfd976741 100644
---- a/src/clientiface.h
-+++ b/src/clientiface.h
-@@ -31,6 +31,7 @@ with this program; if not, write to the Free Software Foundation, Inc.,
- #include <list>
- #include <vector>
- #include <set>
-+#include <memory>
- #include <mutex>
- 
- class MapBlock;
--- 
-2.31.1
-
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index b8ee175d52..3e331dff7e 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -1,16 +1,16 @@
 config BR2_PACKAGE_MINETEST
 	bool "minetest"
-	depends on BR2_INSTALL_LIBSTDCPP # irrlicht
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP # irrlichtMt (bundled)
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_XORG7 # irrlicht
-	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
+	depends on BR2_PACKAGE_XORG7 # irrlichtMt (bundled)
+	depends on BR2_PACKAGE_HAS_LIBGL # irrlichtMt (bundled)
 	depends on BR2_PACKAGE_LUAJIT
-	select BR2_PACKAGE_IRRLICHT
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZSTD
 	# At least one option must be enabled
 	select BR2_PACKAGE_MINETEST_CLIENT if !BR2_PACKAGE_MINETEST_SERVER
 	help
@@ -25,6 +25,7 @@ if BR2_PACKAGE_MINETEST
 config BR2_PACKAGE_MINETEST_CLIENT
 	bool "minetest client"
 	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
@@ -51,14 +52,14 @@ comment "sound support needs a toolchain w/ threads NPTL"
 
 endif
 
-comment "minetest needs a toolchain w/ C++, gcc >= 4.9, threads"
+comment "minetest needs a toolchain w/ C++, gcc >= 5.1, threads"
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "minetest needs X11 and an OpenGL provider"
 	depends on (BR2_INSTALL_LIBSTDCPP \
-		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		&& BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		&& BR2_TOOLCHAIN_HAS_THREADS)
 	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
index 7eb57cb2a9..e78f865969 100644
--- a/package/minetest/minetest.hash
+++ b/package/minetest/minetest.hash
@@ -1,4 +1,6 @@
 # Locally calculated
-sha256  de9e4410583c845c104b4be25f9d0b8743d8573c120149b8910ae2519f9ab14e  minetest-5.4.1.tar.gz
+sha256  dc0ae5188ef351db85c38b27f38f8549b133ed82aa46daea6deee148aa3454f4  minetest-5.5.1.tar.gz
+sha256  6d38dd7f3e3c8d768e1f5776b98dd5359b184c2e6740ddf733f4dc8615191bef  irrlicht-1.9.0mt5.tar.gz
 
-sha256  5bc4bb4ff369d5039bcfff5a83a378335240ca86c58299e7de25097153c70132  LICENSE.txt
+sha256  d1d8a63f7f70d89a3a899f3b9fb5ca1ea7dbbd4eb449be2a7b2ff861b1f09192  LICENSE.txt
+sha256  ca38f1ba4ab901111f6eee50009bd46dbd866e6beb98d592d843f7c162d73409  lib/irrlichtmt/doc/irrlicht-license.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index e046ec2851..5c007ada5e 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -4,12 +4,25 @@
 #
 ################################################################################
 
-MINETEST_VERSION = 5.4.1
+MINETEST_VERSION = 5.5.1
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
-MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
-MINETEST_LICENSE_FILES = LICENSE.txt
+MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds), Zlib (irrlicht)
+MINETEST_LICENSE_FILES = LICENSE.txt lib/irrlichtmt/doc/irrlicht-license.txt
 
-MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
+MINETEST_DEPENDENCIES = gmp jsoncpp luajit sqlite zlib zstd
+
+MINETEST_IRRLICHTMT_VERSION = 1.9.0mt5
+MINETEST_EXTRA_DOWNLOADS = $(call github,minetest,irrlicht,$(MINETEST_IRRLICHTMT_VERSION))/irrlicht-$(MINETEST_IRRLICHTMT_VERSION).tar.gz
+
+define MINETEST_IRRLICHTMT_EXTRACT
+	mkdir -p $(@D)/lib
+	$(foreach f, $(notdir $(MINETEST_EXTRA_DOWNLOADS)), \
+		$(call suitable-extractor,$(f)) $(MINETEST_DL_DIR)/$(f) | \
+			$(TAR) -C $(@D)/lib $(TAR_OPTIONS) -
+	)
+	ln -sf irrlicht-$(MINETEST_IRRLICHTMT_VERSION) $(@D)/lib/irrlichtmt
+endef
+MINETEST_POST_EXTRACT_HOOKS += MINETEST_IRRLICHTMT_EXTRACT
 
 MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
@@ -22,7 +35,7 @@ MINETEST_CONF_OPTS = \
 	-DBUILD_UNITTESTS=OFF
 
 ifeq ($(BR2_PACKAGE_MINETEST_CLIENT),y)
-MINETEST_DEPENDENCIES += bzip2 jpeg libgl libpng xlib_libXxf86vm
+MINETEST_DEPENDENCIES += bzip2 freetype jpeg libgl libpng xlib_libXxf86vm
 MINETEST_CONF_OPTS += -DBUILD_CLIENT=ON
 else
 MINETEST_CONF_OPTS += -DBUILD_CLIENT=OFF
@@ -41,13 +54,6 @@ else
 MINETEST_CONF_OPTS += -DENABLE_SOUND=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_FREETYPE),y)
-MINETEST_DEPENDENCIES += freetype
-MINETEST_CONF_OPTS += -DENABLE_FREETYPE=ON
-else
-MINETEST_CONF_OPTS += -DENABLE_FREETYPE=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_HIREDIS),y)
 MINETEST_DEPENDENCIES += hiredis
 MINETEST_CONF_OPTS += -DENABLE_REDIS=ON

--===============2438447802886226000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2438447802886226000==--
