From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:46:54 +0200
Subject: [Buildroot] [git commit] package/alsa-utils: bump to version 1.1.9
Message-ID: <20190622154812.EC321834A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85d91c343bb4455f284d7e9a8b71a8e324e98f3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove the patch that have been upstreamed

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-topology.c-drop-unneeded-dlfcn.h-include.patch | 29 ----------------------
 package/alsa-utils/alsa-utils.hash                 |  2 +-
 package/alsa-utils/alsa-utils.mk                   |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/package/alsa-utils/0001-topology-topology.c-drop-unneeded-dlfcn.h-include.patch b/package/alsa-utils/0001-topology-topology.c-drop-unneeded-dlfcn.h-include.patch
deleted file mode 100644
index 2a8be0b0b7..0000000000
--- a/package/alsa-utils/0001-topology-topology.c-drop-unneeded-dlfcn.h-include.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4c9462a5ef2f680b24ddf6bae7ac7c693fa6a136 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 1 Nov 2018 15:15:31 +0100
-Subject: [PATCH] topology/topology.c: drop unneeded <dlfcn.h> include
-
-This include is not used/needed and prevents building on systems that
-don't provide <dlfcn.h>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: http://mailman.alsa-project.org/pipermail/alsa-devel/2018-November/141375.html
----
- topology/topology.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/topology/topology.c b/topology/topology.c
-index 097c255..b72e341 100644
---- a/topology/topology.c
-+++ b/topology/topology.c
-@@ -27,7 +27,6 @@
- #include <errno.h>
- #include <string.h>
- #include <sys/stat.h>
--#include <dlfcn.h>
- #include <getopt.h>
- #include <assert.h>
- 
--- 
-2.14.4
-
diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index f0468fb886..d354e3cf96 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1db27fb54ab7fdeb54b00d68b8a174808ffea198cfbd67e3c959482194e1540a  alsa-utils-1.1.7.tar.bz2
+sha256 5ddf2cbddb4bd1a4a2a6492a09c25898b08c3ad64893c3655be14194cf0a213a  alsa-utils-1.1.9.tar.bz2
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index b5c36e0a46..b5d0d75250 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.1.7
+ALSA_UTILS_VERSION = 1.1.9
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
