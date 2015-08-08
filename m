From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:05 -0000
Subject: [Buildroot] [git commit branch/next] php: delete /usr/lib/php/build
	instead of /usr/lib/php
Message-ID: <20150808105559.972527FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec0404a9a426e866dff20bf11b33c06b90f9f85d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes #8121

External PHP modules like the OPcache may live in
/usr/lib/php/extensions, so only delete /usr/lib/php/build

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 279ebf8..bc3794a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -295,7 +295,7 @@ endef
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_EXTENSIONS_FIXUP
 
 define PHP_INSTALL_FIXUP
-	rm -rf $(TARGET_DIR)/usr/lib/php
+	rm -rf $(TARGET_DIR)/usr/lib/php/build
 	rm -f $(TARGET_DIR)/usr/bin/phpize
 	$(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
 		$(TARGET_DIR)/etc/php.ini
