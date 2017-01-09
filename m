From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 17:18:04 +0100
Subject: [Buildroot] [git commit] libnss: bump to version 3.27.2
Message-ID: <20170109163505.514FA7F909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4a470ecad98c5fd49c4a22d0efca5f18bd16f3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a memory leak in SSL_SetTrustAnchors():
https://bugzilla.mozilla.org/show_bug.cgi?id=1318561

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index acc32e3..975e52d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_27_1_RTM/src/SHA256SUMS
-sha256	fd3637a1930cd838239a89633a7ed9a18859ae9b599043f3a18f726dc4ec2a6b	nss-3.27.1.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_27_2_RTM/src/SHA256SUMS
+sha256	dc8ac8524469d0230274fd13a53fdcd74efe4aa67205dde1a4a92be87dc28524	nss-3.27.2.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 931256c..4a40b0a 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.27.1
+LIBNSS_VERSION = 3.27.2
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
