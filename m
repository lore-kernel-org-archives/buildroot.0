From: Paul Cercueil <paul@crapouillou.net>
Date: Thu,  3 Apr 2014 23:01:17 +0200
Subject: [Buildroot] [PATCH 07/11] fmtools: Switch to 2.x series
In-Reply-To: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
Message-ID: <1396558881-29631-7-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maarten ter Huurne <maarten@treewalker.org>

Specifically, bump version to 2.0.1.
The 2.x series uses the V4L2 API instead of V4L.

Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
Acked-By: Paul Cercueil <paul@crapouillou.net>
---
 package/fmtools/Config.in  |  4 ++--
 package/fmtools/fmtools.mk | 15 +++------------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/package/fmtools/Config.in b/package/fmtools/Config.in
index 1591618..182b517 100644
--- a/package/fmtools/Config.in
+++ b/package/fmtools/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_FMTOOLS
 	bool "fmtools"
 	help
 	  fmtools is a pair of simple command-line utilities for
-	  "video4linux" radio tuner cards under Linux. It includes
+	  "video4linux2" radio tuner cards under Linux. It includes
 	  fm for power control, tuning, and volume and fmscan for
 	  scanning for stations.
 
-	  http://www.stanford.edu/~blp/fmtools/
+	  http://benpfaff.org/fmtools/
diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
index 5f305b9..bacd73c 100644
--- a/package/fmtools/fmtools.mk
+++ b/package/fmtools/fmtools.mk
@@ -4,18 +4,9 @@
 #
 ################################################################################
 
-FMTOOLS_VERSION = 1.0.2
-FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools/
+FMTOOLS_VERSION = 2.0.1
+FMTOOLS_SITE = http://benpfaff.org/fmtools
 FMTOOLS_LICENSE = GPLv2+
 FMTOOLS_LICENSE_FILES = COPYING
 
-define FMTOOLS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define FMTOOLS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/fm $(TARGET_DIR)/usr/sbin/fm
-	$(INSTALL) -D -m 0755 $(@D)/fmscan $(TARGET_DIR)/usr/sbin/fmscan
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
1.9.0
