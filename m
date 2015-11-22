From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 23:00:28 +0100
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20151201232120.831307FFC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9c6f73d4bf35981fee8eb7eb4e905b39390ffb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/0001-no-check_config.patch | 2 +-
 package/tvheadend/tvheadend.mk               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/0001-no-check_config.patch b/package/tvheadend/0001-no-check_config.patch
index c77ca76..6a0cddd 100644
--- a/package/tvheadend/0001-no-check_config.patch
+++ b/package/tvheadend/0001-no-check_config.patch
@@ -16,7 +16,7 @@ diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvhe
  	$(ROOTDIR)/configure $(CONFIGURE_ARGS)
  
  # Binary
--${PROG}: check_config make_webui $(OBJS)
+-${PROG}: .config.mk make_webui $(OBJS)
 +${PROG}: make_webui $(OBJS)
  	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
  
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 6b8fdea..60ca524 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = a27b0af2b82dae83cf8a41e01ee1174b911f3aa3
+TVHEADEND_VERSION = 8902dcbcc48b6a76168882a856111237f13e60ea
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
