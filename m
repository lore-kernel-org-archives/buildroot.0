From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 22:13:11 +0200
Subject: [Buildroot] [git commit branch/next] libnss: bump to version 3.14.3
Message-ID: <20130526205234.E42AF9A58B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d63d3dc3644ec65dbb0280af8d7a1854e5c4d33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnss/libnss.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 96faf37..8bb46e2 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -3,14 +3,17 @@
 # libnss
 #
 #############################################################
-LIBNSS_VERSION = 3.12.9
+
+LIBNSS_VERSION = 3.14.3
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE_VERSION = $(subst .,_,$(LIBNSS_VERSION))
-LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(LIBNSS_SITE_VERSION)_RTM/src/
+LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(LIBNSS_SITE_VERSION)_RTM/src
 LIBNSS_SUBDIR = mozilla/security
 LIBNSS_DISTDIR = mozilla/dist
 LIBNSS_INSTALL_STAGING = YES
 LIBNSS_DEPENDENCIES = libnspr sqlite zlib
+LIBNSS_LICENSE = MPLv2.0
+LIBNSS_LICENSE_FILES = mozilla/security/nss/COPYING
 
 LIBNSS_BUILD_VARS = MOZILLA_CLIENT=1 \
 		NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
