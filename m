From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 18:26:26 +0100
Subject: [Buildroot] [git commit] package/php: remove sample config in new
 location
Message-ID: <20191231171714.AA6B67F893@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d7b8fef0f36aeaa4a503d49e549494637189698
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the upstream php-fpm sample configuration is placed in

  /etc/php-fpm.d/www.conf.default

in recent version of php, so adjust the build cleanup
accordingly

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
[yann.morin.1998 at free.fr: only remove the file, not the directory]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index be35ed4456..682132fb59 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -343,7 +343,7 @@ endef
 define PHP_INSTALL_FPM_CONF
 	$(INSTALL) -D -m 0644 package/php/php-fpm.conf \
 		$(TARGET_DIR)/etc/php-fpm.conf
-	rm -f $(TARGET_DIR)/etc/php-fpm.conf.default
+	rm -f $(TARGET_DIR)/etc/php-fpm.d/www.conf.default
 	# remove unused sample status page /usr/php/php/fpm/status.html
 	rm -rf $(TARGET_DIR)/usr/php
 endef
