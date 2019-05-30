From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 01:07:41 +0200
Subject: [Buildroot] [PATCH] package/libnss: security bump to version 3.42.1
Message-ID: <20190530230741.14323-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

(3.41) CVE-2018-12404: Cache side-channel variant of the Bleichenbacher
attack

(3.42.1) CVE-2018-18508: Add additional null checks to several CMS functions
to fix a rare CMS crash.  Thanks to Hanno B?ck and Damian Poddebniak for the
discovery and fixes

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 9c3cefd818..1d600f14ef 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_39_RTM/src/SHA256SUMS
-sha256	6be64dd76f212415cc8bc34343ac1e7389048db4db9a023a84873c411dc5864b  nss-3.39.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_42_1_RTM/src/SHA256SUMS
+sha256	087db37d38fd49dfd584dd2a8b5baa7fc88de7c9bd97c0c2d5be4abcafc61fc6  nss-3.42.1.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 73c9b08fd2..89d614fe1c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.39
+LIBNSS_VERSION = 3.42.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.11.0
