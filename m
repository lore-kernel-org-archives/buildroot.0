From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  7 Sep 2020 23:03:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongrel2: enable parallel build
Message-ID: <20200907210346.297682-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parallel build is fixed since version 1.9.2 and
https://github.com/mongrel2/mongrel2/commit/375d2de08934807f7171c413f785a9a23db712d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongrel2/mongrel2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index a35a87248e..9a7f64a738 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -29,12 +29,12 @@ MONGREL2_POST_CONFIGURE_HOOKS += MONGREL2_POLARSSL_DISABLE_ASM
 endif
 
 define MONGREL2_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		PREFIX=/usr all
 endef
 
 define MONGREL2_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
-- 
2.28.0
