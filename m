From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 13:22:39 +0200
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.55
Message-ID: <20200727111954.700DF8153D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00b7abf7ebb929f32c4e3b7ec64c6f6b14fa3fcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to 3.55. Unfortunately local patch is still pending
upstream and not applied and I've just asked why:
https://bugzilla.mozilla.org/show_bug.cgi?id=1642174

This version requires NSPR 4.27.

Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.55_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnss/libnss.hash | 6 +++---
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index aedc0669de..fcba10b99a 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_54_RTM/src/SHA256SUMS
-sha256	dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43  nss-3.54.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_55_RTM/src/SHA256SUMS
+sha256  fc692e3db45a082ee6328cd989e795c171a00df9c518df090937f7604f850004  nss-3.55.tar.gz
 # Locally calculated
-sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
+sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
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
