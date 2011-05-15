From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 May 2011 10:05:24 +0200
Subject: [Buildroot] [git commit] hostapd: add support for libnl-2.0
Message-ID: <20110515080536.2899483522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3a7495c2fbd1ddc923dcc7074f690ffc1d81c82e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hostapd/hostapd.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 4c95066..f097e75 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -10,6 +10,10 @@ HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = libnl
 
+define HOSTAPD_LIBNL_CONFIG
+	echo "CONFIG_LIBNL20=y" >>$(HOSTAPD_CONFIG)
+endef
+
 define HOSTAPD_CRYPTO_CONFIG
 	echo "CONFIG_CRYPTO=internal" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(HOSTAPD_CONFIG)
@@ -82,6 +86,7 @@ define HOSTAPD_CONFIGURE_CMDS
 	$(HOSTAPD_RADIUS_IPV6_CONFIG)
 	$(HOSTAPD_EAP_CONFIG)
 	$(HOSTAPD_WPS_CONFIG)
+	$(HOSTAPD_LIBNL_CONFIG)
 endef
 
 define HOSTAPD_INSTALL_TARGET_CMDS
-- 
1.7.3.4
