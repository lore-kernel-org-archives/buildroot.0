From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 30 Apr 2016 10:33:07 +0200
Subject: [Buildroot] [PATCH] libtommath: add -fPIC
Message-ID: <1462005187-32394-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix build with x86_64, see http://autobuild.buildroot.net/results/212/212469db5dc8399070390603c0fdf7f12b130cda/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libtommath/libtommath.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 463ea7b..eb3b00e 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -13,7 +13,7 @@ LIBTOMMATH_INSTALL_STAGING = YES
 LIBTOMMATH_INSTALL_TARGET = NO  # only static library
 
 define LIBTOMMATH_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ $(TARGET_CFLAGS)"
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ -fPIC $(TARGET_CFLAGS)"
 endef
 
 define LIBTOMMATH_INSTALL_STAGING_CMDS
-- 
2.5.0
