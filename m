From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 22:02:50 +0200
Subject: [Buildroot] [git commit] php: fpm: remove sample status page
Message-ID: <20150519200603.AD5F57FD8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d21090dcef02b568cbf441b1cc2576fedf13774d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

php-fpm installs a sample status page to $datadir/fpm/status.html
It is not of any use in that directory, so remove it from target.
If someone wants to use it, he can copy it to webroot manually.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 6e0e216..3e4601e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -280,6 +280,8 @@ define PHP_INSTALL_FPM_CONF
 	$(INSTALL) -D -m 0644 package/php/php-fpm.conf \
 		$(TARGET_DIR)/etc/php-fpm.conf
 	rm -f $(TARGET_DIR)/etc/php-fpm.conf.default
+	# remove unused sample status page /usr/php/php/fpm/status.html
+	rm -rf $(TARGET_DIR)/usr/php
 endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FPM_CONF
