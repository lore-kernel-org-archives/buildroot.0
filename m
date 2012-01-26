From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 13:51:25 -0300
Subject: [Buildroot] [PATCH 06/13] expat: fix style and drop stray file
In-Reply-To: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327596692-30728-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/expat/Makefile.in |    3 ---
 package/expat/expat.mk    |    3 ---
 2 files changed, 0 insertions(+), 6 deletions(-)
 delete mode 100644 package/expat/Makefile.in

diff --git a/package/expat/Makefile.in b/package/expat/Makefile.in
deleted file mode 100644
index 1d5d6bc..0000000
--- a/package/expat/Makefile.in
+++ /dev/null
@@ -1,3 +0,0 @@
-ifeq ($(BR2_PACKAGE_EXPAT),y)
-TARGETS+=expat
-endif
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 64a1416..b179383 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -5,13 +5,10 @@
 #############################################################
 
 EXPAT_VERSION = 2.0.1
-EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.gz
 EXPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
 EXPAT_INSTALL_STAGING = YES
-EXPAT_INSTALL_TARGET = YES
 EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
-
 EXPAT_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
