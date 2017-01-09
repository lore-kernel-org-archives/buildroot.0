From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  9 Jan 2017 15:06:46 +0100
Subject: [Buildroot] [PATCH 2/2] libnss: bump to version 3.27.2
In-Reply-To: <20170109140646.29648-1-peter@korsgaard.com>
References: <20170109140646.29648-1-peter@korsgaard.com>
Message-ID: <20170109140646.29648-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a memory leak in SSL_SetTrustAnchors():
https://bugzilla.mozilla.org/show_bug.cgi?id=1318561

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index acc32e343..975e52d23 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_27_1_RTM/src/SHA256SUMS
-sha256	fd3637a1930cd838239a89633a7ed9a18859ae9b599043f3a18f726dc4ec2a6b	nss-3.27.1.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_27_2_RTM/src/SHA256SUMS
+sha256	dc8ac8524469d0230274fd13a53fdcd74efe4aa67205dde1a4a92be87dc28524	nss-3.27.2.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 931256c56..4a40b0a8d 100644
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
-- 
2.11.0
