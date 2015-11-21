From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2015 20:40:34 +0100
Subject: [Buildroot] [PATCH/next 7/8] package/tvheadend: bump version
In-Reply-To: <1448134835-27519-1-git-send-email-bernd.kuhls@t-online.de>
References: <1448134835-27519-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1448134835-27519-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.6.2
