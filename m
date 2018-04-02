From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 19:07:44 +0200
Subject: [Buildroot] [PATCH] waf: fix autobuilders
 #01d8c21df4baa9ecc6a0e45744fe6a4d086a0652
Message-ID: <20180402170744.23771-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package is host only and so the variable to use must be prefixed by
'HOST_'

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/waf/waf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 639c26a3b0..cb738a38fd 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -9,7 +9,7 @@ WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io/
 
 define HOST_WAF_EXTRACT_CMDS
-	$(INSTALL) -D -m 0755 $(WAF_DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
+	$(INSTALL) -D -m 0755 $(HOST_WAF_DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
 endef
 
 define HOST_WAF_INSTALL_CMDS
-- 
2.16.2
