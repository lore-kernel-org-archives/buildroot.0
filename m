From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 20 Dec 2015 18:03:25 -0300
Subject: [Buildroot] [PATCH] ifupdown: bump to version 0.8.2
Message-ID: <1450645405-19590-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ifupdown/ifupdown.hash | 4 ++--
 package/ifupdown/ifupdown.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ifupdown/ifupdown.hash b/package/ifupdown/ifupdown.hash
index f0c314b..02dfd2b 100644
--- a/package/ifupdown/ifupdown.hash
+++ b/package/ifupdown/ifupdown.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.7.49.dsc
-sha256	5d07c73610ff90393c7273e2af9003eeb1825fc88144ae5ed11a5517547d0f58	ifupdown_0.7.49.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.2.dsc
+sha256	edb08f935fea9bc376c3faa0140c04c7a4d4ef5f22fd280ec4060386a75df10b	ifupdown_0.8.2.tar.xz
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index 5c78eed..7fbd003 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-IFUPDOWN_VERSION = 0.7.49
+IFUPDOWN_VERSION = 0.8.2
 IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
-IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20140923T221921Z/pool/main/i/ifupdown
+IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20151205T042642Z/pool/main/i/ifupdown
 IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 IFUPDOWN_LICENSE = GPLv2+
 IFUPDOWN_LICENSE_FILES = COPYING
 
 define IFUPDOWN_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -D'IFUPDOWN_VERSION=\"$(IFUPDOWN_VERSION)\"'" \
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -D'IFUPDOWN_VERSION=\"$(IFUPDOWN_VERSION)\"'" \
 		-C $(@D)
 endef
 
-- 
2.4.10
