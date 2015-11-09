From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2015 22:09:02 +0100
Subject: [Buildroot] [git commit] libnss: security bump to version 3.20.1
Message-ID: <20151109211747.C3A11819A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c02f2606cf576cbeff088f5ffd3521783d16516c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-7181 - A use-after-poison flaw was found in the way NSS parsed
certain ASN.1 structures. An attacker could use this flaw to cause NSS
to crash or execute arbitrary code with the permissions of the user
running an application compiled against the NSS library.
CVE-2015-7182 - A heap-based buffer overflow flaw was found in the way
NSS parsed certain ASN.1 structures. An attacker could use this flaw to
cause NSS to crash or execute arbitrary code with the permissions of the
user running an application compiled against the NSS library.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash |    4 ++--
 package/libnss/libnss.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 9e24786..68f50ea 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_20_RTM/src/SHA256SUMS
-sha256	5e38d4b9837ca338af966b97fc91c07f67ad647fb38dc4af3cfd0d84e477d15c	nss-3.20.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_20_1_RTM/src/SHA256SUMS
+sha256	ad3c8f11dfd9570c2d04a6140d5ef7c2bdd0fe30d6c9e5548721a4251a5e8c97	nss-3.20.1.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index f283bb3..a15fab2 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.20
+LIBNSS_VERSION = 3.20.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
