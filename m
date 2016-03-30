From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Mar 2016 16:51:07 -0300
Subject: [Buildroot] [PATCH] nss: security bump to version 3.23
Message-ID: <1459367467-19835-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-1950 - Fixed a heap-based buffer overflow related to the
parsing of certain ASN.1 structures. An attacker could create a
specially-crafted certificate which, when parsed by NSS, would cause a
crash or execution of arbitrary code with the permissions of the user.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 143e1d8..8e03faf 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_22_2_RTM/src/SHA256SUMS
-sha256	07d49287c527ac31200f02dcf8494cef19e936d8ed470802749c4dfc782d3650	nss-3.22.2.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_23_RTM/src/SHA256SUMS
+sha256	94b383e31c9671e9dfcca81084a8a813817e8f05a57f54533509b318d26e11cf	nss-3.23.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 18dc62c..e2bbf1f 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.22.2
+LIBNSS_VERSION = 3.23
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.7.3
