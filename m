From: Simon Marchi <simon.marchi@polymtl.ca>
Date: Thu, 19 Feb 2015 16:44:30 -0500
Subject: [Buildroot] [PATCH] libmicrohttpd: bump to 0.9.39
Message-ID: <1424382270-15888-1-git-send-email-simon.marchi@polymtl.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to new version, and disable building examples.

Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 8cc7d59..2cf1a54 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	8df2b4dd863c98799a4775a530d905363fbc02fec850af9094da890b28b9e721	libmicrohttpd-0.9.38.tar.gz
+sha256	4f937b6065c366d776be86b1d24b8fc400ebc7ea006a9d77c49a8f2f0cd7e373	libmicrohttpd-0.9.39.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 0575b74..f90878d 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.38
+LIBMICROHTTPD_VERSION = 0.9.39
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-spdy
+LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-spdy --disable-examples
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
-- 
2.3.0
