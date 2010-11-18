From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 18 Nov 2010 05:26:36 -0500
Subject: [Buildroot] [PATCH] add some simple "config & build" board shortcuts
Message-ID: <1290075996-31465-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I like to be able to do `make foo` and have buildroot build up an image
for the board named "foo".  This saves me from having to do a full clean,
config, and make cycle.  Yes, I am that lazy :P.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 0396e37..f6d82df 100644
--- a/Makefile
+++ b/Makefile
@@ -562,6 +562,11 @@ source-check: allyesconfig
 
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
+%: $(TOPDIR)/configs/%_defconfig
+	$(MAKE) clean
+	$(MAKE) $@_defconfig
+	$(MAKE)
+
 #############################################################
 #
 # Cleanup and misc junk
@@ -638,4 +643,3 @@ release:
 	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
 
 .PHONY: $(noconfig_targets)
-
-- 
1.7.3.2
