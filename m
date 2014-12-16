From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Dec 2014 23:48:32 +0100
Subject: [Buildroot] [git commit] libnss: security bump to version 3.17.3
Message-ID: <20141216225030.76D3D7FD46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6efc256a7762ed388ca57d809ceb3fc9f6776b7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-1569 - The definite_length_decoder function in
lib/util/quickder.c in Mozilla Network Security Services (NSS) before
3.16.2.4 and 3.17.x before 3.17.3 does not ensure that the DER encoding
of an ASN.1 length is properly formed, which allows remote attackers to
conduct data-smuggling attacks by using a long byte sequence for an
encoding.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash |    4 ++--
 package/libnss/libnss.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 916aade..5664e93 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_2_RTM/src/
-sha256	134929e44e44b968a4883f4ee513a71ae45d55b486cee41ee8e26c3cc84dab8b	nss-3.17.2.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_3_RTM/src/
+sha256	f4d5e9035a2f84f25f35c283de3b0ff60d72e918748de25eaf017ed201fa21d5	nss-3.17.3.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 4e174f6..1737cd4 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.17.2
+LIBNSS_VERSION = 3.17.3
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
