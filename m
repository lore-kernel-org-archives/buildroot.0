From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:06:09 +0200
Subject: [Buildroot] [git commit] dash: bump to version 0.5.7-2 and style
	cleanup
Message-ID: <20111015213657.4AD6A8E273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c4b16f06298698b227a2bce1cf8de9b160f0007
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ch => dash-0.5.7-no-config.h-for-helpers.patch} |    0
 package/dash/dash.mk                               |    9 +++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

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
