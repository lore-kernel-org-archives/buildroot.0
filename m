From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:02 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-*: mass version
 bump
Message-ID: <20200122235421.8CA648386D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f03ea1d7d4cf3dd682b11eecdf53d94f4c507b03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most screensaver repos were moved to the xbmc project:
https://github.com/xbmc/repo-binary-addons/commit/57b8ed5fb9b5f0368738260b762cc0bab1147172
https://github.com/xbmc/repo-binary-addons/commit/29c23f8e0cbfab6c39eb910ebc4f23f7afdec87e
https://github.com/xbmc/repo-binary-addons/commit/98e71315026fd163de7cc15dad8e2c0398851499
https://github.com/xbmc/repo-binary-addons/commit/994b0d5b73118e6dc5cece534daffb6a176fa426
https://github.com/xbmc/repo-binary-addons/commit/21b0c96d7fbff7853aadf63868b79384cdb40394

Add patches to fix missing cstddef include.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-screensaver-asterwave/Config.in       |  2 +-
 .../kodi-screensaver-asterwave.hash                |  2 +-
 .../kodi-screensaver-asterwave.mk                  |  4 +--
 .../0001-Add-missing-stddef-include.patch          | 25 +++++++++++++++++
 package/kodi-screensaver-biogenesis/Config.in      |  2 +-
 .../kodi-screensaver-biogenesis.hash               |  2 +-
 .../kodi-screensaver-biogenesis.mk                 |  4 +--
 package/kodi-screensaver-cpblobs/Config.in         |  2 +-
 .../kodi-screensaver-cpblobs.hash                  |  2 +-
 .../kodi-screensaver-cpblobs.mk                    |  4 +--
 .../kodi-screensaver-crystalmorph.hash             |  2 +-
 .../kodi-screensaver-crystalmorph.mk               |  2 +-
 package/kodi-screensaver-greynetic/Config.in       |  2 +-
 .../kodi-screensaver-greynetic.hash                |  2 +-
 .../kodi-screensaver-greynetic.mk                  |  4 +--
 .../0001-Add-missing-stddef-include.patch          | 25 +++++++++++++++++
 package/kodi-screensaver-matrixtrails/Config.in    |  2 +-
 .../kodi-screensaver-matrixtrails.hash             |  2 +-
 .../kodi-screensaver-matrixtrails.mk               |  5 ++--
 ...001-Backport-Add-missing-cstddef-includes.patch | 32 ++++++++++++++++++++++
 package/kodi-screensaver-pingpong/Config.in        |  2 +-
 .../kodi-screensaver-pingpong.hash                 |  2 +-
 .../kodi-screensaver-pingpong.mk                   |  4 +--
 .../0001-Add-missing-stddef-include.patch          | 25 +++++++++++++++++
 package/kodi-screensaver-pyro/Config.in            |  2 +-
 .../kodi-screensaver-pyro.hash                     |  2 +-
 .../kodi-screensaver-pyro/kodi-screensaver-pyro.mk |  4 +--
 package/kodi-screensaver-stars/Config.in           |  2 +-
 .../kodi-screensaver-stars.hash                    |  2 +-
 .../kodi-screensaver-stars.mk                      |  4 +--
 30 files changed, 141 insertions(+), 35 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/Config.in b/package/kodi-screensaver-asterwave/Config.in
index bd5db738ca..b5e80cc535 100644
--- a/package/kodi-screensaver-asterwave/Config.in
+++ b/package/kodi-screensaver-asterwave/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE
 	help
 	  AsterWave screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.asterwave
+	  https://github.com/xbmc/screensaver.asterwave
 
 comment "kodi-screensaver-asterwave needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index 40c8f9b28c..b05c9a1803 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 48cd459b60b2407b8bae9107760a013d04ee29e00fddbce9550291896d42ef64  kodi-screensaver-asterwave-1.1.0.tar.gz
+sha256 ff018b5bdd353747a4e962c72ec622a74232e05eae1742a116259273f1db0552  kodi-screensaver-asterwave-3.0.3-Leia.tar.gz
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 8f6d583829..82996bc3e2 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 1.1.0
-KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,notspiff,screensaver.asterwave,v$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 3.0.3-Leia
+KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libglu libsoil
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-biogenesis/0001-Add-missing-stddef-include.patch b/package/kodi-screensaver-biogenesis/0001-Add-missing-stddef-include.patch
new file mode 100644
index 0000000000..378b3ad1de
--- /dev/null
+++ b/package/kodi-screensaver-biogenesis/0001-Add-missing-stddef-include.patch
@@ -0,0 +1,25 @@
+From 86da3bfecf8ddd2f8c2c3eed6e1cb8850883f4b2 Mon Sep 17 00:00:00 2001
+From: Rechi <Rechi@users.noreply.github.com>
+Date: Sun, 24 Mar 2019 10:53:31 +0100
+Subject: [PATCH] [fix] add missing stddef.h include for offsetof macro
+
+Downloaded from upstream commit:
+https://github.com/xbmc/screensaver.biogenesis/commit/86da3bfecf8ddd2f8c2c3eed6e1cb8850883f4b2
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/Life.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Life.cpp b/src/Life.cpp
+index 762ad7d..68be133 100644
+--- a/src/Life.cpp
++++ b/src/Life.cpp
+@@ -24,6 +24,7 @@
+ 
+ #include "types.h"
+ #include <memory.h>
++#include <stddef.h>
+ #ifdef WIN32
+ #include <d3d11.h>
+ #else
diff --git a/package/kodi-screensaver-biogenesis/Config.in b/package/kodi-screensaver-biogenesis/Config.in
index cdc2d91951..9703e9091b 100644
--- a/package/kodi-screensaver-biogenesis/Config.in
+++ b/package/kodi-screensaver-biogenesis/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS
 	help
 	  BioGenesis screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.biogenesis
+	  https://github.com/xbmc/screensaver.biogenesis
 
 comment "kodi-screensaver-biogenesis needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 81b57e4265..c0e03d2375 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b97dc804261b19df725e0a9f1af3be6903226ae616fcac170f7b9c1a67bf811a  kodi-screensaver-biogenesis-1.1.0.tar.gz
+sha256 1d1edff918d2a94ba0efd329a45294be47e73eef65f700d62b311eb750d0fef7  kodi-screensaver-biogenesis-2.2.2-Leia.tar.gz
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index fe0d284448..3888f2996e 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 1.1.0
-KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis,v$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 2.2.2-Leia
+KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
 KODI_SCREENSAVER_BIOGENESIS_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-cpblobs/Config.in b/package/kodi-screensaver-cpblobs/Config.in
index e80ea0ebb3..4e0003bddc 100644
--- a/package/kodi-screensaver-cpblobs/Config.in
+++ b/package/kodi-screensaver-cpblobs/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS
 	help
 	  CpBlobs screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.cpblobs
+	  https://github.com/xbmc/screensaver.cpblobs
 
 comment "kodi-screensaver-cpblobs needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index bc1228c55f..88fdca45c8 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1ca5e4de61251de7e420dc6ded3156960f9bb52ed7ff0243f305768147d470e3  kodi-screensaver-cpblobs-1.1.0.tar.gz
+sha256 6d7a0036a118778117d1d1ebeca96903e66f49a166848a1c884aaf3ed65fdd46  kodi-screensaver-cpblobs-e65b34fb75ac258a8563169b9c00ebf739dbc7ca.tar.gz
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 09dc6c16fc..bb6811dab3 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 1.1.0
-KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,notspiff,screensaver.cpblobs,v$(KODI_SCREENSAVER_CPBLOBS_VERSION))
+KODI_SCREENSAVER_CPBLOBS_VERSION = e65b34fb75ac258a8563169b9c00ebf739dbc7ca
+KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
 KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = kodi libsoil
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
index ff9d6d0244..6442b4d5bc 100644
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a8400c8d8be0fe0ba616ad1d0ef5fd798980a9dd4e38ef88bee9bf74a06975d5  kodi-screensaver-crystalmorph-1dc9bf3f57cc2c5345efec64d9499c3bf8f7bd6e.tar.gz
+sha256 d8ed548222f1118964104fefc8ac3056dfe6c9d2ee35cd7c8355c9ea9fcaffc5  kodi-screensaver-crystalmorph-4439c84c38abf889e19a1863e745942c0d7f8203.tar.gz
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
index 83629e41ca..35642d5580 100644
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CRYSTALMORPH_VERSION = 1dc9bf3f57cc2c5345efec64d9499c3bf8f7bd6e
+KODI_SCREENSAVER_CRYSTALMORPH_VERSION = 4439c84c38abf889e19a1863e745942c0d7f8203
 KODI_SCREENSAVER_CRYSTALMORPH_SITE = $(call github,notspiff,screensaver.crystalmorph,$(KODI_SCREENSAVER_CRYSTALMORPH_VERSION))
 KODI_SCREENSAVER_CRYSTALMORPH_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_CRYSTALMORPH_LICENSE_FILES = src/Fractal.cpp
diff --git a/package/kodi-screensaver-greynetic/Config.in b/package/kodi-screensaver-greynetic/Config.in
index ce636b8271..685feb8872 100644
--- a/package/kodi-screensaver-greynetic/Config.in
+++ b/package/kodi-screensaver-greynetic/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC
 	help
 	  Greynetic screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.greynetic
+	  https://github.com/xbmc/screensaver.greynetic
 
 comment "kodi-screensaver-greynetic needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 5ca0f66d58..28c669d831 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 55a77487f02d282e8431e64de3cb263489037c2374a4b9cdd7aa189093e7621f  kodi-screensaver-greynetic-1.1.0.tar.gz
+sha256 d95bc93d022b12fbfcbaedf1128292b40dd16276b65a3ffecb90707055e1d55f  kodi-screensaver-greynetic-2.2.1-Leia.tar.gz
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index ef95dc7505..f9b0be1ad5 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 1.1.0
-KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,v$(KODI_SCREENSAVER_GREYNETIC_VERSION))
+KODI_SCREENSAVER_GREYNETIC_VERSION = 2.2.1-Leia
+KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
 KODI_SCREENSAVER_GREYNETIC_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-matrixtrails/0001-Add-missing-stddef-include.patch b/package/kodi-screensaver-matrixtrails/0001-Add-missing-stddef-include.patch
new file mode 100644
index 0000000000..75cadfcb1e
--- /dev/null
+++ b/package/kodi-screensaver-matrixtrails/0001-Add-missing-stddef-include.patch
@@ -0,0 +1,25 @@
+From 404763f096a312e12c0dc4764834987797411745 Mon Sep 17 00:00:00 2001
+From: Rechi <Rechi@users.noreply.github.com>
+Date: Sun, 24 Mar 2019 11:44:05 +0100
+Subject: [PATCH] [fix] add missing stddef.h include for offsetof macro
+
+Downloaded from upstream commit:
+https://github.com/xbmc/screensaver.matrixtrails/commit/404763f096a312e12c0dc4764834987797411745
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/matrixtrails.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/matrixtrails.cpp b/src/matrixtrails.cpp
+index 220855a..2817dbe 100644
+--- a/src/matrixtrails.cpp
++++ b/src/matrixtrails.cpp
+@@ -25,6 +25,7 @@
+ #include "matrixtrails.h"
+ #include "SOIL2/SOIL2.h"
+ 
++#include <stddef.h>
+ #include <vector>
+ 
+ ////////////////////////////////////////////////////////////////////////////
diff --git a/package/kodi-screensaver-matrixtrails/Config.in b/package/kodi-screensaver-matrixtrails/Config.in
index e2d3f71acf..270a51c9f4 100644
--- a/package/kodi-screensaver-matrixtrails/Config.in
+++ b/package/kodi-screensaver-matrixtrails/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS
 	help
 	  Matrix trails screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.matrixtrails
+	  https://github.com/xbmc/screensaver.matrixtrails
 
 comment "kodi-screensaver-matrixtrails needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 6ba6d542b0..737c522715 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2b531f51b86536df2a5268547e3d1b7fabc8a1dc930808b46685afcc455bb8fa  kodi-screensaver-matrixtrails-1.1.0.tar.gz
+sha256 2d2c795853c5a72184bb6720247d79c48b1d9fbc97e9c2913003a707d612e3ac  kodi-screensaver-matrixtrails-v2.2.1-Leia.tar.gz
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index ff64ccb17f..670cec3efb 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 1.1.0
-KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,notspiff,screensaver.matrixtrails,v$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = v2.2.1-Leia
+KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
-
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi libsoil
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-pingpong/0001-Backport-Add-missing-cstddef-includes.patch b/package/kodi-screensaver-pingpong/0001-Backport-Add-missing-cstddef-includes.patch
new file mode 100644
index 0000000000..f71e1899ae
--- /dev/null
+++ b/package/kodi-screensaver-pingpong/0001-Backport-Add-missing-cstddef-includes.patch
@@ -0,0 +1,32 @@
+From 6ca75e7d421a49b6124d0e1cd37a529c66a701cb Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 18 Jan 2020 20:01:21 +0100
+Subject: [PATCH] [Backport] Add missing cstddef includes
+
+Fixes build error with gcc 5.5.0.
+
+Backported from https://github.com/xbmc/screensaver.pingpong/pull/21
+
+Patch sent upstream:
+https://github.com/xbmc/screensaver.pingpong/pull/22
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/pingpong.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pingpong.cpp b/src/pingpong.cpp
+index e1df353..9cd9fb5 100644
+--- a/src/pingpong.cpp
++++ b/src/pingpong.cpp
+@@ -24,6 +24,7 @@
+ #include "main.h"
+ #include "pingpong.h"
+ 
++#include <cstddef>
+ #include <vector>
+ 
+ #define NUMQUADS 3
+-- 
+2.20.1
+
diff --git a/package/kodi-screensaver-pingpong/Config.in b/package/kodi-screensaver-pingpong/Config.in
index 3971052b94..bc76fffd6e 100644
--- a/package/kodi-screensaver-pingpong/Config.in
+++ b/package/kodi-screensaver-pingpong/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG
 	help
 	  Ping-pong screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.pingpong
+	  https://github.com/xbmc/screensaver.pingpong
 
 comment "kodi-screensaver-pingpong needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 12049cf989..0a6ab63954 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 99e9cbc3815d4e3dad964b2d233dbf6acc4416121398f7fca75f3811cb04d88f  kodi-screensaver-pingpong-1.1.0.tar.gz
+sha256 d4e09509bf036b7d5c381cd4ecac926a59396fb481347a4056d843ae68d3a20d  kodi-screensaver-pingpong-2.1.1-Leia.tar.gz
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index f8830f24fd..45f2d23039 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 1.1.0
-KODI_SCREENSAVER_PINGPONG_SITE = $(call github,notspiff,screensaver.pingpong,v$(KODI_SCREENSAVER_PINGPONG_VERSION))
+KODI_SCREENSAVER_PINGPONG_VERSION = 2.1.1-Leia
+KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
 KODI_SCREENSAVER_PINGPONG_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-pyro/0001-Add-missing-stddef-include.patch b/package/kodi-screensaver-pyro/0001-Add-missing-stddef-include.patch
new file mode 100644
index 0000000000..c463d42d58
--- /dev/null
+++ b/package/kodi-screensaver-pyro/0001-Add-missing-stddef-include.patch
@@ -0,0 +1,25 @@
+From e1dbe7822b35b889fdc5ea54114ad3f9669d440e Mon Sep 17 00:00:00 2001
+From: Rechi <Rechi@users.noreply.github.com>
+Date: Sun, 24 Mar 2019 10:55:44 +0100
+Subject: [PATCH] [fix] add missing stddef.h include for offsetof macro
+
+Downloaded from upstream commit in master branch:
+https://github.com/xbmc/screensaver.pyro/commit/e1dbe7822b35b889fdc5ea54114ad3f9669d440e
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/Pyro.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Pyro.cpp b/src/Pyro.cpp
+index 3f873a2..6dfa764 100644
+--- a/src/Pyro.cpp
++++ b/src/Pyro.cpp
+@@ -34,6 +34,7 @@
+ #include "Pyro.h"
+ #include <stdio.h>
+ #include <math.h>
++#include <stddef.h>
+ #include <stdlib.h>
+ 
+ #ifdef WIN32
diff --git a/package/kodi-screensaver-pyro/Config.in b/package/kodi-screensaver-pyro/Config.in
index 982542d5a3..e2d1988ec5 100644
--- a/package/kodi-screensaver-pyro/Config.in
+++ b/package/kodi-screensaver-pyro/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_PYRO
 	help
 	  Pyro screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.pyro
+	  https://github.com/xbmc/screensaver.pyro
 
 comment "kodi-screensaver-pyro needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index be29ca3bef..8e8dee0ade 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0dcaed581ffe5595878338a8c9c55bd7acc87e03d30a4d3ca4a03c3f8db66ddc  kodi-screensaver-pyro-1.1.0.tar.gz
+sha256 55f867b703e5cf409f8e0a8a2c34373f896feb990004b5901b4efaee905d42e5  kodi-screensaver-pyro-3.0.0-Leia.tar.gz
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 4d6b1f72d3..7b3b63ab7f 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 1.1.0
-KODI_SCREENSAVER_PYRO_SITE = $(call github,notspiff,screensaver.pyro,v$(KODI_SCREENSAVER_PYRO_VERSION))
+KODI_SCREENSAVER_PYRO_VERSION = 3.0.0-Leia
+KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
 KODI_SCREENSAVER_PYRO_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-stars/Config.in b/package/kodi-screensaver-stars/Config.in
index bcfb47b2cc..a2e435c0f6 100644
--- a/package/kodi-screensaver-stars/Config.in
+++ b/package/kodi-screensaver-stars/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_STARS
 	help
 	  Starfield screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.stars
+	  https://github.com/xbmc/screensaver.stars
 
 comment "kodi-screensaver-stars needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 63335742b2..e3e0ca933a 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 525caac94fd2bd858daf9fa7719eea4181c168e5c692bb896689625bf4437d32  kodi-screensaver-stars-1.1.0.tar.gz
+sha256 dca39e68d803cca3c1d9524df17feb3e12fc7eeae4166c6311a97dc68c29f523  kodi-screensaver-stars-2.1.3-Leia.tar.gz
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index 19e9db7194..a23f4d93f7 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 1.1.0
-KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,v$(KODI_SCREENSAVER_STARS_VERSION))
+KODI_SCREENSAVER_STARS_VERSION = 2.1.3-Leia
+KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
 KODI_SCREENSAVER_STARS_DEPENDENCIES = kodi
