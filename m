From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Oct 2017 23:03:33 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libnss: bump to version
	3.31
Message-ID: <20171015205800.9BB937FA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff4d2c18b6553ed0f76cc2a74d6cf623164079b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes build with gcc 7.

https://hg.mozilla.org/projects/nss/rev/0dca14409fef

Fixes:
http://autobuild.buildroot.net/results/b71/b71e4e003ec5753708a07cfd04e3025c93f80e67/
http://autobuild.buildroot.net/results/66d/66d31923824d34df3b20a363a1346df1c00ae222/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b39e6dbed1536cb5dbd91724cc25df050d8dd54d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 7be7e48..e4e2428 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_30_2_RTM/src/SHA256SUMS
-sha256	0d4a77ff26bcee79fa8afe0125e0df6ae9e798b6b36782fa29e28febf7cfce24	nss-3.30.2.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_31_RTM/src/SHA256SUMS
+sha256	e90561256a3271486162c1fbe8d614d118c333d36a4455be2af8688bd420a65d	nss-3.31.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 3c38bb0..994db00 100644
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
