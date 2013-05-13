From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 May 2013 13:40:56 -0300
Subject: [Buildroot] [PATCH 3/6] libnss: bump to version 3.14.3
In-Reply-To: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1368463259-18958-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

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
-- 
1.8.1.5
