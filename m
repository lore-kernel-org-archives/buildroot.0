From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 22:53:26 +0200
Subject: [Buildroot] [git commit] package/apache: move
 APACHE_FIXUP_APR_LIBTOOL to post-prepare hook
Message-ID: <20210706204015.382CA92C93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bfe74433aef3fb26f3d08777a78a78e5e6d7f3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

APACHE_FIXUP_APR_LIBTOOL tweaks files for per package directory build.
This is typically the kind of operation expected to be in
post-prepare hook.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apache/apache.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 7dbd1a4512..dc66cd660e 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -23,7 +23,7 @@ define APACHE_FIXUP_APR_LIBTOOL
 	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apache/@g" \
 		$(STAGING_DIR)/usr/build-1/libtool
 endef
-APACHE_POST_CONFIGURE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
+APACHE_POST_PREPARE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
 endif
 
 APACHE_CONF_ENV= \
