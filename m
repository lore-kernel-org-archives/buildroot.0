From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Jun 2017 13:34:57 +0300
Subject: [Buildroot] [PATCH 2/2] libnss: bump to version 3.31
In-Reply-To: <6ba94c95ef12b7c3337ebb5ead42c6870e8aa545.1497522897.git.baruch@tkos.co.il>
References: <6ba94c95ef12b7c3337ebb5ead42c6870e8aa545.1497522897.git.baruch@tkos.co.il>
Message-ID: <e68809c7cd8279fd44758b217d488bb02a1e1d31.1497522897.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build with gcc 7.

https://hg.mozilla.org/projects/nss/rev/0dca14409fef

Fixes:
http://autobuild.buildroot.net/results/b71/b71e4e003ec5753708a07cfd04e3025c93f80e67/
http://autobuild.buildroot.net/results/66d/66d31923824d34df3b20a363a1346df1c00ae222/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 7be7e48a6951..e4e24283cb29 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_30_2_RTM/src/SHA256SUMS
-sha256	0d4a77ff26bcee79fa8afe0125e0df6ae9e798b6b36782fa29e28febf7cfce24	nss-3.30.2.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_31_RTM/src/SHA256SUMS
+sha256	e90561256a3271486162c1fbe8d614d118c333d36a4455be2af8688bd420a65d	nss-3.31.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 1e157df1df3c..51559295efd4 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.30.2
+LIBNSS_VERSION = 3.31
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.11.0
