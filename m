From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Oct 2014 11:07:17 -0300
Subject: [Buildroot] [PATCH 1/2] polarssl: security bump to version 1.2.12
Message-ID: <1414418838-3487-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes several memory leaks.
No assigned CVE or Polar-SA yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polarssl/polarssl.hash | 5 ++---
 package/polarssl/polarssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
index ca437ac..9769788 100644
--- a/package/polarssl/polarssl.hash
+++ b/package/polarssl/polarssl.hash
@@ -1,3 +1,2 @@
-# From https://polarssl.org/tech-updates/releases/polarssl-1.2.11-released
-sha1	40cb3a833245273946c2075e6c948bbcda8a1be9	polarssl-1.2.11-gpl.tgz
-sha256	b3e9d059c687980976b468d8260f658e9003aede1dbc4a918526e90abdaa7d75	polarssl-1.2.11-gpl.tgz
+# From https://polarssl.org/tech-updates/releases/polarssl-1.2.12-released
+sha256	63dd60e78d25c438648607bb177b063dcf5fbf3ced9ee794fcb165d101940131	polarssl-1.2.12-gpl.tgz
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 21bf160..7c27505 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 POLARSSL_SITE = https://polarssl.org/code/releases
-POLARSSL_VERSION = 1.2.11
+POLARSSL_VERSION = 1.2.12
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
-- 
2.0.4
