From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:16:11 +0100
Subject: [Buildroot] [git commit] tor: disable unit-tests
Message-ID: <20160308201615.7D13E80266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41a14f3e394f46bd098daf4a76283315e3ae452a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes following autobuild failure for aarch64:
http://autobuild.buildroot.net/results/13ef47c962afefbaa9ea7a95de083f885f1a8825/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tor/tor.mk | 1 +
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
