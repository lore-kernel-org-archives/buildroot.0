From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Jun 2020 19:54:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xkeyboard-config: bump
 version to 2.30
Message-ID: <20200615175419.851657-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch which was committed upstream, updated project URL,
reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-fix-python3-support.patch            | 37 -------------------
 package/x11r7/xkeyboard-config/Config.in      |  2 +-
 .../xkeyboard-config/xkeyboard-config.hash    |  4 +-
 .../xkeyboard-config/xkeyboard-config.mk      |  2 +-
 4 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 package/x11r7/xkeyboard-config/0001-fix-python3-support.patch

diff --git a/package/x11r7/xkeyboard-config/0001-fix-python3-support.patch b/package/x11r7/xkeyboard-config/0001-fix-python3-support.patch
deleted file mode 100644
index c9f8b59d0c..0000000000
--- a/package/x11r7/xkeyboard-config/0001-fix-python3-support.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c847c834cce190c5c835a454bfe548195da9fa53 Mon Sep 17 00:00:00 2001
-From: MilhouseVH <milhouseVH.github@nmacleod.com>
-Date: Sun, 16 Feb 2020 09:41:43 +0000
-Subject: [PATCH] fix python3 support
-
-https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/issues/197
-[Retrieved from:
-https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/commit/c847c834cce190c5c835a454bfe548195da9fa53]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- rules/compat/map-variants.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/rules/compat/map-variants.py b/rules/compat/map-variants.py
-index ebbfec9..979ba43 100755
---- a/rules/compat/map-variants.py
-+++ b/rules/compat/map-variants.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- 
- import argparse
- import re
-@@ -12,8 +12,8 @@ class Layout(object):
-             assert variant is None
-             # parse a layout(variant) string
-             match = re.match(r'([^(]+)\(([^)]+)\)', layout)
--            self.layout = match[1]
--            self.variant = match[2]
-+            self.layout = match.groups()[0]
-+            self.variant = match.groups()[1]
- 
-     def __str__(self):
-         if self.variant:
--- 
-2.24.1
-
diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
index c941742421..17cfe738d4 100644
--- a/package/x11r7/xkeyboard-config/Config.in
+++ b/package/x11r7/xkeyboard-config/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_XKEYBOARD_CONFIG
 	help
 	  keyboard configuration database for X
 
-	  http://xlibs.freedesktop.org/xkbdesc
+	  https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index 5066a46885..4da866f7b5 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 1d4175278bf06000683656763a8b1d3282c61a314b6db41260c8efe92d621802  xkeyboard-config-2.29.tar.bz2
-sha256 6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
+sha256  095a524f7b633ed257617202d06c9c71fe020c8897b106cf0dcdd0c6e8b797d4  xkeyboard-config-2.30.tar.bz2
+sha256  6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index f2fc8565c3..9cf1a57877 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.29
+XKEYBOARD_CONFIG_VERSION = 2.30
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
-- 
2.26.2
