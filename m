From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 19 Mar 2018 22:19:03 +0100
Subject: [Buildroot] [PATCH 2/2] package/flare-game: new package
In-Reply-To: <20180319211903.11539-1-romain.naour@gmail.com>
References: <20180319211903.11539-1-romain.naour@gmail.com>
Message-ID: <20180319211903.11539-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/flare-game/Config.in       | 12 ++++++++++++
 package/flare-game/flare-game.hash |  3 +++
 package/flare-game/flare-game.mk   | 18 ++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/flare-game/Config.in
 create mode 100644 package/flare-game/flare-game.hash
 create mode 100644 package/flare-game/flare-game.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 97dd4cc096..843bffd4f6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1536,6 +1536,7 @@ F:	package/efl/
 F:	package/enlightenment/
 F:	package/expedite/
 F:	package/flare-engine/
+F:	package/flare-game/
 F:	package/iqvlinux/
 F:	package/irrlicht/
 F:	package/liblinear/
diff --git a/package/Config.in b/package/Config.in
index e2ca2802c3..4b946215db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -234,6 +234,7 @@ menu "Games"
 	source "package/chocolate-doom/Config.in"
 	source "package/doom-wad/Config.in"
 	source "package/flare-engine/Config.in"
+	source "package/flare-game/Config.in"
 	source "package/gnuchess/Config.in"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
diff --git a/package/flare-game/Config.in b/package/flare-game/Config.in
new file mode 100644
index 0000000000..466e765236
--- /dev/null
+++ b/package/flare-game/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FLARE_GAME
+	bool "flare-game"
+	depends on BR2_PACKAGE_FLARE_ENGINE
+	help
+	  Flare is an open source, 2D action RPG licensed under the
+	  GPL3 license. Its game play can be likened to the games in
+	  the Diablo series.
+
+	  flare-game is a package that requires flare-engine that only
+	  contains this game data.
+
+	  http://flarerpg.org
diff --git a/package/flare-game/flare-game.hash b/package/flare-game/flare-game.hash
new file mode 100644
index 0000000000..a27c66d9e3
--- /dev/null
+++ b/package/flare-game/flare-game.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  5c8e9d72fcbe59f1861f79ac7b76ceffe3ec61d1df241c32d9133fe158fba4c1  flare-game-v1.0.tar.gz
+sha256  9fce5eb663f136449e11293a871ed96db5ba579116a927fc6a70dd20a4a5b9e6  README
diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
new file mode 100644
index 0000000000..84809eac5c
--- /dev/null
+++ b/package/flare-game/flare-game.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# flare-game
+#
+################################################################################
+
+FLARE_GAME_VERSION = v1.0
+FLARE_GAME_SITE =  $(call github,clintbellanger,flare-game,$(FLARE_GAME_VERSION))
+FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
+	OFL-1.1 (Liberation Sans)
+FLARE_GAME_LICENSE_FILES = README
+
+FLARE_GAME_DEPENDENCIES += flare-engine
+
+# Don't use /usr/share/games
+FLARE_GAME_CONF_OPTS += -DDATADIR=share/flare
+
+$(eval $(cmake-package))
-- 
2.14.3
