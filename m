From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Feb 2015 09:57:44 -0300
Subject: [Buildroot] [PATCH 2/2] libnss: bump to version 3.17.4
In-Reply-To: <1424177864-24520-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424177864-24520-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1424177864-24520-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 5664e93..1f76f03 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_3_RTM/src/
-sha256	f4d5e9035a2f84f25f35c283de3b0ff60d72e918748de25eaf017ed201fa21d5	nss-3.17.3.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_4_RTM/src/SHA256SUMS
+sha256	1d98ad1881a4237ec98cbe472fc851480f0b0e954dfe224d047811fb96ff9d79	nss-3.17.4.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index ea28e5c..db272b3 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.17.3
+LIBNSS_VERSION = 3.17.4
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
@@ -37,7 +37,6 @@ LIBNSS_BUILD_VARS += USE_64=1
 endif
 endif
 
-
 define LIBNSS_BUILD_CMDS
 	$(MAKE1) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
-- 
2.0.5
