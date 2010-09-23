From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 Sep 2010 22:19:41 +0200
Subject: [Buildroot] [git commit master 1/1] hostapd: fix build without
	openssl
Message-ID: <20100923201957.0529A8B654@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=76c4fa0067efe72e970299be2cc116b3033adcb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hostapd/hostapd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index d826030..4065d7b 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -14,6 +14,7 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
 	# OpenSSL is required for EXTRA_EAP and/or WPS
 	# We take care of that in Config.in
+else
 define HOSTAPD_OPENSSL_CONF
 	echo "CONFIG_CRYPTO=internal" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(HOSTAPD_CONFIG)
-- 
1.7.1
