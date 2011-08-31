From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:35:02 +0200
Subject: [Buildroot] [PATCH 3/7] support: move scripts/ to a new support/
	directory
In-Reply-To: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
Message-ID: <da984f60aee9d89e1e66135d7744873433a4bc6d.1314826483.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                     |    6 +++---
 {scripts => support/scripts}/build-ext3-img  |    0
 {scripts => support/scripts}/copy.sh         |    0
 {scripts => support/scripts}/graph-depends   |    0
 {scripts => support/scripts}/mkmakefile      |    0
 {scripts => support/scripts}/pkg-stats       |    0
 {scripts => support/scripts}/setlocalversion |    0
 7 files changed, 3 insertions(+), 3 deletions(-)
 rename {scripts => support/scripts}/build-ext3-img (100%)
 rename {scripts => support/scripts}/copy.sh (100%)
 rename {scripts => support/scripts}/graph-depends (100%)
 rename {scripts => support/scripts}/mkmakefile (100%)
 rename {scripts => support/scripts}/pkg-stats (100%)
 rename {scripts => support/scripts}/setlocalversion (100%)

diff --git a/Makefile b/Makefile
index 9ed46fc..f29295f 100644
--- a/Makefile
+++ b/Makefile
@@ -37,7 +37,7 @@ DATE:=$(shell date +%Y%m%d)
 
 # Compute the full local version string so packages can use it as-is
 # Need to export it, so it can be got from environment in children (eg. mconf)
-export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion)
+export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
@@ -425,7 +425,7 @@ erase-fakeroots:
 
 target-finalize:
 ifeq ($(BR2_HAVE_DEVFILES),y)
-	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
+	( support/scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/aclocal
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
@@ -607,7 +607,7 @@ endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 # output directory.
 outputmakefile:
 ifeq ($(NEED_WRAPPER),y)
-	$(Q)$(TOPDIR)/scripts/mkmakefile $(TOPDIR) $(O)
+	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
 clean:
diff --git a/scripts/build-ext3-img b/support/scripts/build-ext3-img
similarity index 100%
rename from scripts/build-ext3-img
rename to support/scripts/build-ext3-img
diff --git a/scripts/copy.sh b/support/scripts/copy.sh
similarity index 100%
rename from scripts/copy.sh
rename to support/scripts/copy.sh
diff --git a/scripts/graph-depends b/support/scripts/graph-depends
similarity index 100%
rename from scripts/graph-depends
rename to support/scripts/graph-depends
diff --git a/scripts/mkmakefile b/support/scripts/mkmakefile
similarity index 100%
rename from scripts/mkmakefile
rename to support/scripts/mkmakefile
diff --git a/scripts/pkg-stats b/support/scripts/pkg-stats
similarity index 100%
rename from scripts/pkg-stats
rename to support/scripts/pkg-stats
diff --git a/scripts/setlocalversion b/support/scripts/setlocalversion
similarity index 100%
rename from scripts/setlocalversion
rename to support/scripts/setlocalversion
-- 
1.7.4.1
