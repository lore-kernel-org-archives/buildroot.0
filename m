From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 12:45:42 +0200
Subject: [Buildroot] [git commit] dash: bump to version 0.5.8-1
Message-ID: <20141012105052.B378AB23B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a0990c4088635ab4869849b79870c8b781fc5b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file and use $(INSTALL) instead of cp for proper mode handling.

[Peter: drop /bin/sh handling as we're going to handle it globally]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tch => dash-0001-no-config.h-for-helpers.patch} |    0
 package/dash/dash.hash                             |    3 +++
 package/dash/dash.mk                               |    6 +++---
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/dash/dash-0.5.7-no-config.h-for-helpers.patch b/package/dash/dash-0001-no-config.h-for-helpers.patch
similarity index 100%
rename from package/dash/dash-0.5.7-no-config.h-for-helpers.patch
rename to package/dash/dash-0001-no-config.h-for-helpers.patch
diff --git a/package/dash/dash.hash b/package/dash/dash.hash
new file mode 100644
index 0000000..0198cd8
--- /dev/null
+++ b/package/dash/dash.hash
@@ -0,0 +1,3 @@
+# From http://ftp.debian.org/debian/pool/main/d/dash/dash_0.5.8-1.dsc
+sha256	c6db3a237747b02d20382a761397563d813b306c020ae28ce25a1c3915fac60f	dash_0.5.8.orig.tar.gz
+sha256	d751769cc1ef8b825a177e782f1cd3e35bde7c268107fa4febf8d235e12c64d9	dash_0.5.8-1.diff.gz
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 5bc0835..656748c 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.7
+DASH_VERSION = 0.5.8
 DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
 DASH_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
-DASH_PATCH = dash_$(DASH_VERSION)-3.diff.gz
+DASH_PATCH = dash_$(DASH_VERSION)-1.diff.gz
 DASH_LICENSE = BSD-3c, GPLv2+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
 define DASH_INSTALL_TARGET_CMDS
-	cp -a $(@D)/src/dash $(TARGET_DIR)/bin/dash
+	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
 endef
 
 $(eval $(autotools-package))
