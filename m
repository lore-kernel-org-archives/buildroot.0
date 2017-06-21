From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 22 Jun 2017 00:42:19 +0200
Subject: [Buildroot] [PATCH 4/4] package/solarus-zsdx: new package
In-Reply-To: <20170621224219.22770-1-romain.naour@gmail.com>
References: <20170621224219.22770-1-romain.naour@gmail.com>
Message-ID: <20170621224219.22770-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/Config.in                      |  1 +
 package/solarus-zsdx/Config.in         | 16 ++++++++++++++++
 package/solarus-zsdx/solarus-zsdx.hash |  2 ++
 package/solarus-zsdx/solarus-zsdx.mk   | 19 +++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/solarus-zsdx/Config.in
 create mode 100644 package/solarus-zsdx/solarus-zsdx.hash
 create mode 100644 package/solarus-zsdx/solarus-zsdx.mk

diff --git a/package/Config.in b/package/Config.in
index 1564f96..d7f2f5f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -233,6 +233,7 @@ menu "Games"
 	source "package/rubix/Config.in"
 	source "package/sl/Config.in"
 	source "package/solarus/Config.in"
+	source "package/solarus-zsdx/Config.in"
 	source "package/stella/Config.in"
 	source "package/supertux/Config.in"
 	source "package/supertuxkart/Config.in"
diff --git a/package/solarus-zsdx/Config.in b/package/solarus-zsdx/Config.in
new file mode 100644
index 0000000..64b386f
--- /dev/null
+++ b/package/solarus-zsdx/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_SOLARUS_ZSDX
+	bool "solarus-zsdx"
+	depends on BR2_PACKAGE_SOLARUS
+	help
+	This package contains the data files of the game Zelda:
+	Mystery of Solarus DX. This quest is a free, open-source game
+	that works with Solarus, an open-source Zelda-like 2D game
+	engine. To play this game, you need Solarus. We assume in this
+	readme that Solarus is already installed.
+
+	Note: solarus-zsdx contains some Zelda sprites, characters and
+	musics that are copyrighted by Nitendo.
+	http://www.solarus-games.org/engine/faq
+
+	http://www.solarus-games.org
+	https://github.com/solarus-games/zsdx
diff --git a/package/solarus-zsdx/solarus-zsdx.hash b/package/solarus-zsdx/solarus-zsdx.hash
new file mode 100644
index 0000000..dcd8d2b
--- /dev/null
+++ b/package/solarus-zsdx/solarus-zsdx.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 05a5d220bbf2439c9da2e71cd9d104240878123fff5bc702e2405d6d0712f0dc  solarus-zsdx-1.11.0.tar.gz
diff --git a/package/solarus-zsdx/solarus-zsdx.mk b/package/solarus-zsdx/solarus-zsdx.mk
new file mode 100644
index 0000000..802ecd1
--- /dev/null
+++ b/package/solarus-zsdx/solarus-zsdx.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# solarus-zsdx
+#
+################################################################################
+
+SOLARUS_ZSDX_VERSION = 1.11.0
+SOLARUS_ZSDX_SITE = $(call github,solarus-games,zsdx,zsdx-$(SOLARUS_ZSDX_VERSION))
+
+# Upstream say: "Our games contain Nintendo?s proprietary content, but we believe
+# this is fair use."
+# http://www.solarus-games.org/engine/faq/#are_you_affiliated_with_nintendo
+SOLARUS_ZSDX_LICENSE = GPL-3.0 (Lua scripts), CC-BY-SA-4.0 (Most data files), \
+	GPL-2.0 (fonts/wqy-zenhei.ttc), CC-BY-SA-3.0 \
+	(sprites/enemies/agahnim.png, sprites/enemies/agahnim_fake.png) \
+	PROPRIETARY (graphics, sounds and names that belong to Nintendo)
+SOLARUS_ZSDX_LICENSE_FILES = license.txt
+
+$(eval $(cmake-package))
-- 
2.9.4
