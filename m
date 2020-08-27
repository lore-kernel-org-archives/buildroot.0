From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:06:53 +0200
Subject: [Buildroot] [git commit branch/next] package/libnss: bump version
 to 3.56
Message-ID: <20200827210049.79AA884C70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1be3277baec5b3ccd64012ee837cb17d9a06f63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump version to 3.56. Unfortunately local patch is still pending
upstream and not applied and I've just asked why:
https://bugzilla.mozilla.org/show_bug.cgi?id=1642174

This version requires NSPR 4.28.

Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.56_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index fcba10b99a..b153b614e9 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_55_RTM/src/SHA256SUMS
-sha256  fc692e3db45a082ee6328cd989e795c171a00df9c518df090937f7604f850004  nss-3.55.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_56_RTM/src/SHA256SUMS
+sha256  f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c  nss-3.56.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index a5e4432f8c..effad11b5b 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.55
+LIBNSS_VERSION = 3.56
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
