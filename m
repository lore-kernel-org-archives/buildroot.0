From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Sep 2014 17:25:17 +0200
Subject: [Buildroot] [git commit] package/tvheadend: Bump version
Message-ID: <20140904152909.A8B139D5CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d6adb4bc37241efd5143d38a7dcec675878b460
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tvheadend/tvheadend-003-remove-werror.patch    |    2 +-
 package/tvheadend/tvheadend.mk                     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend-003-remove-werror.patch b/package/tvheadend/tvheadend-003-remove-werror.patch
index 039e0e0..624ca3a 100644
--- a/package/tvheadend/tvheadend-003-remove-werror.patch
+++ b/package/tvheadend/tvheadend-003-remove-werror.patch
@@ -8,7 +8,7 @@ diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvhe
 @@ -28,7 +28,7 @@
  #
  
- CFLAGS  += -g -O2
+ CFLAGS  += -g -O2 -Wunused-result
 -CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
 +CFLAGS  += -Wall -Wwrite-strings -Wno-deprecated-declarations
  CFLAGS  += -Wmissing-prototypes
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index bd52ecd..cd346dd 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = f72733ff08be069620e7247e191d4f0899a2638a
+TVHEADEND_VERSION = ca742e00a7717787351e1a432ca9b41f93369d60
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
