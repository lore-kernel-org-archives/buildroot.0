From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 16:29:06 +0200
Subject: [Buildroot] [PATCH 1/1] whois: bump to version 5.3.0
Message-ID: <20180520142906.13060-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- libidn1 support has been removed:
  https://github.com/rfc1036/whois/commit/5d60bbe102b71c03b9a46eb0a7aada3532bd4481
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/whois/whois.hash | 7 +++++--
 package/whois/whois.mk   | 9 ++-------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 29623b529f..635066c5e3 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20170727T214450Z/pool/main/w/whois/whois_5.2.17.dsc
-sha256	257585678f571e18964667b41dc6543fe9da6123ac95743660c9c3ae1eba9664	whois_5.2.17.tar.xz
+# From http://snapshot.debian.org/archive/debian/20180121T094839Z/pool/main/w/whois/whois_5.3.0.dsc
+sha256	4d789c403bfb5833c8ae168a5f31be70e34b045bd5d95a54c82a27b0ff135723	whois_5.3.0.tar.xz
+
+# Hash for license file:
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 18071ab6bd..5cd7cde7fd 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.17
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20170727T214450Z/pool/main/w/whois
+WHOIS_VERSION = 5.3.0
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20180121T094839Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox) $(TARGET_NLS_DEPENDENCIES)
@@ -22,11 +22,6 @@ WHOIS_EXTRA_LIBS += -liconv
 WHOIS_MAKE_ENV += HAVE_ICONV=1
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIDN),y)
-WHOIS_DEPENDENCIES += libidn
-WHOIS_MAKE_ENV += HAVE_LIBIDN=1
-endif
-
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 WHOIS_DEPENDENCIES += libidn2
 WHOIS_MAKE_ENV += HAVE_LIBIDN2=1
-- 
2.14.1
