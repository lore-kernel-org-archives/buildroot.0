From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 26 Jul 2020 02:53:33 +0200
Subject: [Buildroot] [PATCH 2/2] package/libnss: bump version to 3.55
In-Reply-To: <20200726005333.340972-1-giulio.benetti@benettiengineering.com>
References: <20200726005333.340972-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200726005333.340972-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 3.55. Unfortunately local patch is still pending
upstream and not applied and I've just asked why:
https://bugzilla.mozilla.org/show_bug.cgi?id=1642174

This version requires NSPR 4.27.

Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.55_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index aedc0669de..08ba914d9d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_54_RTM/src/SHA256SUMS
-sha256	dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43  nss-3.54.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_55_RTM/src/SHA256SUMS
+sha256	fc692e3db45a082ee6328cd989e795c171a00df9c518df090937f7604f850004  nss-3.55.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 8bf7f0d85d..a5e4432f8c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.54
+LIBNSS_VERSION = 3.55
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1
