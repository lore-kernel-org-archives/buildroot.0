From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 25 Oct 2018 20:33:41 +0200
Subject: [Buildroot] [PATCH 1/1] libupnp18: bump to version 1.8.4
Message-ID: <20181025183341.16617-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace LICENSE by COPYING, see:
https://github.com/mrjimenez/pupnp/commit/d3a04002e5e5220f88b43d979505bb3156532e83

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnp18/libupnp18.hash | 8 ++++----
 package/libupnp18/libupnp18.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libupnp18/libupnp18.hash b/package/libupnp18/libupnp18.hash
index dd59034cd3..c32ebef739 100644
--- a/package/libupnp18/libupnp18.hash
+++ b/package/libupnp18/libupnp18.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/pupnp/files/pupnp/libUPnP%201.8.3/libupnp-1.8.3.tar.bz2.sha1
-sha1 e7c28c24905ae972ff3277a7bdaa9b839f6c66b9  libupnp-1.8.3.tar.bz2
+# From https://sourceforge.net/projects/pupnp/files/pupnp/libupnp-1.8.4/libupnp-1.8.4.tar.bz2.sha1
+sha1 93e7b3c94cf53eb59533b4b7b137ef5cc651e28b  libupnp-1.8.4.tar.bz2
 # Locally computed:
-sha256	9afa0b09faa9ebd9e8a6425ddbfe8d1d856544c49b1f86fde221219e569a308d	libupnp-1.8.3.tar.bz2
-sha256	0375955c8a79d6e8fa0792d45d00fc4e7710d7ac95bcbd27f9225a83f5c946fd	LICENSE
+sha256	188d3f786d92fe14191f17634d2d87847eee7d2b568a5257ea23262fec9973d6	libupnp-1.8.4.tar.bz2
+sha256	c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3	COPYING
diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
index 07ef4382f0..13536b8f7a 100644
--- a/package/libupnp18/libupnp18.mk
+++ b/package/libupnp18/libupnp18.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBUPNP18_VERSION = 1.8.3
+LIBUPNP18_VERSION = 1.8.4
 LIBUPNP18_SOURCE = libupnp-$(LIBUPNP18_VERSION).tar.bz2
-LIBUPNP18_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP18_VERSION)
+LIBUPNP18_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libupnp-$(LIBUPNP18_VERSION)
 LIBUPNP18_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP18_INSTALL_STAGING = YES
 LIBUPNP18_LICENSE = BSD-3-Clause
-LIBUPNP18_LICENSE_FILES = LICENSE
+LIBUPNP18_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUPNP18_CONF_OPTS += --enable-open-ssl
-- 
2.17.1
