From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 7 Mar 2016 14:46:48 +0100
Subject: [Buildroot] [PATCH v2] tor: disable unit-tests
Message-ID: <20160307134648.GA30653@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following autobuild failure for aarch64:
http://autobuild.buildroot.net/results/13ef47c962afefbaa9ea7a95de083f885f1a8825/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - disable unit tests globally, suggested by Thomas Petazzoni
---
 package/tor/tor.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index f6874a6..6a622cf 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -13,6 +13,7 @@ TOR_AUTORECONF = YES
 
 TOR_CONF_OPTS = \
 	--disable-gcc-hardening \
+	--disable-unittests \
 	--with-libevent-dir=$(STAGING_DIR)/usr \
 	--with-openssl-dir=$(STAGING_DIR)/usr \
 	--with-zlib-dir=$(STAGING_DIR)/usr
-- 
1.7.10.4
