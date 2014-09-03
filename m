From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  3 Sep 2014 21:48:11 +0200
Subject: [Buildroot] [PATCH] package/tvheadend: Bump version
In-Reply-To: <1409773691-13668-1-git-send-email-bernd.kuhls@t-online.de>
References: <1409773691-13668-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1409773691-13668-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend-003-remove-werror.patch |    2 +-
 package/tvheadend/tvheadend.mk                      |    2 +-
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
-- 
1.7.10.4
