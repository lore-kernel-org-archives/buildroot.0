From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 09:16:28 +0100
Subject: [Buildroot] [git commit] libnss: security bump to version 3.39
Message-ID: <20181113081430.8BB6782765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c32e4c298d02ce7ca3c3551be8c31051dde7801
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

CVE-2018-12384: NSS responded to an SSLv2-compatible ClientHello with a
ServerHello that had an all-zero random.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 2a7ca2b065..9c3cefd818 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_38_RTM/src/SHA256SUMS
-sha256	2c643d3c08d6935f4d325f40743719b6990aa25a79ec2f8f712c99d086672f62  nss-3.38.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_39_RTM/src/SHA256SUMS
+sha256	6be64dd76f212415cc8bc34343ac1e7389048db4db9a023a84873c411dc5864b  nss-3.39.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0693f71ee6..73c9b08fd2 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.38
+LIBNSS_VERSION = 3.39
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
