From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 13:14:13 +0100
Subject: [Buildroot] [git commit] libnss: security bump to version 3.22.2
Message-ID: <20160309121502.8FCC77FEB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09f0b8c353d6b7886dd5cab3deee0cc9625b6eed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-1950 - heap-based buffer overflow related to the parsing of
certain ASN.1 structures. An attacker could create a specially-crafted
certificate which, when parsed by NSS, would cause a crash or execution
of arbitrary code with the permissions of the user.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 6e4d330..143e1d8 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_22_1_RTM/src/SHA256SUMS
-sha256	89e1fc7074e5c325962821289f4cd7d8207ae95af2308ba881215ed9ca68fa4f	nss-3.22.1.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_22_2_RTM/src/SHA256SUMS
+sha256	07d49287c527ac31200f02dcf8494cef19e936d8ed470802749c4dfc782d3650	nss-3.22.2.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index c474f61..18dc62c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.22.1
+LIBNSS_VERSION = 3.22.2
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
