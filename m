From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Sep 2014 09:48:04 -0300
Subject: [Buildroot] [PATCH] libnss: security bump to version 3.17.1
Message-ID: <1411649284-26008-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-1568 RSA signature forgery attack.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.hash | 3 +++
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/libnss/libnss.hash

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
-- 
1.8.5.5
