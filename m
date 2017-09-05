From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  5 Sep 2017 20:52:19 +0200
Subject: [Buildroot] [PATCH] libtommath: set PREFIX when installing
Message-ID: <20170905185219.9953-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the default value is /usr/local and causes breakage in libtomcrypt & moarvm
see http://autobuild.buildroot.net/results/a76/a760063f05ae23f79920bc89ffc37e7dcf77aeab/
see http://autobuild.buildroot.net/results/78c/78c9bc9a21cfce48615b70d80b25dd4847bd803b/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libtommath/libtommath.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 8e0b10ca2..ceb2e6846 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -17,7 +17,7 @@ define LIBTOMMATH_BUILD_CMDS
 endef
 
 define LIBTOMMATH_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" PREFIX=/usr install
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
