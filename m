From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 21:37:56 +0200
Subject: [Buildroot] [git commit] php: delete /usr/lib/php/build instead of
	/usr/lib/php
Message-ID: <20150519200603.CBA0081DD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec0404a9a426e866dff20bf11b33c06b90f9f85d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
