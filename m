From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 May 2021 19:33:25 +0300
Subject: [Buildroot] [PATCH 6/6] package/cage: bump to version 0.1.3
In-Reply-To: <20210513163325.1775639-1-aperez@igalia.com>
References: <20210513163325.1775639-1-aperez@igalia.com>
Message-ID: <20210513163325.1775639-7-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to version 0.1.3, which is a matenance release which does not
add any new features but can be built against wlroots 0.13.0. A new
build option to toggle man pages is set to always disabled.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cage/cage.hash | 2 +-
 package/cage/cage.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 5cae952d72..6e312bbf5f 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
 # Generated locally
-sha256 38a3e3968f00cc58fe1d9448e972cfac7d1efa30c48699f09032f264101a55ac  cage-0.1.2.1.tar.gz
+sha256 c28aa8230f937c89b564967748451c1eb15d8633a71a1ed6e22d532afa15462e  cage-0.1.3.tar.gz
 
 # Hashes for license files:
 sha256 e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 9fc01d36c1..0950c70474 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,16 +4,17 @@
 #
 ################################################################################
 
-CAGE_VERSION = 0.1.2.1
+CAGE_VERSION = 0.1.3
 CAGE_SITE = https://github.com/Hjdskes/cage/releases/download/v$(CAGE_VERSION)
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
+CAGE_CONF_OPTS = -Dman-pages=disabled
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-CAGE_CONF_OPTS = -Dxwayland=true
+CAGE_CONF_OPTS += -Dxwayland=true
 else
-CAGE_CONF_OPTS = -Dxwayland=false
+CAGE_CONF_OPTS += -Dxwayland=false
 endif
 
 $(eval $(meson-package))
-- 
2.31.1
