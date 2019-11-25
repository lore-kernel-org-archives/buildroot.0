From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Nov 2019 15:14:23 +0100
Subject: [Buildroot] [git commit] package/libnss: security bump to version
 3.47.1
Message-ID: <20191125140641.A5B2A82A05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f49de1c4d35a12364f00b931edccf831c51ff4c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:
CVE-2019-11745: EncryptUpdate should use maxout, not block size

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 2 +-
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 92d6fd3908..518d95d842 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
 # From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_46_1_RTM/src/SHA256SUMS
-sha256	6cd0c4438b616bdacc0b5f25ff1506b0d07ee97ea6c95d514c5487200a155fa7  nss-3.47.tar.gz
+sha256	1ae3d1cb1de345b258788f2ef6b10a460068034c3fd64f42427a183d8342a6fb  nss-3.47.1.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index ca1cde4c1c..747612c795 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.47
+LIBNSS_VERSION = 3.47.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
