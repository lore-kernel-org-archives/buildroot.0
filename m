From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Oct 2016 20:48:22 +0300
Subject: [Buildroot] [PATCH] wireshark: don't overwrite WIRESHARK_CONF_ENV
Message-ID: <9e25b589e9e2dc462aeacc3a56f77903cf110ac7.1476985702.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 5b5abf2e6a05..227ead6a926e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -78,7 +78,7 @@ WIRESHARK_CONF_OPTS += --with-gnutls=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+WIRESHARK_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 WIRESHARK_CONF_OPTS += --with-gcrypt=yes
 WIRESHARK_DEPENDENCIES += libgcrypt
 else
-- 
2.9.3
