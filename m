From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:08:10 +0200
Subject: [Buildroot] [git commit] libcue: bump to version 2.2.0
Message-ID: <20180429161010.3EB36890F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=460a0289e3d47215fb84cfba861e05f92ccc3b61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to cmake infrastructure
COPYING has been replaced by LICENSE
Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcue/libcue.hash |  3 ++-
 package/libcue/libcue.mk   | 15 +++------------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/libcue/libcue.hash b/package/libcue/libcue.hash
index 779cda0d66..1793ce7ab3 100644
--- a/package/libcue/libcue.hash
+++ b/package/libcue/libcue.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256	c3c46d58cebf15b3fe07e6f649014694d338ddd880e941bfb1fd3cedae66c62f	libcue-v1.4.0.tar.gz
+sha256	328f14b8ae0a6b8d4c96928b53b88a86d72a354b4da9d846343c78ba36022879	libcue-v2.2.0.tar.gz
+sha256	c388d36583fa54e13b6d73ad924d0b68d073ed8a5771e17cb49104705df4504f	LICENSE
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index 7f8e45ecec..65bdd79ac5 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -4,20 +4,11 @@
 #
 ################################################################################
 
-LIBCUE_VERSION = v1.4.0
+LIBCUE_VERSION = v2.2.0
 LIBCUE_SITE = $(call github,lipnitsk,libcue,$(LIBCUE_VERSION))
 LIBCUE_LICENSE = GPL-2.0, BSD-2-Clause (rem.c)
-LIBCUE_LICENSE_FILES = COPYING
+LIBCUE_LICENSE_FILES = LICENSE
 LIBCUE_DEPENDENCIES = host-bison host-flex flex
 LIBCUE_INSTALL_STAGING = YES
-LIBCUE_AUTORECONF = YES
 
-LIBCUE_MAKE = $(MAKE1)
-
-# Needed for autoreconf
-define LIBCUE_MAKE_CONFIG_DIR
-	mkdir $(@D)/config
-endef
-LIBCUE_POST_EXTRACT_HOOKS += LIBCUE_MAKE_CONFIG_DIR
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
