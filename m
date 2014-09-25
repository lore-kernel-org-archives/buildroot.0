From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Sep 2014 21:41:07 +0200
Subject: [Buildroot] [git commit] libnss: security bump to version 3.17.1
Message-ID: <20140925195145.7C35C9D781@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0901d9049e600298ec1ae4b2d1c600bebfb8ae08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-1568 RSA signature forgery attack.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash |    3 +++
 package/libnss/libnss.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
new file mode 100644
index 0000000..8c9420c
--- /dev/null
+++ b/package/libnss/libnss.hash
@@ -0,0 +1,3 @@
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_1_RTM/src/
+sha1	32347d8b476efa5c7a4cfa21f8e5a1d0d89942ea	nss-3.17.1.tar.gz
+sha256	0e210afba7cd1e033a08f61fcd1f466639649fc413e72aa050f3d52c19376e5f	nss-3.17.1.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index a822726..066606f 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.17
+LIBNSS_VERSION = 3.17.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
