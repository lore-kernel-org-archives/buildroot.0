From: David GOUARIN <dgouarin@gmail.com>
Date: Tue, 13 Oct 2020 18:28:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/librelp: bump to version 1.8.0
Message-ID: <20201013162845.29622-1-dgouarin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1.8.0 adds support for both openssl and gnutls

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
---
 package/librelp/librelp.hash | 2 +-
 package/librelp/librelp.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/librelp/librelp.hash b/package/librelp/librelp.hash
index ac08039b53..bd66ad7db0 100644
--- a/package/librelp/librelp.hash
+++ b/package/librelp/librelp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a34c8fc98bf8eef2a5baf635a0f71813cce93b1185aa03648e31b5af60b7393f  librelp-1.2.18.tar.gz
+sha256  cdbf49115fa530247358489864c5971c9f5a6442d19490e38f4c4ef844f1c264  librelp-1.8.0.tar.gz
 sha256  1ed76f935566e93e3c3c0d9f8fad22eb6d8bbe406e2eb8470a4a2764d9fd9685  COPYING
diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
index bcb4fe0ea1..e9e879d1f6 100644
--- a/package/librelp/librelp.mk
+++ b/package/librelp/librelp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRELP_VERSION = 1.2.18
+LIBRELP_VERSION = 1.8.0
 LIBRELP_SITE = http://download.rsyslog.com/librelp
 LIBRELP_LICENSE = GPL-3.0+
 LIBRELP_LICENSE_FILES = COPYING
@@ -17,4 +17,11 @@ else
 LIBRELP_CONF_OPTS += --disable-tls
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_OPENSSL),y)
+LIBRELP_DEPENDENCIES += openssl host-pkgconf
+LIBRELP_CONF_OPTS += --enable-tls-openssl
+else
+LIBRELP_CONF_OPTS += --disable-tls-openssl
+endif
+
 $(eval $(autotools-package))
-- 
2.17.1
