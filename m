From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Nov 2019 08:45:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/newt: bump version to 0.52.21
Message-ID: <20191104074504.22316-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://pagure.io/newt/blob/master/f/CHANGES

Removed MAKE1 after upstream fixed parallel build.

Added upstream provided hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/newt/newt.hash | 5 ++++-
 package/newt/newt.mk   | 3 +--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index b6fd317ce3..b136d82af1 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,2 +1,5 @@
+# From https://releases.pagure.org/newt/CHECKSUMS
+sha256 265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac5abb31  newt-0.52.21.tar.gz
+sha512 d53d927996d17223e688bf54dccfabb2a3dc02bfe38ffc455964e86feaca3cd9f9ab5b19774433be430fa4d761cd9b6680b558f297acb86f80daeb6942f7d23c  newt-0.52.21.tar.gz
 # Locally calculated
-sha256 8d66ba6beffc3f786d4ccfee9d2b43d93484680ef8db9397a4fb70b5adbb6dbc  newt-0.52.20.tar.gz
+sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index b6d973af75..b39acb0fcf 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWT_VERSION = 0.52.20
+NEWT_VERSION = 0.52.21
 NEWT_SITE = https://pagure.io/releases/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
@@ -12,7 +12,6 @@ NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
 # library, and does not link against libintl.
 NEWT_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 NEWT_CONF_OPTS = --without-python --without-tcl
-NEWT_MAKE = $(MAKE1)
 NEWT_LICENSE = GPL-2.0
 NEWT_LICENSE_FILES = COPYING
 
-- 
2.20.1
