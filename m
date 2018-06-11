From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 11 Jun 2018 14:42:25 -0700
Subject: [Buildroot] [PATCH 1/1] libnss: bump to version 3.37.3
Message-ID: <20180611214225.22966-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/fd64ee3486f9045dfbd83908b8f06ef62c0d9781/
http://autobuild.buildroot.net/results/698500a92688c50e9cc71cf82c0848cb4adb81ad/
http://autobuild.buildroot.net/results/adaa2f79b202cb01ae57fa0cdb0eac9c07b22ea2/
Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index fa145c91f2..2b79901a7c 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_35_RTM/src/SHA256SUMS
-sha256	5821969e85d241833e96cb82bd4211ddea6d87003f2cccce25e0eab4aefa6268  nss-3.37.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_37_3_RTM/src/SHA256SUMS
+sha256	9af2bbb615d010bd866bb83f8c0bb22b0fa086171e93030ffb03da3da15cc5be  nss-3.37.3.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 053c09f7dc..dd84aafcbe 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.37
+LIBNSS_VERSION_MAJOR = 3.37
+LIBNSS_VERSION = $(LIBNSS_VERSION_MAJOR).3
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.17.1
