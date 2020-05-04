From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 May 2020 16:37:42 +0200
Subject: [Buildroot] [PATCH] package/solarus: bump to version 1.6.4
Message-ID: <20200504143742.3191019-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add glm dependency since the bundled version is gone [1].

Update indentation of hash file (two spaces).

[1] https://gitlab.com/solarus-games/solarus/commit/5285c8e1afa538bbcd4c8654f9bbfb270cc7f52

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/solarus/Config.in    | 1 +
 package/solarus/solarus.hash | 4 ++--
 package/solarus/solarus.mk   | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index 6bed38a6f5..5d15342f3a 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SOLARUS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on !BR2_STATIC_LIBS # SDL2
 	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_GLM
 	select BR2_PACKAGE_LIBMODPLUG
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPNG # runtime
diff --git a/package/solarus/solarus.hash b/package/solarus/solarus.hash
index 3092b13507..8400bfd135 100644
--- a/package/solarus/solarus.hash
+++ b/package/solarus/solarus.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 c14cd97bad6e12310b938d90abd4e8ebdd0abb403cdcc015d5add82dfc5a085b  solarus-v1.6.2.tar.bz2
+sha256  b2e00a7df8953903ba022a8f392038e86f675cee714da19cf9a5f8535c42f349  solarus-v1.6.4.tar.bz2
 
-sha256 309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
+sha256  309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index 6f5853e909..92e849ef02 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOLARUS_VERSION = 1.6.2
+SOLARUS_VERSION = 1.6.4
 SOLARUS_SITE = \
 	https://gitlab.com/solarus-games/solarus/-/archive/v$(SOLARUS_VERSION)
 SOLARUS_SOURCE = solarus-v$(SOLARUS_VERSION).tar.bz2
@@ -16,8 +16,8 @@ SOLARUS_LICENSE_FILES = license.txt
 # Install libsolarus.so
 SOLARUS_INSTALL_STAGING = YES
 
-SOLARUS_DEPENDENCIES = libgl libmodplug libogg libvorbis openal physfs sdl2 \
-	sdl2_image sdl2_ttf
+SOLARUS_DEPENDENCIES = glm libgl libmodplug libogg libvorbis openal physfs \
+	sdl2 sdl2_image sdl2_ttf
 
 # Disable launcher GUI (requires Qt5)
 SOLARUS_CONF_OPTS = \
-- 
2.25.4
