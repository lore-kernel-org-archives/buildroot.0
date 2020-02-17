From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 17 Feb 2020 14:52:11 +0200
Subject: [Buildroot] [PATCH] package/fail2ban: fix python3 2to3 dependency
Message-ID: <618874172809ae3de7cd82f6b27141c1ba13c806.1581943931.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 2to3 utility is needed in the patch phase. Use the correct
dependency for that.

Fixes:
http://autobuild.buildroot.net/results/dd8e225e2a49cfa6735bed11459007003a37c137/
http://autobuild.buildroot.net/results/e688c3652bd474ac682984e2e5947701942f0f57/

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/fail2ban/fail2ban.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 6f023b48a181..0f8e5ab6e694 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -14,7 +14,7 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define FAIL2BAN_PYTHON_2TO3
 	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
 endef
-FAIL2BAN_DEPENDENCIES += host-python3
+FAIL2BAN_PATCH_DEPENDENCIES += host-python3
 FAIL2BAN_POST_PATCH_HOOKS += FAIL2BAN_PYTHON_2TO3
 endif
 
-- 
2.25.0
