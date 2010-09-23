From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 Sep 2010 22:23:40 +0200
Subject: [Buildroot] [git commit master 1/1] wpa_supplicant: fix build
	without openssl
Message-ID: <20100923202406.41BA78B657@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b5fe8cbe7f712a8f47a63bfd729c45a15baedd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/wpa_supplicant.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index a01ac4b..9881c76 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -23,7 +23,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
 define WPA_SUPPLICANT_CRYPTO_CONFIG
-	$(SED) "s/^CONFIG_EAP_*/#CONFIG_EAP_/g" $(WPA_SUPPLICANT_CONFIG) \
+	$(SED) "s/^CONFIG_EAP_*/#CONFIG_EAP_/g" $(WPA_SUPPLICANT_CONFIG)
 	echo "CONFIG_TLS=none" >>$(WPA_SUPPLICANT_CONFIG)
 endef
 else
@@ -34,7 +34,7 @@ define WPA_SUPPLICANT_CRYPTO_CONFIG
 endef
 else
 define WPA_SUPPLICANT_CRYPTO_CONFIG
-	echo "CONFIG_TLS=internal" >>$(WPA_SUPPLICANT_CONFIG) \
+	echo "CONFIG_TLS=internal" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(WPA_SUPPLICANT_CONFIG)
 endef
 endif
-- 
1.7.1
