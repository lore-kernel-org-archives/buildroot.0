From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Feb 2021 22:49:39 +0100
Subject: [Buildroot] [PATCH] configs: rename a bunch of friendlyarm boards
Message-ID: <20210228214939.2809066-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have defconfigs for quite a few friendlyarm boards, but the
naming for the defconfigs for those boards is inconsistent: some
start with 'friendlyarm_' while others don't.

Although the number of boards starting with 'friendlyarm_' is
less than those which do not, we still choose to rename the
boards so all have the 'friendlyarm_' prefix.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Chakra Divi <chakra@openedev.com>
Cc: Davide Viti <zinosat@gmail.com>
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
---
 DEVELOPERS                                         | 14 +++++++-------
 board/friendlyarm/nanopc-t4/readme.txt             |  2 +-
 board/friendlyarm/nanopi-m1-plus/readme.txt        |  2 +-
 board/friendlyarm/nanopi-m1/readme.txt             |  2 +-
 board/friendlyarm/nanopi-m4/readme.txt             |  2 +-
 board/friendlyarm/nanopi-neo/readme.txt            |  2 +-
 board/friendlyarm/nanopi-neo4/readme.txt           |  2 +-
 board/friendlyarm/nanopi-r1/readme.txt             |  2 +-
 ...4_defconfig => friendlyarm_nanopc_t4_defconfig} |  0
 ...1_defconfig => friendlyarm_nanopi_m1_defconfig} |  0
 ...config => friendlyarm_nanopi_m1_plus_defconfig} |  0
 ...4_defconfig => friendlyarm_nanopi_m4_defconfig} |  0
 ...defconfig => friendlyarm_nanopi_neo4_defconfig} |  0
 ..._defconfig => friendlyarm_nanopi_neo_defconfig} |  0
 ...1_defconfig => friendlyarm_nanopi_r1_defconfig} |  0
 15 files changed, 14 insertions(+), 14 deletions(-)
 rename configs/{nanopc_t4_defconfig => friendlyarm_nanopc_t4_defconfig} (100%)
 rename configs/{nanopi_m1_defconfig => friendlyarm_nanopi_m1_defconfig} (100%)
 rename configs/{nanopi_m1_plus_defconfig => friendlyarm_nanopi_m1_plus_defconfig} (100%)
 rename configs/{nanopi_m4_defconfig => friendlyarm_nanopi_m4_defconfig} (100%)
 rename configs/{nanopi_neo4_defconfig => friendlyarm_nanopi_neo4_defconfig} (100%)
 rename configs/{nanopi_neo_defconfig => friendlyarm_nanopi_neo_defconfig} (100%)
 rename configs/{nanopi_r1_defconfig => friendlyarm_nanopi_r1_defconfig} (100%)

diff --git a/DEVELOPERS b/DEVELOPERS
index b019fe04d5..0c48236da4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -492,8 +492,8 @@ F:	board/friendlyarm/nanopi-m1
 F:	board/friendlyarm/nanopi-m1-plus
 F:	board/olimex/a13_olinuxino
 F:	board/orangepi/orangepi-plus
-F:	configs/nanopi_m1_defconfig
-F:	configs/nanopi_m1_plus_defconfig
+F:	configs/friendlyarm_nanopi_m1_defconfig
+F:	configs/friendlyarm_nanopi_m1_plus_defconfig
 F:	configs/olimex_a13_olinuxino_defconfig
 F:	configs/orangepi_plus_defconfig
 
@@ -662,7 +662,7 @@ F:	package/ev3dev-linux-drivers/
 
 N:	Davide Viti <zinosat@gmail.com>
 F:	board/friendlyarm/nanopi-r1/
-F:	configs/nanopi_r1_defconfig
+F:	configs/friendlyarm_nanopi_r1_defconfig
 F:	package/flann/
 F:	package/python-paho-mqtt/
 F:	package/qhull/
@@ -1642,7 +1642,7 @@ F:	utils/diffconfig
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	board/friendlyarm/nanopi-neo4/
-F:	configs/nanopi_neo4_defconfig
+F:	configs/friendlyarm_nanopi_neo4_defconfig
 F:	package/libatasmart/
 F:	package/polkit/
 F:	package/sg3_utils/
@@ -2483,8 +2483,8 @@ F:	board/pine64/rockpro64
 F:	board/radxa/rockpi-4
 F:	board/radxa/rockpi-n8
 F:	board/radxa/rockpi-n10
-F: 	configs/nanopc_t4_defconfig
-F: 	configs/nanopi_m4_defconfig
+F: 	configs/friendlyarm_nanopc_t4_defconfig
+F: 	configs/friendlyarm_nanopi_m4_defconfig
 F:	configs/orangepi_rk3399_defconfig
 F:	configs/roc_pc_rk3399_defconfig
 F:	configs/rock_pi_4_defconfig
@@ -2722,7 +2722,7 @@ F:	package/open62541/
 
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
 F:	board/friendlyarm/nanopi-neo/
-F:	configs/nanopi_neo_defconfig
+F:	configs/friendlyarm_nanopi_neo_defconfig
 F:	fs/squashfs/
 F:	package/asterisk/
 F:	package/cegui/
diff --git a/board/friendlyarm/nanopc-t4/readme.txt b/board/friendlyarm/nanopc-t4/readme.txt
index 6259c9e756..0989c6cc1e 100644
--- a/board/friendlyarm/nanopc-t4/readme.txt
+++ b/board/friendlyarm/nanopc-t4/readme.txt
@@ -3,7 +3,7 @@ FriendlyARM NANOPC-T4
 
 Build:
 
-  $ make nanopc_t4_defconfig
+  $ make friendlyarm_nanopc_t4_defconfig
   $ make
 
 Files created in output directory
diff --git a/board/friendlyarm/nanopi-m1-plus/readme.txt b/board/friendlyarm/nanopi-m1-plus/readme.txt
index 3e16c8afad..0327dec80e 100644
--- a/board/friendlyarm/nanopi-m1-plus/readme.txt
+++ b/board/friendlyarm/nanopi-m1-plus/readme.txt
@@ -12,7 +12,7 @@ How to build it
 
 Configure Buildroot:
 
-    $ make nanopi_m1_plus_defconfig
+    $ make friendlyarm_nanopi_m1_plus_defconfig
 
 Compile everything and build the SD card image:
 
diff --git a/board/friendlyarm/nanopi-m1/readme.txt b/board/friendlyarm/nanopi-m1/readme.txt
index 8b10e4b7ce..6a34c4239d 100644
--- a/board/friendlyarm/nanopi-m1/readme.txt
+++ b/board/friendlyarm/nanopi-m1/readme.txt
@@ -12,7 +12,7 @@ How to build it
 
 Configure Buildroot:
 
-    $ make nanopi_m1_defconfig
+    $ make friendlyarm_nanopi_m1_defconfig
 
 Compile everything and build the SD card image:
 
diff --git a/board/friendlyarm/nanopi-m4/readme.txt b/board/friendlyarm/nanopi-m4/readme.txt
index 4a606cf97a..0553bf8377 100644
--- a/board/friendlyarm/nanopi-m4/readme.txt
+++ b/board/friendlyarm/nanopi-m4/readme.txt
@@ -3,7 +3,7 @@ FriendlyARM NANOPI-M4
 
 Build:
 
-  $ make nanopi_m4_defconfig
+  $ make friendlyarm_nanopi_m4_defconfig
   $ make
 
 Files created in output directory
diff --git a/board/friendlyarm/nanopi-neo/readme.txt b/board/friendlyarm/nanopi-neo/readme.txt
index 539df541d8..84fb9cc484 100644
--- a/board/friendlyarm/nanopi-neo/readme.txt
+++ b/board/friendlyarm/nanopi-neo/readme.txt
@@ -24,7 +24,7 @@ yet upstream, but are being actively worked on.
 How to build
 ============
 
-    $ make nanopi_neo_defconfig
+    $ make friendlyarm_nanopi_neo_defconfig
     $ make
 
 Note: you will need access to the internet to download the required
diff --git a/board/friendlyarm/nanopi-neo4/readme.txt b/board/friendlyarm/nanopi-neo4/readme.txt
index 07e3491459..7c04a52806 100644
--- a/board/friendlyarm/nanopi-neo4/readme.txt
+++ b/board/friendlyarm/nanopi-neo4/readme.txt
@@ -12,7 +12,7 @@ Build
 
 Run NanoPi Neo4 configuration
 
-  $ make nanopi_neo4_defconfig
+  $ make friendlyarm_nanopi_neo4_defconfig
 
 To build, run make comamnd.
 
diff --git a/board/friendlyarm/nanopi-r1/readme.txt b/board/friendlyarm/nanopi-r1/readme.txt
index 0ff63df3c7..fa3114fc83 100644
--- a/board/friendlyarm/nanopi-r1/readme.txt
+++ b/board/friendlyarm/nanopi-r1/readme.txt
@@ -12,7 +12,7 @@ How to build it
 
 Configure Buildroot:
 
-    $ make nanopi_r1_defconfig
+    $ make friendlyarm_nanopi_r1_defconfig
 
 Compile everything and build the SD card image:
 
diff --git a/configs/nanopc_t4_defconfig b/configs/friendlyarm_nanopc_t4_defconfig
similarity index 100%
rename from configs/nanopc_t4_defconfig
rename to configs/friendlyarm_nanopc_t4_defconfig
diff --git a/configs/nanopi_m1_defconfig b/configs/friendlyarm_nanopi_m1_defconfig
similarity index 100%
rename from configs/nanopi_m1_defconfig
rename to configs/friendlyarm_nanopi_m1_defconfig
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/friendlyarm_nanopi_m1_plus_defconfig
similarity index 100%
rename from configs/nanopi_m1_plus_defconfig
rename to configs/friendlyarm_nanopi_m1_plus_defconfig
diff --git a/configs/nanopi_m4_defconfig b/configs/friendlyarm_nanopi_m4_defconfig
similarity index 100%
rename from configs/nanopi_m4_defconfig
rename to configs/friendlyarm_nanopi_m4_defconfig
diff --git a/configs/nanopi_neo4_defconfig b/configs/friendlyarm_nanopi_neo4_defconfig
similarity index 100%
rename from configs/nanopi_neo4_defconfig
rename to configs/friendlyarm_nanopi_neo4_defconfig
diff --git a/configs/nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
similarity index 100%
rename from configs/nanopi_neo_defconfig
rename to configs/friendlyarm_nanopi_neo_defconfig
diff --git a/configs/nanopi_r1_defconfig b/configs/friendlyarm_nanopi_r1_defconfig
similarity index 100%
rename from configs/nanopi_r1_defconfig
rename to configs/friendlyarm_nanopi_r1_defconfig
-- 
2.25.1
