From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 21 Sep 2020 09:44:36 +0200
Subject: [Buildroot] [PATCH 2/2] package/libnss: bump version to 3.57
In-Reply-To: <20200921074436.213451-1-giulio.benetti@benettiengineering.com>
References: <20200921074436.213451-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200921074436.213451-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 3.57. Unfortunately local patch is still pending
upstream and not applied due to Covid-19 latency:
https://bugzilla.mozilla.org/show_bug.cgi?id=1642174

This version requires NSPR 4.29.

Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.57_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index b153b614e9..e3b584351e 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_56_RTM/src/SHA256SUMS
-sha256  f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c  nss-3.56.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_57_RTM/src/SHA256SUMS
+sha256  55a86c01be860381d64bb4e5b94eb198df9b0f098a8af0e58c014df398bdc382  nss-3.57.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index d0b2d51772..21cd65cb8f 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.56
+LIBNSS_VERSION = 3.57
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1
