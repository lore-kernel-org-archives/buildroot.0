From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 18 Jun 2013 14:22:34 -0700
Subject: [Buildroot] [PATCH] socketcand: bump to version 0.3.1
Message-ID: <1371590554-12702-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 0.3.0, libconfig has been made optional

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/socketcand/Config.in     |    1 -
 package/socketcand/socketcand.mk |    7 ++++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/socketcand/Config.in b/package/socketcand/Config.in
index d5d02de..72315c0 100644
--- a/package/socketcand/Config.in
+++ b/package/socketcand/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SOCKETCAND
 	bool "socketcand"
-	select BR2_PACKAGE_LIBCONFIG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Socketcand is a daemon that provides access to CAN interfaces
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index d85eb1a..8e42698 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,9 +4,14 @@
 #
 ################################################################################
 
-SOCKETCAND_VERSION = 7d06986
+SOCKETCAND_VERSION = dc3437ab
 SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/$(SOCKETCAND_VERSION)
 SOCKETCAND_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SOCKETCAND_DEPENDENCIES = libconfig
+else
+SOCKETCAND_CONF_OPT = --without-config
+endif
 
 $(eval $(autotools-package))
-- 
1.7.4.1
