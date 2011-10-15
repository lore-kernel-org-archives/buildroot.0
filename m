From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:23 -0300
Subject: [Buildroot] [PATCH 09/25] dash: bump to version 0.5.7-2 and style
	cleanup
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ch => dash-0.5.7-no-config.h-for-helpers.patch} |    0
 package/dash/dash.mk                               |    9 +++++----
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename package/dash/{dash-0.5.5.1-no-config.h-for-helpers.patch => dash-0.5.7-no-config.h-for-helpers.patch} (100%)

diff --git a/package/dash/dash-0.5.5.1-no-config.h-for-helpers.patch b/package/dash/dash-0.5.7-no-config.h-for-helpers.patch
similarity index 100%
rename from package/dash/dash-0.5.5.1-no-config.h-for-helpers.patch
rename to package/dash/dash-0.5.7-no-config.h-for-helpers.patch
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index db2d4e5..26c6431 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -3,10 +3,11 @@
 # dash
 #
 #############################################################
-DASH_VERSION:=0.5.5.1
-DASH_SOURCE:=dash_$(DASH_VERSION).orig.tar.gz
-DASH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
-DASH_PATCH:=dash_$(DASH_VERSION)-6.diff.gz
+
+DASH_VERSION = 0.5.7
+DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
+DASH_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
+DASH_PATCH = dash_$(DASH_VERSION)-2.diff.gz
 
 define DASH_INSTALL_TARGET_CMDS
 	cp -a $(@D)/src/dash $(TARGET_DIR)/bin/dash
-- 
1.7.3.4
