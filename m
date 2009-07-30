From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2009 17:04:30 +0200
Subject: [Buildroot] [git commit] makefile: remove unused
	AUTO_CONFIGURE_OPTS variable
Message-ID: <20090730150447.9274877804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4e9807a645c11e914ae7bb64e7f6e9a732ad4848
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AUTO_CONFIGURE_OPTS is not used anywhere in the tree. autoconf
based packages should used the Makefile.autotools.in machinery
instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index f0dc47a..3dcdfe1 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -210,16 +210,6 @@ HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
 GNU_HOST_NAME:=$(HOST_ARCH)-$(subst ",,$(BR2_GNU_BUILD_SUFFIX))
 #")
 
-AUTO_CONFIGURE_TARGET=\
-	$(TARGET_CONFIGURE_OPTS) \
-	$(TARGET_CONFIGURE_ARGS) \
-	$(TARGET_CONFIGURE_ENV) \
-	$(if $(THIS_SRCDIR),$(THIS_SRCDIR)/,./)configure \
-		$(if $(BR2_CONFIG_CACHE),--cache-file="$(PROJECT_BUILD_DIR)/tgt-config.cache",) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME)
-
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
-- 
1.6.3.3
