From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 15:46:37 +0100
Subject: [Buildroot] [git commit master 1/1] libcurl: security bump to 7.21.2
Message-ID: <20101119150035.6DE128D3CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1d6b9bcf9e70c44d9adb129d439b44f74438ab3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    6 +++---
 package/libcurl/libcurl.mk |    3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1cfe3b1..0dda539 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,9 +2,9 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: bash, bind, busybox, libglib2, libmad,
-	midori, module-init-tools, mtd-utils, openssh, pciutils, qt,
-	sqlite, sysstat, webkit
+	Updated/fixed packages: bash, bind, busybox, libglib2,
+	libcurl, libmad, midori, module-init-tools, mtd-utils,
+	openssh, pciutils, qt, sqlite, sysstat, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 782bfb3..ca293fb 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -3,12 +3,11 @@
 # libcurl
 #
 #############################################################
-LIBCURL_VERSION = 7.21.0
+LIBCURL_VERSION = 7.21.2
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download/
 LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
-LIBCURL_LIBTOOL_PATCH = NO
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
-- 
1.7.2.2
