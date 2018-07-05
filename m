From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Thu,  5 Jul 2018 10:10:04 +0200
Subject: [Buildroot] [PATCH 1/1] pigz: update to more stable download URL
Message-ID: <20180705081004.12623-1-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>

The pigz website seems to only host the latest release tarball.
Chances are that the 2.4 tarball will disappear when 2.5 comes out.

Instead, use the Github tarballs provided by the developer. Comparison
between the 2.4 / v2.4 tarballs shows that only the .gitignore file is
added.

Suggested-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/pigz/pigz.hash | 4 ++--
 package/pigz/pigz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index 850e94f079..843fd4fba8 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,3 +1,3 @@
-# From https://zlib.net/pigz/
-sha256  a4f816222a7b4269bd232680590b579ccc72591f1bb5adafcd7208ca77e14f73  pigz-2.4.tar.gz
+# Locally calculated
+sha256  e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52  pigz-v2.4.tar.gz
 sha256	dc8f78258cdb4478b5922f4c00eb63d3cbac06c171dc829648fd414bb0cf4493  README
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index 82f3049519..ac4f94027c 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PIGZ_VERSION = 2.4
-PIGZ_SITE = http://www.zlib.net/pigz
+PIGZ_VERSION = v2.4
+PIGZ_SITE = $(call github,madler,pigz,$(PIGZ_VERSION))
 PIGZ_DEPENDENCIES = zlib
 PIGZ_LICENSE = Zlib
 PIGZ_LICENSE_FILES = README
-- 
2.16.4
