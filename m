From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 12:38:20 +0200
Subject: [Buildroot] [PATCH 1/1] liboping: bump to version 1.10.0
Message-ID: <20180520103820.17981-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Rework ncurses dependency to use new --with[out]-ncurses option
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liboping/liboping.hash |  5 ++++-
 package/liboping/liboping.mk   | 10 ++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/liboping/liboping.hash b/package/liboping/liboping.hash
index 3e796cca62..926b234f05 100644
--- a/package/liboping/liboping.hash
+++ b/package/liboping/liboping.hash
@@ -1,2 +1,5 @@
 # From http://noping.cc/#download
-sha256	44bb1d88b56b88fda5533edb3aa005c69b3cd396f20453a157d7e31e536f3530	liboping-1.9.0.tar.bz2
+sha256	eb38aa93f93e8ab282d97e2582fbaea88b3f889a08cbc9dbf20059c3779d5cd8	liboping-1.10.0.tar.bz2
+
+# Hash for license file:
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index 114e0c27e5..4aa3e30ee8 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -4,13 +4,19 @@
 #
 ################################################################################
 
-LIBOPING_VERSION = 1.9.0
+LIBOPING_VERSION = 1.10.0
 LIBOPING_SITE = http://noping.cc/files
 LIBOPING_SOURCE = liboping-$(LIBOPING_VERSION).tar.bz2
 LIBOPING_INSTALL_STAGING = YES
-LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPTS = --without-perl-bindings
 LIBOPING_LICENSE = LGPL-2.1+, GPL-2.0
 LIBOPING_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+LIBOPING_DEPENDENCIES += ncurses
+LIBOPING_CONF_OPTS += --with-ncurses
+else
+LIBOPING_CONF_OPTS += --without-ncurses
+endif
+
 $(eval $(autotools-package))
-- 
2.14.1
