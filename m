From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 21:17:05 +0200
Subject: [Buildroot] [git commit] package/fb-test-app: Install fb-test-string
Message-ID: <20210629184606.4958B8150B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccff6bff09438d5a88c70fdebd5d80201fe9de50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fb-test-app suite provides a simple app to draw text on a given frame buffer.
Install it as well.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fb-test-app/fb-test-app.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 1be59a4207..f6e949015e 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -18,6 +18,7 @@ define FB_TEST_APP_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/rect $(TARGET_DIR)/usr/bin/fb-test-rect
 	$(INSTALL) -D -m 0755 $(@D)/fb-test $(TARGET_DIR)/usr/bin/fb-test
 	$(INSTALL) -D -m 0755 $(@D)/offset $(TARGET_DIR)/usr/bin/fb-test-offset
+	$(INSTALL) -D -m 0755 $(@D)/fb-string $(TARGET_DIR)/usr/bin/fb-test-string
 endef
 
 $(eval $(generic-package))
