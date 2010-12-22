From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] libxml2: bump to version 2.7.8
Message-ID: <20101222232250.161748E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9e9213f11219e588f5759955c5731bfa0f1ed172
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump libxml2 to version 2.7.8.
Re-enable libtool patch now that we handle libtool2 in package infra.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxml2/libxml2.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 387dce3..d07f631 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -3,13 +3,10 @@
 # libxml2
 #
 #############################################################
-LIBXML2_VERSION = 2.7.7
-LIBXML2_SOURCE = libxml2-sources-$(LIBXML2_VERSION).tar.gz
+
+LIBXML2_VERSION = 2.7.8
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
-LIBXML2_INSTALL_TARGET = YES
-#this is needed for version 2.7.4 and higher
-LIBXML2_LIBTOOL_PATCH = NO
 
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
-- 
1.7.2.2
